package com.mx.cam.std.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alipay.api.AlipayClient;
import com.alipay.api.request.AlipayTradeQueryRequest;
import com.alipay.api.response.AlipayTradeQueryResponse;
import com.mx.cam.common.common.CommonUtils;
import com.mx.cam.common.common.ConfigListener;
import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.pay.XMLParser;
import com.mx.cam.common.init.controller.InitDataBySystemStart;
import com.mx.cam.common.init.model.CloseOrderParm;
import com.mx.cam.common.init.model.PayAccount;
import com.mx.cam.net.conf.PEUSystem;
import com.mx.cam.net.service.PEUSystemOrder;
import com.mx.cam.std.dao.StdOrderDao;
import com.mx.cam.std.dao.StdOrderItemDao;
import com.mx.cam.std.model.Order;
import com.mx.cam.std.model.OrderItem;
import com.mx.cam.std.service.StdOrderService;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;

/**
 * 订单管理Service
 * 
 * @author zhengy
 * 
 */
@Service("stdOrderService")
@Transactional("shop")
public class StdOrderServiceImpl implements StdOrderService {

	private static Log logger = LogFactory.getLog(StdOrderServiceImpl.class);

	@Autowired
	private StdOrderDao stdOrderDao;
	@Autowired
	private StdOrderItemDao stdOrderItemDao;

	/**
	 * 查询订单管理列表
	 */
	@Override
	public Object getOrderManage(Order bean) throws Exception {

		// 查询订单管理列表
		List<Order> list = stdOrderDao.getOrderManage(bean);
		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;
	}

	/**
	 * 同步订单状态
	 */
	@Override
	public Object syncTradeState(String order_id) throws Exception {

		JSONObject json = new JSONObject();

		Order order = stdOrderDao.getOrder(order_id);

		if (order != null) {
			if ("wechat".equals(order.getPayment_mode_id())) {
				json = syncWechatTradeState(order);
			} else if ("alipay".equals(order.getPayment_mode_id())) {
				json = syncAlipayTradeState(order);
			} else if("cardpay".equals(order.getPayment_mode_id())){
				json = syncCardTradeState(order);
			}else {
				// -210支付方式不支持同步
				json.put("respCode", Constants.RESPCODE_ERR_SYNC);
			}
		} else {
			// 验证失败-101
			json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
		}
		return json;
	}

	/**
	 * 同步微信订单状态
	 */

	private JSONObject syncWechatTradeState(Order order) throws Exception {

		JSONObject json = new JSONObject();

		List<OrderItem> list = stdOrderItemDao
				.getOrderItem(order.getOrder_id());

		List<PayAccount> payParmList = InitDataBySystemStart.getWeixinMap();

		PayAccount payParm = new PayAccount();
		for (int i = 0; i < payParmList.size(); i++) {
			if (list.get(0).getProduct_id()
					.equals(payParmList.get(i).getProduct_id())) {
				payParm = payParmList.get(i);
			}
		}

		CloseOrderParm bean = new CloseOrderParm();
		bean.setAppid(payParm.getAppid());
		bean.setMch_id(payParm.getMch_id());
		bean.setOut_trade_no(order.getOrder_id());
		bean.setNonce_str(order.getOrder_id());
		bean.setSign();

		XStream xStreamForRequestPostData = new XStream(new DomDriver("UTF-8",
				new XmlFriendlyNameCoder("-_", "_")));
		String postDataXML = xStreamForRequestPostData.toXML(bean);
		logger.debug("wechatParm : " + postDataXML);

		URL url = new URL("https://api.mch.weixin.qq.com/pay/orderquery");
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		// 代理开关
		if (ConfigListener.getProduceSysConfig().isOnOff()) {
			// 代理
			Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress(
					"192.168.2.18", 8080));
			connection = (HttpURLConnection) url.openConnection(proxy);
		}
		connection.setRequestMethod("POST");
		connection.setDoOutput(true);
		PrintWriter out = new PrintWriter(new OutputStreamWriter(
				connection.getOutputStream(), "utf-8"));
		out.print(postDataXML);
		out.close();
		BufferedReader in = new BufferedReader(new InputStreamReader(
				connection.getInputStream(), "utf-8"));
		String line;
		String xml = "";
		while ((line = in.readLine()) != null) {
			xml += line;
		}

		in.close();
		logger.debug("wechatReturn : " + xml);
		Map<String, Object> map = XMLParser.getMapFromXML(xml);
		String return_code = URLEncoder.encode((String) map.get("return_code"),
				"utf-8");

		// 查询微信订单成功
		if ("SUCCESS".equals(return_code)) {
			String result_code = URLEncoder.encode(
					(String) map.get("result_code"), "utf-8");
			if ("SUCCESS".equals(result_code)) {
				String trade_state = URLEncoder.encode(
						(String) map.get("trade_state"), "utf-8");

				if (!trade_state.equals(order.getTrade_state())) {
					String order_state_id = "";
					String time_end = "";
					if ("SUCCESS".equals(trade_state)) {
						// 支付成功
						order_state_id = "2";
						SimpleDateFormat format = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");
						SimpleDateFormat df = new SimpleDateFormat(
								"yyyyMMddHHmmss");
						time_end = URLEncoder.encode(
								(String) map.get("time_end"), "utf-8");
						time_end = format.format(df.parse(time_end));
						// 设定权限
						setDataAuth(order.getOrder_id());
					} else if ("CLOSED".equals(trade_state)) {
						// 已关闭
						order_state_id = "3";
						// 微信不存在退款情况，无需做撤销权限处理
					} else {
						// 未支付
						order_state_id = "1";
						// 微信不存在退款情况，无需做撤销权限处理
					}
					Order orderBean = new Order();
					orderBean.setOrder_id(order.getOrder_id());
					orderBean.setTrade_state(trade_state);
					orderBean.setOrder_state_id(order_state_id);
					orderBean.setPayment_time(time_end);
					stdOrderDao.updateOrder(orderBean);

					order = stdOrderDao.getOrder(order.getOrder_id());
				}

				json.put("respCode", Constants.RESPCODE_SUCCESS);
				json.put("data", order);
			} else {
				// 查询微信订单失败-101
				json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
			}
		} else {
			// 查询微信订单失败-101
			json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
		}
		return json;
	}

	/**
	 * 同步支付宝订单状态
	 */
	private JSONObject syncAlipayTradeState(Order order) throws Exception {

		JSONObject json = new JSONObject();

		List<OrderItem> list = stdOrderItemDao
				.getOrderItem(order.getOrder_id());

		AlipayClient alipayClient = (AlipayClient) InitDataBySystemStart
				.getAlipayMap().get(list.get(0).getProduct_id())
				.get("alipayClient");
		AlipayTradeQueryRequest request = new AlipayTradeQueryRequest();
		String biz_content = "{\"out_trade_no\":\"" + order.getOrder_id()
				+ "\"}";

		request.setBizContent(biz_content);
		AlipayTradeQueryResponse response = null;

		response = alipayClient.execute(request);
		logger.debug(response.getBody());
		logger.debug(response.getCode());

		if (null != response && response.isSuccess()) {
			logger.debug("买家账号：" + response.getBuyerLogonId());
			logger.debug("商户订单号：" + response.getOutTradeNo());
			logger.debug("支付宝交易号：" + response.getTradeNo());
			logger.debug("总金额：" + response.getTotalAmount());
			logger.debug("订单状态：" + response.getTradeStatus());

			if ("10000".equals(response.getCode())) {
				if (!order.getTrade_state().equals(response.getTradeStatus())) {
					String order_state_id = "";
					String time_end = "";
					if ("TRADE_SUCCESS".equals(response.getTradeStatus())
							|| "TRADE_FINISHED".equals(response
									.getTradeStatus())) {
						// 支付成功
						order_state_id = "2";
						// 同步支付时间
						if (!"".equals(order.getPayment_time())
								&& order.getPayment_time() != null) {
							time_end = order.getPayment_time();
						} else {
							SimpleDateFormat format = new SimpleDateFormat(
									"yyyy-MM-dd HH:mm:ss");
							time_end = format.format(new Date());
						}
						// 设定权限
						setDataAuth(order.getOrder_id());
					} else if ("TRADE_CLOSED".equals(response.getTradeStatus())) {
						// 已关闭（退款）
						order_state_id = "3";
					} else {
						// 未支付
						order_state_id = "1";
					}
					Order orderBean = new Order();
					orderBean.setOrder_id(order.getOrder_id());
					orderBean.setTrade_state(response.getTradeStatus());
					orderBean.setOrder_state_id(order_state_id);
					orderBean.setPayment_time(time_end);
					stdOrderDao.updateOrder(orderBean);
					order = stdOrderDao.getOrder(order.getOrder_id());
				}
			}
		}
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("data", order);

		return json;
	}

	/**
	 * 同步刮刮卡订单状态
	 */
	private JSONObject syncCardTradeState(Order order) throws Exception {

		JSONObject json = new JSONObject();

		//调用生产系统接口
		Map<String, String> param = new HashMap<String, String>();
		JSONObject obj = new JSONObject();
		obj.put("orderid", order.getOrder_id());
		param.put("param", URLEncoder.encode(obj.toString(), "UTF-8"));
		Map params =PEUSystemOrder.api.getCardPay(PEUSystem.CGI.getOrderState(), param).execute().body();
		
		int respCode = Integer.valueOf(String.valueOf(params.get("respcode")));

		if (respCode == Constants.RESPCODE_SUCCESS) {
			// 支付状态
			int trade_state = Integer.valueOf(String.valueOf(params.get("trade_state")));
			String payment_time = String.valueOf(params.get("payment_time"));
			if (!order.getTrade_state().equals(String.valueOf(trade_state))&&trade_state== Constants.RESPCODE_SUCCESS) {
				//支付成功
				Order orderBean = new Order();
				orderBean.setOrder_id(order.getOrder_id());
				orderBean.setTrade_state(String.valueOf(trade_state));
				orderBean.setOrder_state_id("2");
				orderBean.setPayment_time(payment_time);
				stdOrderDao.updateOrder(orderBean);
				order = stdOrderDao.getOrder(order.getOrder_id());
				// 设定权限
				setDataAuth(order.getOrder_id());
			}
		}
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("data", order);

		return json;
	}
	
	/**
	 * 设置权限
	 * 
	 * @param order_id
	 * @throws Exception
	 */
	private void setDataAuth(String order_id) throws Exception {
		// 查询订单详细
		Order bean = stdOrderDao.getOrder(order_id);
		// 查询订单详细
		List<OrderItem> list = stdOrderItemDao.getOrderItem(order_id);

		JSONObject json = new JSONObject();
		json.put("businessMode", 3);
		json.put("orderId", order_id);
		// json.put("orderCount", "");
		json.put("createTime", bean.getCreat_time());
		json.put("source", 1);
		// json.put("deviceType", "");
		json.put("productSeries", list.get(0).getProduct_id());
		json.put("authType", 2);

		JSONArray array = new JSONArray();
		JSONObject obj = new JSONObject();
		obj.put("deviceNo", bean.getDevice_no());
		array.add(obj);
		json.put("deviceInfos", array);

		JSONObject dataUpg = new JSONObject();
		String upgDuration = "";
		if ("-1".equals(list.get(0).getValid())) {
			upgDuration = "-1";
		} else {
			upgDuration = list.get(0).getValid() + "|2";
		}
		dataUpg.put("upgDuration", upgDuration);
		dataUpg.put("upgTimes", Integer.parseInt(list.get(0).getNums()));
		dataUpg.put("areaCode", list.get(0).getRegion_ids());
		// dataUpg.put("softVer", "");
		dataUpg.put("dataVer", list.get(0).getData_ver());
		// SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		// dataUpg.put("actTime",df.format(new Data()));
		//dataUpg.put("actWay", 0);
		dataUpg.put("authRule", Integer.parseInt(list.get(0).getCombo_type()));
		json.put("dataUpg", dataUpg);
		//方案公司ID
		json.put("schemeId", list.get(0).getScheme_id());

		logger.debug("消息队列JSON:" + json.toString());
		CommonUtils.push(json.toString());

	}

}

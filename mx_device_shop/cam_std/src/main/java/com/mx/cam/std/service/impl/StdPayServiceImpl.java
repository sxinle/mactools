package com.mx.cam.std.service.impl;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
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

import com.mx.cam.common.common.AlipayNotify;
import com.mx.cam.common.common.CommonUtils;
import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.PayUtils;
import com.mx.cam.common.common.RandomGUID;
import com.mx.cam.common.common.pay.XMLParser;
import com.mx.cam.common.init.model.Notify;
import com.mx.cam.net.conf.PEUSystem;
import com.mx.cam.net.service.PEUSystemOrder;
import com.mx.cam.std.dao.StdOrderDao;
import com.mx.cam.std.dao.StdOrderItemDao;
import com.mx.cam.std.dao.StdPayDao;
import com.mx.cam.std.model.GoodsComboWeb;
import com.mx.cam.std.model.GoodsGroupWeb;
import com.mx.cam.std.model.GoodsItem;
import com.mx.cam.std.model.GoodsWeb;
import com.mx.cam.std.model.Order;
import com.mx.cam.std.model.OrderItem;
import com.mx.cam.std.model.PaymentMode;
import com.mx.cam.std.model.PaymentModeWeb;
import com.mx.cam.std.service.StdPayService;

@Service("stdPayService")
@Transactional("shop")
public class StdPayServiceImpl implements StdPayService {

	private static Log logger = LogFactory.getLog(StdPayServiceImpl.class);

	@Autowired
	private StdPayDao stdPayDao;
	@Autowired
	private StdOrderDao stdOrderDao;
	@Autowired
	private StdOrderItemDao stdOrderItemDao;

	/**
	 * 获取商品信息列表(Web接口用)
	 */
	@Override
	public Object getGoodsList(String product_id) throws Exception {
		logger.info("Service ==> getGoodsList");
		JSONObject json = new JSONObject();
		// 查询商品表明细
		List<GoodsWeb> list = stdPayDao.getGoodsWebList(product_id);
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				// 商品为组合商品
				if ("1".equals(String.valueOf(list.get(i).getGroupFlag()))) {
					// 查询组合商品明细
					List<GoodsGroupWeb> groupList = stdPayDao
							.getGoodsGroupWebList(list.get(i).getGoodsId());
					list.get(i).setSubGoodsList(groupList);
				}
			}
			json.put("respCode", Constants.RESPCODE_SUCCESS);
			json.put("goodsList", list);
		} else {
			json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
		}
		return json;
	}

	/**
	 * 获取商品套餐(Web接口用)
	 */
	@Override
	public Object getGoodsComboList(String product_id, String goods_id)
			throws Exception {

		logger.info("Service ==> getGoodsComboList");
		JSONObject json = new JSONObject();
		// 查询商品套餐
		List<GoodsComboWeb> list = stdPayDao.getGoodsComboWebList(product_id,
				goods_id);
		if (list.size() > 0) {
			json.put("respCode", Constants.RESPCODE_SUCCESS);
			json.put("goodsComboList", list);
		} else {
			json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
		}
		return json;
	}

	/**
	 * 获取商品和套餐信息列表(Web接口用)
	 */
	@Override
	public Object getGoodsAndComboList(String product_id) throws Exception {
		logger.info("Service ==> getGoodsAndComboList");
		JSONObject json = new JSONObject();
		// 查询商品表明细
		List<GoodsWeb> list = stdPayDao.getGoodsWebList(product_id);
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				// 商品为组合商品
				if ("1".equals(String.valueOf(list.get(i).getGroupFlag()))) {
					// 查询组合商品明细
					List<GoodsGroupWeb> groupList = stdPayDao
							.getGoodsGroupWebList(list.get(i).getGoodsId());
					list.get(i).setSubGoodsList(groupList);
				}
				// 查询商品套餐
				List<GoodsComboWeb> combolist = stdPayDao.getGoodsComboWebList(product_id,list.get(i).getGoodsId());
				list.get(i).setComboList(combolist);
			}
			json.put("respCode", Constants.RESPCODE_SUCCESS);
			json.put("goodsList", list);
		} else {
			json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
		}
		return json;
	}
	
	/**
	 * 获取支付方式(Web接口用)
	 */
	@Override
	public Object getPayWayList(String product_id) throws Exception {

		logger.info("Service ==> getPayWayList");
		JSONObject json = new JSONObject();
		// 查询支付方式
		List<PaymentModeWeb> list = stdPayDao.getPayWayList(product_id);
		if (list.size() > 0) {
			json.put("respCode", Constants.RESPCODE_SUCCESS);
			json.put("payList", list);
		} else {
			json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
		}
		return json;
	}

	/**
	 * 查询订单状态(Web接口用)
	 */
	@Override
	public Object orderQuery(String product_id, String order_id)
			throws Exception {

		logger.info("Service ==> orderQuery");
		JSONObject json = new JSONObject();
		// 查询订单
		Order bean = stdPayDao.orderQuery(order_id);
		if (bean != null) {
			json.put("respCode", Constants.RESPCODE_SUCCESS);
			json.put("orderId", order_id);
			json.put("payType", bean.getPayment_mode_id());
			json.put("orderState", bean.getOrder_state_id());
			json.put("tradeState", bean.getTrade_state());
			json.put("totalFee", Integer.parseInt(bean.getTotal_fee()));
		} else {
			json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
		}
		return json;
	}

	/**
	 * 支付请求(Web接口用)
	 */
	@Override
	public Object unifiedOrder(String product_id, String device_no,
			String goods_ids, String combo_ids, String data_ver, String pay_id,String scheme_id)
			throws Exception {
		logger.info("Service ==> unifiedOrder");
		JSONObject json = new JSONObject();
		// 查询商品
		String[] goodsIds = goods_ids.split(",");
		String[] comboIds = combo_ids.split(",");
		if (goodsIds.length == comboIds.length) {
			// 查询商品信息
			List<GoodsItem> list = stdPayDao.getGoodsById(product_id, goodsIds,
					comboIds);
			if (list.size() > 0) {
				// 计算订单金额
				int price = 0;
				// 订单商品详细
				String body = "";
				for (int i = 0; i < list.size(); i++) {
					price = price + Integer.parseInt(list.get(i).getPrice());
					body = body + list.get(i).getGoods_name() + "("
							+ list.get(i).getCombo_name() + ")" + ",";
				}
				body = body.substring(0, body.length() - 1);
				if (body.length() > 10) {
					body = body.substring(0, 7) + "···";
				}
				// 生成随机订单号
				RandomGUID rg = new RandomGUID(true);
				String order_id = rg.toString();

				// 保存订单
				Order order = new Order();
				order.setOrder_id(order_id);
				order.setTotal_fee(String.valueOf(price));
				order.setCash_fee(String.valueOf(price));
				order.setDevice_no(device_no);
				order.setDel_flag("1");
				order.setPayment_mode_id(pay_id);
				order.setOrder_state_id("1");
				order.setTrade_state("NOTPAY");
				order.setCard_type(list.get(0).getCard_type());
				stdPayDao.insertOrder(order);

				// 保存订单明细
				for (int i = 0; i < list.size(); i++) {
					String region_ids = "";
					if ("1".equals(list.get(i).getGroup_flag())) {
						List<GoodsGroupWeb> regionIdList = stdPayDao
								.getGoodsGroupWebList(list.get(i).getGoods_id());
						if (regionIdList.size() > 0) {
							for (int k = 0; k < regionIdList.size(); k++) {
								region_ids += regionIdList.get(k)
										.getSubRegionCode() + ",";
							}
							region_ids = region_ids.substring(0,
									region_ids.length() - 1);
						}
					} else {
						region_ids = list.get(i).getRegion_code();
					}
					OrderItem orderItem = new OrderItem();
					orderItem.setOrder_id(order_id);
					orderItem.setDevice_no(device_no);
					orderItem.setGoods_id(list.get(i).getGoods_id());
					orderItem.setGoods_name(list.get(i).getGoods_name());
					orderItem.setValid(list.get(i).getYears());
					orderItem.setNums(list.get(i).getNums());
					orderItem.setRegion_name(list.get(i).getRegion_name());
					orderItem.setRegion_ids(region_ids);
					orderItem.setData_ver(data_ver);
					orderItem.setGoods_price(list.get(i).getPrice());
					orderItem.setGoods_num("1");
					orderItem.setCash_fee(list.get(i).getPrice());
					orderItem.setProduct_id(product_id);
					orderItem.setCombo_id(list.get(i).getCombo_id());
					orderItem.setCombo_name(list.get(i).getCombo_name());
					orderItem.setCombo_type(list.get(i).getCombo_type());
					orderItem.setScheme_id(scheme_id);
					stdPayDao.insertOrderItem(orderItem);
				}
				String message = "";
				PaymentMode pay = stdPayDao.getPaymentMode(pay_id);
				if (pay != null) {
					message = pay.getMode_description();
				}

				String codeUrl = "";
				if ("wechat".equals(pay_id)) {
					// 微信URL
					codeUrl = PayUtils.getWechatUrl(order_id, price, body, product_id);
					logger.info("wechatUrl : " + codeUrl);
				}
				if ("alipay".equals(pay_id)) {
					// 支付宝URL
					codeUrl = PayUtils.getAlipayUrl(order_id, price, body, product_id);
					logger.info("alipayUrl : " + codeUrl);
				}
				json.put("respCode", Constants.RESPCODE_SUCCESS);
				json.put("orderId", order_id);
				json.put("codeUrl", codeUrl);
				json.put("totalFee", price);
				json.put("message", message);

				// TODO
				// 设定权限(测试用，避开微信支付宝支付、省钱)
				// setDataAuth(order_id);
			} else {
				// 验证失败
				json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
			}
		} else {
			// 验证失败
			json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
		}
		return json;
	}

	/**
	 * 微信支付回调方法
	 * 
	 * @throws Exception
	 */
	@Override
	public Notify getWechatNotify(String xml) throws Exception {
		logger.info("Service ==> getWechatNotify");
		logger.debug("xml=" + xml);

		Map<String, Object> map = XMLParser.getMapFromXML(xml);
		String return_code = URLEncoder.encode((String) map.get("return_code"),
				"utf-8");

		logger.debug("return_code=" + return_code);

		Notify bean = new Notify();
		bean.setReturn_code("SUCCESS");
		bean.setReturn_msg("OK");

		if ("SUCCESS".equals(return_code)) {
			String order_id = URLEncoder.encode(
					(String) map.get("out_trade_no"), "utf-8");
			String result_code = URLEncoder.encode(
					(String) map.get("result_code"), "utf-8");
			logger.debug("out_trade_no=" + order_id);
			logger.debug("result_code=" + result_code);
			if ("SUCCESS".equals(result_code)) {
				// 查询订单支付状态
				Order order = stdPayDao.orderQuery(order_id);
				// 订单支付状态是 未支付
				if (!"2".equals(order.getOrder_state_id())) {
					// 支付时间
					SimpleDateFormat format = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");
					SimpleDateFormat df = new SimpleDateFormat(
							"yyyyMMddHHmmss");
					String time_end = URLEncoder.encode(
							(String) map.get("time_end"), "utf-8");
					time_end = format.format(df.parse(time_end));
					// 保存订单支付状态
					Order orderBean = new Order();
					orderBean.setOrder_id(order_id);
					// 微信支付状态
					orderBean.setTrade_state("SUCCESS");
					// 订单支付ID 2：已支付
					orderBean.setOrder_state_id("2");
					// 支付时间
					orderBean.setPayment_time(time_end);
					stdOrderDao.updateOrder(orderBean);
					// 设定权限
					setDataAuth(order_id);
				}
			}

		}
		return bean;
	}

	/**
	 * 支付宝支付回调方法
	 * 
	 * @throws Exception
	 */
	@Override
	public String getAlipayNotify(Map<String, String> params) throws Exception {
		logger.info("Service ==> getAlipayNotify");

		String out_trade_no = params.get("out_trade_no");
		String trade_status = params.get("trade_status");
		String gmt_payment = params.get("gmt_payment");

		logger.debug("out_trade_no=" + out_trade_no);
		logger.debug("trade_status=" + trade_status);
		logger.debug("gmt_payment=" + gmt_payment);

		List<OrderItem> list = stdOrderItemDao.getOrderItem(out_trade_no);

		if (AlipayNotify.verify(params, list.get(0).getProduct_id())) { // 验证成功
			logger.debug("trade_status=" + trade_status);
			if ("TRADE_FINISHED".equals(trade_status)
					|| "TRADE_SUCCESS".equals(trade_status)) {
				// 查询订单支付状态
				Order order = stdPayDao.orderQuery(out_trade_no);
				// 订单支付状态是 未支付
				if (!"2".equals(order.getOrder_state_id())) {

					// 保存订单支付状态
					Order orderBean = new Order();
					orderBean.setOrder_id(out_trade_no);
					// 支付宝支付状态
					orderBean.setTrade_state(trade_status);
					// 订单支付ID 2：已支付
					orderBean.setOrder_state_id("2");
					// 支付时间
					orderBean.setPayment_time(gmt_payment);
					stdOrderDao.updateOrder(orderBean);
					// 设定权限
					setDataAuth(out_trade_no);
				}
			}
			logger.info("success");
			return "success"; // 请不要修改或删除
		} else { // 验证失败
			logger.error("fail");
			return "fail";
		}

	}

	/**
	 * 刮刮卡支付下单请求(Web接口用)
	 */
	@Override
	public Object cardOrder(String product_id, String device_no,
			String goods_ids, String combo_ids, String data_ver, String pay_id,String scheme_id)
			throws Exception {
		logger.info("Service ==> cardOrder");
		JSONObject json = new JSONObject();
		// 查询商品
		String[] goodsIds = goods_ids.split(",");
		String[] comboIds = combo_ids.split(",");
		if (goodsIds.length == comboIds.length) {
			// 查询商品信息
			List<GoodsItem> list = stdPayDao.getGoodsById(product_id, goodsIds,
					comboIds);
			if (list.size() > 0) {
				// 计算订单金额
				int price = 0;
				for (int i = 0; i < list.size(); i++) {
					price = price + Integer.parseInt(list.get(i).getPrice());
				}
				// 生成随机订单号
				RandomGUID rg = new RandomGUID(true);
				String order_id = rg.toString();

				// 保存订单
				Order order = new Order();
				order.setOrder_id(order_id);
				order.setTotal_fee(String.valueOf(price));
				order.setCash_fee(String.valueOf(price));
				order.setDevice_no(device_no);
				order.setDel_flag("1");
				order.setPayment_mode_id(pay_id);
				order.setOrder_state_id("1");
				order.setTrade_state("NOTPAY");
				order.setCard_type(list.get(0).getCard_type());
				stdPayDao.insertOrder(order);

				// 保存订单明细
				for (int i = 0; i < list.size(); i++) {
					String region_ids = "";
					if ("1".equals(list.get(i).getGroup_flag())) {
						List<GoodsGroupWeb> regionIdList = stdPayDao
								.getGoodsGroupWebList(list.get(i).getGoods_id());
						if (regionIdList.size() > 0) {
							for (int k = 0; k < regionIdList.size(); k++) {
								region_ids += regionIdList.get(k)
										.getSubRegionCode() + ",";
							}
							region_ids = region_ids.substring(0,
									region_ids.length() - 1);
						}
					} else {
						region_ids = list.get(i).getRegion_code();
					}
					OrderItem orderItem = new OrderItem();
					orderItem.setOrder_id(order_id);
					orderItem.setDevice_no(device_no);
					orderItem.setGoods_id(list.get(i).getGoods_id());
					orderItem.setGoods_name(list.get(i).getGoods_name());
					orderItem.setValid(list.get(i).getYears());
					orderItem.setNums(list.get(i).getNums());
					orderItem.setRegion_name(list.get(i).getRegion_name());
					orderItem.setRegion_ids(region_ids);
					orderItem.setData_ver(data_ver);
					orderItem.setGoods_price(list.get(i).getPrice());
					orderItem.setGoods_num("1");
					orderItem.setCash_fee(list.get(i).getPrice());
					orderItem.setProduct_id(product_id);
					orderItem.setCombo_id(list.get(i).getCombo_id());
					orderItem.setCombo_name(list.get(i).getCombo_name());
					orderItem.setCombo_type(list.get(i).getCombo_type());
					orderItem.setScheme_id(scheme_id);
					stdPayDao.insertOrderItem(orderItem);
				}
				String message = "";
				PaymentMode pay = stdPayDao.getPaymentMode(pay_id);
				if (pay != null) {
					message = pay.getMode_description();
				}

				
				json.put("respCode", Constants.RESPCODE_SUCCESS);
				json.put("orderId", order_id);
				json.put("message", message);
				json.put("cardType", list.get(0).getCard_type());

			} else {
				// 验证失败
				json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
			}
		} else {
			// 验证失败
			json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
		}
		return json;
	}
	
	/**
	 * 刮刮卡支付
	 * 
	 * @throws Exception
	 */
	@Override
	public Object cardPay(String product_id, String device_no, String order_id,String card_no, String card_password) throws Exception {
		logger.info("Service ==> cardPay");
		JSONObject json = new JSONObject();

		// 查询订单详细
		Order bean = stdOrderDao.getOrder(order_id);
		//调用生产系统接口
		Map<String, String> param = new HashMap<String, String>();
		JSONObject obj = new JSONObject();
		obj.put("orderid", order_id);
		obj.put("cardid", card_no);
		obj.put("password", card_password);
		obj.put("prefix", bean.getCard_type());
		obj.put("modelversion", product_id);
		param.put("param", URLEncoder.encode(obj.toString(), "UTF-8"));
		Map params = PEUSystemOrder.api.getCardPay(PEUSystem.CGI.getCardPay(), param).execute().body();
		// 订单号
		int respCode = Integer.parseInt(String.valueOf(params.get("respcode")));
		if (respCode == Constants.RESPCODE_SUCCESS) {
			// 支付状态
			int trade_state = Integer.parseInt(String.valueOf(params.get("trade_state")));
			String payment_time = String.valueOf(params.get("payment_time"));

			logger.debug("trade_state=" + trade_state);
			if (trade_state==Constants.RESPCODE_SUCCESS) {
				// 保存订单支付状态
				Order orderBean = new Order();
				orderBean.setOrder_id(order_id);
				// 刮刮卡支付状态
				orderBean.setTrade_state(String.valueOf(trade_state));
				// 订单支付ID 2：已支付
				orderBean.setOrder_state_id("2");
				// 支付时间
				orderBean.setPayment_time(payment_time);
				stdOrderDao.updateOrder(orderBean);
				// 设定权限
				setDataAuth(order_id);
			}
			json.put("respCode", Constants.RESPCODE_SUCCESS);
			json.put("orderId", order_id);
			json.put("message", trade_state+"");
		} else {
			// 验证失败
			json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
		}
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

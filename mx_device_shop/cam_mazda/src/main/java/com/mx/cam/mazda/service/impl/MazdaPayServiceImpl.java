package com.mx.cam.mazda.service.impl;

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
import com.mx.cam.common.common.ResponseBuilder;
import com.mx.cam.common.common.pay.XMLParser;
import com.mx.cam.common.init.model.Notify;
import com.mx.cam.mazda.dao.MazdaGoodsDao;
import com.mx.cam.mazda.dao.MazdaOrderDao;
import com.mx.cam.mazda.dao.MazdaOrderItemDao;
import com.mx.cam.mazda.model.Goods;
import com.mx.cam.mazda.model.Order;
import com.mx.cam.mazda.model.OrderItem;
import com.mx.cam.mazda.service.MazdaPayService;
import com.mx.cam.net.conf.PEUSystem;
import com.mx.cam.net.service.PEUSystemOrder;

/**
 * 微信支付Service
 * 
 * @author zhengy
 * 
 */
@Service
// 不同数据源使用不同的事务管理器
@Transactional("shop")
public class MazdaPayServiceImpl implements MazdaPayService {

	private static Log logger = LogFactory.getLog(MazdaPayServiceImpl.class);

	@Autowired
	private MazdaOrderItemDao  mazdaOrderItemDao;
	@Autowired
	private MazdaOrderDao      mazdaOrderDao;
	@Autowired
	private MazdaGoodsDao      mazdaGoodsDao;

	/**
	 * 微信支付请求（生成订单，返回二维码）
	 * 
	 * @throws Exception
	 */
	@Override
	public String getPayParm(String product_id, String device_no,
			String goods_ids,String data_ver) throws Exception {

		logger.info("Service ==> getPayParm");
		logger.debug("product_id=" + product_id);
		logger.debug("device_no=" + device_no);
		logger.debug("goods_ids=" + goods_ids);
		logger.debug("data_ver=" + data_ver);

		// 查询商品
		String[] idArray = goods_ids.split(",");
		List<Goods> list = mazdaGoodsDao.getGoodsById(idArray);
		if (list.size() > 0) {
			// 计算订单金额
			int price = 0;
			// 订单商品详细
			String body = "";
			for (int i = 0; i < list.size(); i++) {
				price = price + Integer.parseInt(list.get(i).getPrice());
				body = body + list.get(i).getGoods_name() + ",";
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
			order.setOrder_state_id("1");
			order.setTrade_state("NOTPAY");
			order.setCard_type(list.get(0).getCard_type());
			mazdaOrderDao.insertOrder(order);

			// 保存订单明细
			for (int i = 0; i < list.size(); i++) {
				OrderItem orderItem = new OrderItem();
				orderItem.setOrder_id(order_id);
				orderItem.setDevice_no(device_no);
				orderItem.setGoods_id(list.get(i).getGoods_id());
				orderItem.setGoods_name(list.get(i).getGoods_name());
				orderItem.setValid(list.get(i).getValid());
				orderItem.setNums(list.get(i).getNums());
				orderItem.setRegion_name(list.get(i).getRegion_name());
				orderItem.setGoods_price(list.get(i).getPrice());
				orderItem.setGoods_num("1");
				orderItem.setCash_fee(list.get(i).getPrice());
				orderItem.setProduct_id(product_id);
				orderItem.setData_ver(data_ver);
				mazdaOrderItemDao.insertOrderItem(orderItem);
			}

			// 微信URL
			String wechatUrl ="";
			try{
				wechatUrl = PayUtils.getWechatUrl(order_id, price, body,product_id);
				logger.debug("wechatUrl : "+ wechatUrl);
			}catch(Exception e){
				
			}
			
			// 支付宝URL
			String alipayUrl ="";
			try{
				alipayUrl = PayUtils.getAlipayUrl(order_id, price, body,product_id);
				logger.debug("alipayUrl : "+ alipayUrl);
			}catch(Exception e){
				
			}

			JSONObject json = new JSONObject();
			json.put("respCode", Constants.RESPCODE_SUCCESS);
			json.put("orderId", order_id);
			json.put("codeUrl", wechatUrl);
			json.put("alipayUrl", alipayUrl);
			json.put("totalFee", price);

			return json.toString();

		} else {
			// 验证失败
			return ResponseBuilder
					.getRespCode(Constants.RESPCODE_NOBINDDEVICE);
		}
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
				String trade_state = mazdaOrderDao.getTradeState(order_id);
				// 订单支付状态是 未支付
				if ("NOTPAY".equals(trade_state)) {
					// 支付时间
					SimpleDateFormat format = new SimpleDateFormat(
							"yyyy-MM-dd HH:mm:ss");
					SimpleDateFormat df = new SimpleDateFormat(
							"yyyyMMddHHmmss");
					String time_end = URLEncoder.encode(
							(String) map.get("time_end"), "utf-8");
					time_end = format.format(df.parse(time_end));
					// 保存订单支付状态
					Order order = new Order();
					order.setOrder_id(order_id);
					// 支付方式
					order.setPayment_mode_id("1");
					// 微信支付状态
					order.setTrade_state("SUCCESS");
					// 订单支付ID 2：已支付
					order.setOrder_state_id("2");
					// 支付时间
					order.setPayment_time(time_end);
					mazdaOrderDao.updateOrder(order);
					
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

		List<OrderItem> orderItemList = mazdaOrderItemDao.getOrderItem(out_trade_no);
		
		if (AlipayNotify.verify(params,orderItemList.get(0).getProduct_id())) { // 验证成功
			logger.debug("trade_status=" + trade_status);
			if (trade_status.equals("TRADE_FINISHED")
					|| trade_status.equals("TRADE_SUCCESS")) {
				// 查询订单支付状态
				String tradeState = mazdaOrderDao.getTradeState(out_trade_no);
				// 订单支付状态是 未支付
				if ("NOTPAY".equals(tradeState)) {

					// 保存订单支付状态
					Order order = new Order();
					order.setOrder_id(out_trade_no);
					// 支付方式
					order.setPayment_mode_id("2");
					// 微信支付状态
					order.setTrade_state("SUCCESS");
					// 订单支付ID 2：已支付
					order.setOrder_state_id("2");
					// 支付时间
					order.setPayment_time(gmt_payment);
					mazdaOrderDao.updateOrder(order);

					// 设定权限
					setDataAuth(out_trade_no);
					
				}
			}
			logger.debug("success");
			return "success"; // 请不要修改或删除
		} else { // 验证失败
			logger.error("fail");
			return "fail";
		}
	}

	/**
	 * 3.8 交易支付：获取商品信息列表
	 * 
	 * @throws Exception
	 */
	@Override
	public Object getGoodsList(String product_id, String catagory_ids)
			throws Exception {
		logger.info("Service ==> getGoodsList");
		logger.debug("product_id");
		logger.debug("catagory_ids");
		JSONObject ret = new JSONObject();
		JSONArray goodsArray = new JSONArray();
		String catagoryIds[] = catagory_ids.split(",");

		List<Goods> goodsList = mazdaGoodsDao.getGoods(catagoryIds);
		if (goodsList.size() > 0) {

			for (int j = 0; j < goodsList.size(); j++) {
				JSONObject goodsLists = new JSONObject();
				goodsLists.put("goodsId",
						Integer.parseInt(goodsList.get(j).getGoods_id()));
				goodsLists.put("goodsName", goodsList.get(j).getGoods_name());
				goodsLists.put("validDays",
						Integer.parseInt(goodsList.get(j).getValid()));
				goodsLists.put("nums",
						Integer.parseInt(goodsList.get(j).getNums()));
				goodsLists.put("regionName", goodsList.get(j).getRegion_name());
				goodsLists.put("goodsPrice",
						Integer.parseInt(goodsList.get(j).getPrice()));
				goodsLists
						.put("description", goodsList.get(j).getDescription());
				goodsLists.put("catagoryId", goodsList.get(j).getCatagory_id());
				goodsArray.add(goodsLists);
			}

			ret.put("respCode", Constants.RESPCODE_SUCCESS);
			ret.put("goodsList", goodsArray);
		} else {
			ret.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
		}
		return ret;
	}

	/**
	 * 3.10 查询订单状态接口
	 * 
	 * @throws Exception
	 */
	@Override
	public Object orderQuery(String product_id, String order_id)
			throws Exception {
		logger.info("Service ==> orderQuery");
		logger.debug("product_id");
		logger.debug("order_id");

		Order order = mazdaOrderDao.getOrder(order_id);

		JSONObject ret = new JSONObject();
		if (order != null) {
			ret.put("respCode", Constants.RESPCODE_SUCCESS);
			ret.put("orderId", order.getOrder_id());
			ret.put("payType", order.getPayment_mode());
			ret.put("tradeState", order.getTrade_state());
			ret.put("totalFee", Integer.parseInt(order.getTotal_fee()));
		} else {
			ret.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
		}
		return ret;
	}
	
	/**
	 * 刮刮卡支付下单请求(Web接口用)
	 */
	@Override
	public String cardOrder(String product_id, String device_no,String goods_ids,String data_ver)
			throws Exception {
		logger.info("Service ==> cardOrder");
		JSONObject json = new JSONObject();
		// 查询商品
		String[] idArray = goods_ids.split(",");
		List<Goods> list = mazdaGoodsDao.getGoodsById(idArray);
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
			order.setOrder_state_id("1");
			order.setTrade_state("NOTPAY");
			order.setPayment_mode_id("3");
			order.setCard_type(list.get(0).getCard_type());
			mazdaOrderDao.insertOrder(order);

			// 保存订单明细
			for (int i = 0; i < list.size(); i++) {
				OrderItem orderItem = new OrderItem();
				orderItem.setOrder_id(order_id);
				orderItem.setDevice_no(device_no);
				orderItem.setGoods_id(list.get(i).getGoods_id());
				orderItem.setGoods_name(list.get(i).getGoods_name());
				orderItem.setValid(list.get(i).getValid());
				orderItem.setNums(list.get(i).getNums());
				orderItem.setRegion_name(list.get(i).getRegion_name());
				orderItem.setGoods_price(list.get(i).getPrice());
				orderItem.setGoods_num("1");
				orderItem.setCash_fee(list.get(i).getPrice());
				orderItem.setProduct_id(product_id);
				orderItem.setData_ver(data_ver);
				mazdaOrderItemDao.insertOrderItem(orderItem);
			}

			json.put("respCode", Constants.RESPCODE_SUCCESS);
			json.put("orderId", order_id);
			json.put("cardType", list.get(0).getCard_type());

			return json.toString();

		} else {
			// 验证失败
			return ResponseBuilder
					.getRespCode(Constants.RESPCODE_NOBINDDEVICE);
		}
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
		Order bean = mazdaOrderDao.getOrder(order_id);
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
				// 支付方式
				orderBean.setPayment_mode_id("3");
				// 刮刮卡支付状态
				orderBean.setTrade_state(String.valueOf(trade_state));
				// 订单支付ID 2：已支付
				orderBean.setOrder_state_id("2");
				// 支付时间
				orderBean.setPayment_time(payment_time);
				mazdaOrderDao.updateOrder(orderBean);

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
		Order bean = mazdaOrderDao.getOrder(order_id);
		// 查询订单详细
		List<OrderItem> list = mazdaOrderItemDao.getOrderItem(order_id);

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
		dataUpg.put("areaCode", list.get(0).getGoods_id());
		// dataUpg.put("softVer", "");
		dataUpg.put("dataVer", list.get(0).getData_ver());
		// SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		// dataUpg.put("actTime",df.format(new Data()));
		//dataUpg.put("actWay", 0);
		dataUpg.put("authRule", 3);//2:次数 3:版本  4：期限+次数
		json.put("dataUpg", dataUpg);

		logger.debug("消息队列JSON:" + json.toString());
		CommonUtils.push(json.toString());

	}

}

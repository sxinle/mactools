package com.mx.cam.common.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alipay.api.AlipayClient;
import com.alipay.api.request.AlipayTradePrecreateRequest;
import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.mx.cam.common.common.pay.XMLParser;
import com.mx.cam.common.init.controller.InitDataBySystemStart;
import com.mx.cam.common.init.model.PayAccount;
import com.mx.cam.common.init.model.PayParm;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;


public class PayUtils {
	private static Log logger = LogFactory.getLog(PayUtils.class);
	/**
	 * 微信支付返回URL
	 * 
	 * @param order_id
	 * @param price
	 * @param body
	 * @return
	 * @throws Exception
	 */
	public static String getWechatUrl(String order_id, int price, String body,String product_id)
			throws Exception {
		logger.info("PayUtils ==> getWeixinUrl");
		// 取得微信支付参数
		List<PayAccount> list = InitDataBySystemStart.getWeixinMap();
		PayParm bean = new PayParm();
		for (int i = 0; i < list.size(); i++) {
			if (product_id.equals(list.get(i).getProduct_id())) {
				bean.setAppid(list.get(i).getAppid());
				bean.setAttach(list.get(i).getAttach());
				bean.setDevice_info(list.get(i).getDevice_info());
				bean.setGoods_tag(list.get(i).getGoods_tag());
				bean.setMch_id(list.get(i).getMch_id());
				bean.setNotify_url(list.get(i).getNotify_url());
				bean.setSpbill_create_ip(list.get(i).getSpbill_create_ip());
				bean.setTrade_type(list.get(i).getTrade_type());
			}
		}
		bean.setNonce_str(order_id);
		bean.setOut_trade_no(order_id);
		bean.setTotal_fee(price);
		bean.setBody(body);
		bean.setSign();

		// 微信支付
		String wxUrl = "";

		XStream xStreamForRequestPostData = new XStream(new DomDriver("UTF-8",
				new XmlFriendlyNameCoder("-_", "_")));
		String postDataXML = xStreamForRequestPostData.toXML(bean);
		System.out.println("weixinParm : "+postDataXML);

		URL url = new URL("https://api.mch.weixin.qq.com/pay/unifiedorder");
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
		logger.debug("weixinReturn : " + xml);
		Map<String, Object> map = XMLParser.getMapFromXML(xml);

		// 直接返回微信返回路径
		wxUrl = (String) map.get("code_url");
		return wxUrl;
	}

	/**
	 * 支付宝支付返回URL
	 * 
	 * @param order_id
	 * @param price
	 * @param body
	 * @return
	 * @throws Exception
	 */
	public static String getAlipayUrl(String order_id, int price, String body,String product_id)
			throws Exception {
		logger.info("PayUtils ==> getAlipayUrl");
		String alipayUrl = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time_expire = sdf.format(System.currentTimeMillis() + 24 * 60
				* 60 * 1000);

		StringBuilder sb = new StringBuilder();

		sb.append("{\"out_trade_no\":\"" + order_id + "\",");
		sb.append("\"total_amount\":\""
				+ new BigDecimal(price).divide(new BigDecimal("100"), 2,
						BigDecimal.ROUND_UP) + "\",");
		sb.append("\"subject\":\"" + body + "\",");
		sb.append("\"time_expire\":\"" + time_expire + "\"}");
		logger.debug("alipayParm : " + sb.toString());

		// 使用SDK，构建群发请求模型
		AlipayTradePrecreateRequest request = new AlipayTradePrecreateRequest();
		request.setBizContent(sb.toString());

		request.setNotifyUrl(InitDataBySystemStart.getAlipayMap()
				.get(product_id).get("url").toString());
		logger.debug("回调url="+request.getNotifyUrl());
		AlipayTradePrecreateResponse response = null;

		// 使用SDK，调用交易下单接口
		AlipayClient alipayClient = (AlipayClient) InitDataBySystemStart
				.getAlipayMap().get(product_id).get("alipayClient");
		response = alipayClient.execute(request);

		logger.debug(response.getBody());
		logger.debug(response.isSuccess());
		logger.debug(response.getMsg());
		// 这里只是简单的打印，请开发者根据实际情况自行进行处理
		if (null != response && response.isSuccess()) {
			if ("10000".equals(response.getCode())) {
				logger.debug("商户订单号：" + response.getOutTradeNo());
				logger.debug("二维码值：" + response.getQrCode());// 商户将此二维码值生成二维码，然后展示给用户，用户用支付宝手机钱包扫码完成支付
				// 二维码的生成，网上有许多开源方法，可以参看：http://blog.csdn.net/feiyu84/article/details/9089497
				alipayUrl = response.getQrCode();
			} else {

				// 打印错误码
				logger.debug("错误码：" + response.getSubCode());
				logger.debug("错误描述：" + response.getSubMsg());
			}
		}
		return alipayUrl;
	}

}

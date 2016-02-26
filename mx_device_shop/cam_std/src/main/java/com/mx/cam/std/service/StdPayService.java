package com.mx.cam.std.service;

import java.util.Map;

import com.mx.cam.common.init.model.Notify;

public interface StdPayService {

	// 获取商品信息列表(Web接口用)
	public Object getGoodsList(String product_id) throws Exception;

	// 获取商品套餐(Web接口用)
	public Object getGoodsComboList(String product_id, String goods_id)
			throws Exception;

	// 获取商品和套餐信息列表(Web接口用)
	public Object getGoodsAndComboList(String product_id) throws Exception;

	// 获取支付方式(Web接口用)
	public Object getPayWayList(String product_id) throws Exception;

	// 查询订单状态(Web接口用)
	public Object orderQuery(String product_id, String order_id)
			throws Exception;

	// 支付请求(Web接口用)
	public Object unifiedOrder(String product_id, String device_no,
			String goods_ids, String combo_ids, String data_ver, String pay_id,String scheme_id)
			throws Exception;

	// 微信支付回调方法
	public Notify getWechatNotify(String xml) throws Exception;

	// 支付宝支付回调方法
	public String getAlipayNotify(Map<String, String> params) throws Exception;

	// 刮刮卡支付下单请求(Web接口用)
	public Object cardOrder(String product_id, String device_no,
			String goods_ids, String combo_ids, String data_ver, String pay_id,String scheme_id)
			throws Exception;

	// 刮刮卡支付
	public Object cardPay(String product_id, String device_no, String order_id,
			String card_no, String card_password) throws Exception;

}

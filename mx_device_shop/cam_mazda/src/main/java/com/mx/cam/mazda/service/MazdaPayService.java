package com.mx.cam.mazda.service;


import java.util.Map;

import com.mx.cam.common.init.model.Notify;


/**
 * 微信支付Service
 * 
 * @author zhengy
 * 
 */
public interface MazdaPayService {

    /**
     * 微信支付请求（生成订单，返回二维码）
     */
	Object getPayParm(String product_id, String device_no, String goods_ids,String data_ver) throws Exception;

	 /**
     * 微信支付回调方法
     */
    Notify getWechatNotify(String xml) throws Exception;
    
    /**
     * 支付宝支付回调方法
     */
    String getAlipayNotify(Map<String, String> params) throws Exception;
    
    /**
     * 查询订单状态接口
     */
    Object orderQuery(String product_id, String order_id) throws Exception;

    /**
     * 交易支付：获取商品信息列表
     */
    Object getGoodsList(String product_id, String catagory_ids) throws Exception;
    
    /**
	 * 刮刮卡支付下单请求(Web接口用)
	 */
	String cardOrder(String product_id, String device_no,String goods_ids,String data_ver) throws Exception;
	
	/**
	 * 刮刮卡支付
	 */
	Object cardPay(String product_id, String device_no, String order_id,String card_no, String card_password) throws Exception;

}

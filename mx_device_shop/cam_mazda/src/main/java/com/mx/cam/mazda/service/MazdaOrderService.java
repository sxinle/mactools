package com.mx.cam.mazda.service;

import com.mx.cam.mazda.model.Order;

/**
 * 订单管理Service
 * 
 * @author zhengy
 * 
 */
public interface MazdaOrderService {

	/**
	 * 查询订单管理列表
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object getOrderInfo(Order bean) throws Exception;

	/**
	 * 同步微信订单状态
	 * 
	 * @param order_id
	 * @return
	 * @throws Exception
	 */
	Object syncWechatTradeState(String order_id) throws Exception;
	
	/**
	 * 同步支付宝订单状态
	 * 
	 * @param order_id
	 * @return
	 * @throws Exception
	 */
	Object syncAlipayTradeState(String order_id) throws Exception;
	
	/**
	 * 同步订单状态
	 */
	Object syncCardpayTradeState(String order_id) throws Exception;

}

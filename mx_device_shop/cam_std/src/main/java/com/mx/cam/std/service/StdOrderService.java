package com.mx.cam.std.service;

import com.mx.cam.std.model.Order;

/**
 * 订单管理Service
 * 
 * @author zhengy
 * 
 */
public interface StdOrderService {

	/**
	 * 查询订单管理列表
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object getOrderManage(Order bean) throws Exception;

	/**
	 * 同步订单状态
	 * 
	 * @param order_id
	 * @return
	 * @throws Exception
	 */
	Object syncTradeState(String order_id) throws Exception;

}

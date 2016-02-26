package com.mx.cam.std.service;

import com.mx.cam.std.model.OrderItem;

/**
 * 订单明细管理Service
 * 
 * @author zhengy
 * 
 */
public interface StdOrderItemService {

	/**
	 * 查询订单明细列表
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object getOrderItem(OrderItem bean) throws Exception;

}

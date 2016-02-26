package com.mx.cam.mazda.service;


import com.mx.cam.mazda.model.OrderItem;

/**
 * 订单明细管理Service
 * 
 * @author zhengy
 * 
 */
public interface MazdaOrderItemService {

	/**
	 * 查询订单明细列表
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object getOrderItem(OrderItem bean) throws Exception;

}

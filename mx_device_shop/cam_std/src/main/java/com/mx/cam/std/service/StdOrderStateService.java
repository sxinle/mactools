package com.mx.cam.std.service;

import com.mx.cam.std.model.OrderState;

/**
 * 订单状态管理Service
 * 
 * @author zhengy
 * 
 */
public interface StdOrderStateService {

	/**
	 * 查询订单状态列表
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object getOrderState(OrderState bean) throws Exception;

}

package com.mx.cam.std.dao;

import java.util.List;

import com.mx.cam.std.model.OrderState;

/**
 * 订单状态管理Dao
 * 
 * @author zhengy
 * 
 */
public interface StdOrderStateDao {

	public List<OrderState> getOrderState(OrderState bean);

}

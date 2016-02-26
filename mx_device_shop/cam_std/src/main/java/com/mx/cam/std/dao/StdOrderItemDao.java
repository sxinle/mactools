package com.mx.cam.std.dao;

import java.util.List;

import com.mx.cam.std.model.OrderItem;

/**
 * 订单明细管理Dao
 * 
 * @author zhengy
 * 
 */
public interface StdOrderItemDao {
	
	public List<OrderItem> getOrderItem(OrderItem bean);

	public List<OrderItem> getOrderItem(String order_id);

}

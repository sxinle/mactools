package com.mx.cam.std.dao;

import java.util.List;

import com.mx.cam.std.model.Order;

/**
 * 订单管理Dao
 * 
 * @author zhengy
 * 
 */
public interface StdOrderDao {

	// 查询订单
	public List<Order> getOrderManage(Order bean);

	// 查询订单
	public Order getOrder(String order_id);

	// 更新订单信息
	public void updateOrder(Order bean);

}

package com.mx.cam.mazda.dao;


import com.mx.cam.mazda.model.OrderItem;

import java.util.List;

/**
 * 订单明细管理Dao
 * 
 * @author zhengy
 * 
 */
public interface MazdaOrderItemDao {

	List<OrderItem> getOrderItem(OrderItem bean);

    // 保存订单明细
    void insertOrderItem(OrderItem bean);

    // 查询订单明细
    List<OrderItem> getOrderItem(String order_id);

}

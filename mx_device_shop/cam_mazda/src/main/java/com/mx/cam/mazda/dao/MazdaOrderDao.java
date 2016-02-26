package com.mx.cam.mazda.dao;


import com.mx.cam.mazda.model.Order;

import java.util.List;

/**
 * 订单管理Dao
 * 
 * @author zhengy
 * 
 */
public interface MazdaOrderDao {

	List<Order> getOrderInfo(Order bean);

    Order getOrder(String order_id);

    // 保存订单
    void insertOrder(Order bean);

    // 查询订单支付状态
    String getTradeState(String order_id);

    // 更新订单支付状态
    void updateOrder(Order bean);

}

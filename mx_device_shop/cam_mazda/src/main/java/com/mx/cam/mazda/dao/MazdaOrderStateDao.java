package com.mx.cam.mazda.dao;


import java.util.List;

import com.mx.cam.mazda.model.OrderState;

/**
 * 订单状态管理Dao
 * 
 * @author zhengy
 * 
 */
public interface MazdaOrderStateDao {

	List<OrderState> getOrderState();

}

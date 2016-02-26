package com.mx.cam.mazda.dao;


import java.util.List;

import com.mx.cam.mazda.model.PaymentMode;

/**
 * 支付方式管理Dao
 * 
 * @author zhengy
 * 
 */
public interface MazdaPaymentModeDao {

	List<PaymentMode> getPaymentMode();

}

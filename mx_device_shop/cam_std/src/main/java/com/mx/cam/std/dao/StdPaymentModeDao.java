package com.mx.cam.std.dao;


import java.util.List;

import com.mx.cam.std.model.PaymentMode;
import com.mx.cam.std.model.ProductPayment;

/**
 * 支付方式管理Dao
 * 
 * @author zhengy
 * 
 */
public interface StdPaymentModeDao {

	List<PaymentMode> getPaymentMode();
	
	void deleteProductPayment(ProductPayment bean);

	void saveProductPayment(ProductPayment bean);
}

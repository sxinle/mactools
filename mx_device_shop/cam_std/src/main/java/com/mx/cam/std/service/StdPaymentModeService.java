package com.mx.cam.std.service;

import com.mx.cam.std.model.ProductPayment;

/**
 * 支付方式管理Service
 * 
 * @author zhengy
 * 
 */
public interface StdPaymentModeService {

	/**
	 * 查询支付方式列表
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object getPaymentMode() throws Exception;
	
	/**
	 * 绑定支付方式
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object saveProductPayment(ProductPayment bean) throws Exception;

}

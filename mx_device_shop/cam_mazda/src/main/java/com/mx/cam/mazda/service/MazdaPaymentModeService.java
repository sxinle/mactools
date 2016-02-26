package com.mx.cam.mazda.service;

/**
 * 支付方式管理Service
 * 
 * @author zhengy
 * 
 */
public interface MazdaPaymentModeService {

	/**
	 * 查询支付方式列表
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object getPaymentMode() throws Exception;

}

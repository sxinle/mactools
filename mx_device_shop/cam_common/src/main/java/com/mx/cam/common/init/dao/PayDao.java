package com.mx.cam.common.init.dao;

import java.util.List;

import com.mx.cam.common.init.model.AlipayParm;
import com.mx.cam.common.init.model.PayAccount;

/**
 * 微信支付Dao
 * 
 * @author zhengy
 * 
 */
public interface PayDao {

	// 查询微信支付参数
	public List<PayAccount> getPayParm();

	// 查询支付宝支付参数
	public List<AlipayParm> getAlipayParm();

}

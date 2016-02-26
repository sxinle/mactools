package com.mx.cam.common.pay.service;

import com.mx.cam.common.pay.model.AlipayInfo;
import com.mx.cam.common.pay.model.WechatInfo;


/**
 * 支付信息管理Service
 * 
 * @author zhengy
 * 
 */
public interface PayInfoService {

	/**
	 * 查询微信支付信息
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object getWechatInfo(WechatInfo bean) throws Exception;

	/**
	 * 保存微信支付信息
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object saveWechatInfo(WechatInfo bean) throws Exception;
	
	/**
	 * 删除微信支付信息
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	Object deleteWechatInfo(String ids) throws Exception;
	
	/**
	 * 查询支付宝支付信息
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object getAlipayInfo(AlipayInfo bean) throws Exception;

	/**
	 * 保存支付宝支付信息
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object saveAlipayInfo(AlipayInfo bean) throws Exception;
	
	/**
	 * 删除支付宝支付信息
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	Object deleteAlipayInfo(String ids) throws Exception;


}

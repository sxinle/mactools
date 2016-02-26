package com.mx.cam.common.pay.dao;

import java.util.List;

import com.mx.cam.common.pay.model.AlipayInfo;
import com.mx.cam.common.pay.model.WechatInfo;

/**
 * 支付信息管理Dao
 * 
 * @author zhengy
 * 
 */
public interface PayInfoDao {

	// 查询微信支付信息
	public List<WechatInfo> getWechatInfo(WechatInfo bean);

	// 验证微信支付信息产品系列是否重复
	public int checkWechatProductSame(WechatInfo bean);

	// 添加微信支付信息
	public void insertWechatInfo(WechatInfo bean);

	// 更新微信支付信息
	public void updateWechatInfo(WechatInfo bean);

	// 删除微信支付信息
	public void deleteWechatInfo(String[] ids);

	// 查询支付宝支付信息
	public List<AlipayInfo> getAlipayInfo(AlipayInfo bean);

	// 验证支付宝支付信息产品系列是否重复
	public int checkAlipayProductSame(AlipayInfo bean);

	// 添加支付宝支付信息
	public void insertAlipayInfo(AlipayInfo bean);

	// 更新支付宝支付信息
	public void updateAlipayInfo(AlipayInfo bean);

	// 删除支付宝支付信息
	public void deleteAlipayInfo(String[] ids);

}

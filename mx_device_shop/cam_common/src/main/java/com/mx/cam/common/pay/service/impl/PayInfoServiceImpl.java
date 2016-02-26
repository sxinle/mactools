package com.mx.cam.common.pay.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.common.Constants;
import com.mx.cam.common.pay.dao.PayInfoDao;
import com.mx.cam.common.pay.model.AlipayInfo;
import com.mx.cam.common.pay.model.WechatInfo;
import com.mx.cam.common.pay.service.PayInfoService;

/**
 * 支付信息管理Service
 * 
 * @author zhengy
 * 
 */
@Service
@Transactional
public class PayInfoServiceImpl implements PayInfoService {

	@Autowired
	private PayInfoDao payInfoDao;

	/**
	 * 查询微信支付信息
	 */
	@Override
	public Object getWechatInfo(WechatInfo bean) throws Exception {
		List<WechatInfo> list = payInfoDao.getWechatInfo(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

	}

	/**
	 * 保存微信支付信息
	 * 
	 */
	@Override
	public Object saveWechatInfo(WechatInfo bean) throws Exception {

		JSONObject json = new JSONObject();
		int num = payInfoDao.checkWechatProductSame(bean);
		if (num > 0) {
			json.put("respCode", Constants.RESPCODE_ERR_SAME);
			return json;
		}
		if ("".equals(bean.getId()) || bean.getId() == null) {
			payInfoDao.insertWechatInfo(bean);
		} else {
			payInfoDao.updateWechatInfo(bean);
		}
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;

	}

	/**
	 * 删除微信支付信息
	 * 
	 */
	@Override
	public Object deleteWechatInfo(String ids) throws Exception {

		JSONObject json = new JSONObject();
		String[] idArray = ids.split(",");
		payInfoDao.deleteWechatInfo(idArray);
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;
	}

	/**
	 * 查询支付宝支付信息
	 */
	@Override
	public Object getAlipayInfo(AlipayInfo bean) throws Exception {
		List<AlipayInfo> list = payInfoDao.getAlipayInfo(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

	}

	/**
	 * 保存支付宝支付信息
	 * 
	 */
	@Override
	public Object saveAlipayInfo(AlipayInfo bean) throws Exception {

		JSONObject json = new JSONObject();
		int num = payInfoDao.checkAlipayProductSame(bean);
		if (num > 0) {
			json.put("respCode", Constants.RESPCODE_ERR_SAME);
			return json;
		}
		if ("".equals(bean.getId()) || bean.getId() == null) {
			payInfoDao.insertAlipayInfo(bean);
		} else {
			payInfoDao.updateAlipayInfo(bean);
		}
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;

	}

	/**
	 * 删除支付宝支付信息
	 * 
	 */
	@Override
	public Object deleteAlipayInfo(String ids) throws Exception {

		JSONObject json = new JSONObject();
		String[] idArray = ids.split(",");
		payInfoDao.deleteAlipayInfo(idArray);
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;
	}

}

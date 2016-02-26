package com.mx.cam.common.pay.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.pay.model.AlipayInfo;
import com.mx.cam.common.pay.model.WechatInfo;
import com.mx.cam.common.pay.service.PayInfoService;

/**
 * 支付信息管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/com/payInfo")
// @MustLogin
public class PayInfoController extends BaseController {
	private static Log log = LogFactory.getLog(PayInfoController.class);

	@Autowired
	private PayInfoService payInfoService;

	/**
	 * 查询微信支付信息
	 */
	@RequestMapping("/getWechatInfo")
	@ResponseBody
	// @MustLogin
	public Object getWechatInfo(WechatInfo bean) throws Exception {
		log.info("getWechatInfo");
		return payInfoService.getWechatInfo(bean);

	}

	/**
	 * 保存微信支付信息
	 */
	@RequestMapping("/saveWechatInfo")
	@ResponseBody
	// @MustLogin
	public Object saveWechatInfo(WechatInfo bean) throws Exception {
		log.info("saveWechatInfo");
		return payInfoService.saveWechatInfo(bean);
	}

	/**
	 * 删除微信支付信息
	 */
	@RequestMapping("/deleteWechatInfo")
	@ResponseBody
	// @MustLogin
	public Object deleteWechatInfo(String ids) throws Exception {
		log.info("deleteWechatInfo");
		return payInfoService.deleteWechatInfo(ids);
	}

	/**
	 * 查询支付宝支付信息
	 */
	@RequestMapping("/getAlipayInfo")
	@ResponseBody
	// @MustLogin
	public Object getAlipayInfo(AlipayInfo bean) throws Exception {
		log.info("getAlipayInfo");
		return payInfoService.getAlipayInfo(bean);

	}

	/**
	 * 保存支付宝支付信息
	 */
	@RequestMapping("/saveAlipayInfo")
	@ResponseBody
	// @MustLogin
	public Object saveAlipayInfo(AlipayInfo bean) throws Exception {
		log.info("saveAlipayInfo");
		return payInfoService.saveAlipayInfo(bean);
	}

	/**
	 * 删除支付宝支付信息
	 */
	@RequestMapping("/deleteAlipayInfo")
	@ResponseBody
	// @MustLogin
	public Object deleteAlipayInfo(String ids) throws Exception {
		log.info("deleteAlipayInfo");
		return payInfoService.deleteAlipayInfo(ids);
	}
}

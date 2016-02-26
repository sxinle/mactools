package com.mx.cam.mazda.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.mazda.model.Order;
import com.mx.cam.mazda.service.MazdaOrderService;

/**
 * 订单管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/order")
@MustLogin
public class MazdaOrderController extends BaseController {
	private static Log log = LogFactory.getLog(MazdaOrderController.class);

	@Autowired
	private MazdaOrderService mazdaOrderService;

	/**
	 * 取得订单管理数据
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getOrderInfo")
	public @ResponseBody
	Object getOrderInfo(Order bean) throws Exception {
		log.info("getOrderInfo");

		return mazdaOrderService.getOrderInfo(bean);
	}

	/**
	 * 同步微信订单状态
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/syncWechatTradeState")
	public @ResponseBody
	Object syncWechatTradeState(String order_id) throws Exception {
		log.info("syncWechatTradeState");

		return mazdaOrderService.syncWechatTradeState(order_id);

	}

	/**
	 * 同步支付宝订单状态
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/syncAlipayTradeState")
	public @ResponseBody
	Object syncAlipayTradeState(String order_id) throws Exception {
		log.info("syncAlipayTradeState");

		return mazdaOrderService.syncAlipayTradeState(order_id);
	}

	/**
	 * 同步刮刮卡订单状态
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/syncCardpayTradeState")
	public @ResponseBody
	Object syncCardpayTradeState(String order_id) throws Exception {
		log.info("syncCardpayTradeState");

		return mazdaOrderService.syncCardpayTradeState(order_id);
	}
}
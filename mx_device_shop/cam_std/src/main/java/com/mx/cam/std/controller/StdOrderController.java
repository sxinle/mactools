package com.mx.cam.std.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.std.model.Order;
import com.mx.cam.std.service.StdOrderService;

/**
 * 订单管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/std/order")
@MustLogin
public class StdOrderController extends BaseController {
	private static Log log = LogFactory.getLog(StdOrderController.class);

	@Autowired
	private StdOrderService stdOrderService;

	/**
	 * 取得订单管理数据
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getOrderManage")
	public @ResponseBody
	Object getOrderManage(Order bean) throws Exception {
		log.info("getOrderManage");

		return stdOrderService.getOrderManage(bean);
	}

	/**
	 * 同步订单状态
	 * 
	 * @param order_id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/syncTradeState")
	public @ResponseBody
	Object syncTradeState(String order_id) throws Exception {
		log.info("syncTradeState");

		return stdOrderService.syncTradeState(order_id);
	}
}
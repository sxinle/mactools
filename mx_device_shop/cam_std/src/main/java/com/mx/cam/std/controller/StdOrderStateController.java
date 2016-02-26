package com.mx.cam.std.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.std.model.OrderState;
import com.mx.cam.std.service.StdOrderStateService;

/**
 * 订单状态Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/std/orderState")
@MustLogin
public class StdOrderStateController extends BaseController {
	private static Log log = LogFactory.getLog(StdOrderStateController.class);

	@Autowired
	private StdOrderStateService stdOrderStateService;

	
	/**
	 * 查看订单状态管理数据
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getOrderState")
	public @ResponseBody
	Object getOrderState(OrderState bean) throws Exception {
		log.info("getOrderState");

		return stdOrderStateService.getOrderState(bean);
	}

}
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
import com.mx.cam.mazda.service.MazdaOrderStateService;

/**
 * 订单状态Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/orderState")
@MustLogin
public class MazdaOrderStateController extends BaseController {
	private static Log log = LogFactory.getLog(MazdaOrderStateController.class);

	@Autowired
	private MazdaOrderStateService MazdaOrderStateService;

	/**
	 * 取得订单状态列表数据
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getOrderState")
	public @ResponseBody
	Object getOrderState() throws Exception {
		log.info("getOrderState");

		return MazdaOrderStateService.getOrderState();
	}

}
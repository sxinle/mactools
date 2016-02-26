package com.mx.cam.common.auth.controller;

import com.mx.cam.net.conf.Common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.auth.model.AuthOrder;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.net.service.CommonAuth;

/**
 * 鉴权订单管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/com/authOrder")
@MustLogin
public class AuthOrderController extends BaseController {
	private static Log log = LogFactory.getLog(AuthOrderController.class);

	/**
	 * 查询鉴权订单
	 */
	@RequestMapping("/getAuthOrder")
	@ResponseBody
	public Object getAuthOrder(AuthOrder bean) throws Exception {
		log.info("getAuthOrder");
		return CommonAuth.api.getAuthOrder(Common.CGI.getAuthOrder(), bean.toMap()).execute().body();

	}

}

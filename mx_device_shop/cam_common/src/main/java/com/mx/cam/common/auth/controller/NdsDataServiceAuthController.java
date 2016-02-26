package com.mx.cam.common.auth.controller;

import com.mx.cam.net.conf.Common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.auth.model.NdsDataServiceAuth;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.net.service.CommonAuth;

/**
 * 权限管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/com/ndsDataServiceAuth")
@MustLogin
public class NdsDataServiceAuthController extends BaseController {
	private static Log log = LogFactory.getLog(NdsDataServiceAuthController.class);

	/**
	 * 查询权限信息
	 */
	@RequestMapping("/getNdsDataServiceAuth")
	@ResponseBody
	public Object getNdsDataServiceAuth(NdsDataServiceAuth bean) throws Exception {
		log.info("getNdsDataServiceAuth");
		return CommonAuth.api.getNdsDataServiceAuth(Common.CGI.getNdsDataServiceAuth(), bean.toMap()).execute().body();

	}

}

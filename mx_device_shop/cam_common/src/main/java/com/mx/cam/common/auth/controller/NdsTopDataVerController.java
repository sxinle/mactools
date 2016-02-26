package com.mx.cam.common.auth.controller;

import com.mx.cam.net.conf.Common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.auth.model.NdsTopDataVer;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.net.service.CommonAuth;

/**
 * 最高版本管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/com/ndsTopDataVer")
@MustLogin
public class NdsTopDataVerController extends BaseController {
	private static Log log = LogFactory.getLog(NdsTopDataVerController.class);

	/**
	 * 查询最高版本
	 */
	@RequestMapping("/getNdsTopDataVer")
	@ResponseBody
	public Object getNdsTopDataVer(NdsTopDataVer bean) throws Exception {
		log.info("getNdsTopDataVer");
		return CommonAuth.api.getNdsTopDataVer(Common.CGI.getNdsTopDataVer(), bean.toMap()).execute().body();

	}

}

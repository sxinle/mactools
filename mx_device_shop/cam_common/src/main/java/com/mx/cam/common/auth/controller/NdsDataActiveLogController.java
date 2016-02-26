package com.mx.cam.common.auth.controller;

import com.mx.cam.common.auth.model.NdsDataActiveLog;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.net.conf.Common;
import com.mx.cam.net.service.CommonAuth;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 激活记录管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/com/ndsDataActiveLog")
@MustLogin
public class NdsDataActiveLogController extends BaseController {
	private static Log log = LogFactory.getLog(NdsDataActiveLogController.class);

	/**
	 * 查询激活记录
	 */
	@RequestMapping("/getNdsDataActiveLog")
	@ResponseBody
	public Object getNdsDataActiveLog(NdsDataActiveLog bean) throws Exception {
		log.info("getNdsDataActiveLog");
		return CommonAuth.api.getNdsDataActiveLog(Common.CGI.getNdsDataActiveLog(), bean.toMap()).execute().body();

	}

}

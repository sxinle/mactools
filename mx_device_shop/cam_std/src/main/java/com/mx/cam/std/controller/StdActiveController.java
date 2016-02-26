package com.mx.cam.std.controller;

import com.mx.cam.net.conf.Std;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.net.service.StdAuth;
import com.mx.cam.std.model.Activate;

/**
 * 首次激活Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/std/active")
@MustLogin
public class StdActiveController extends BaseController {
	private static Log log = LogFactory.getLog(StdActiveController.class);

	/**
	 * 保存车机用户并首次激活
	 */
	@RequestMapping("/firstActive")
	@ResponseBody
	public Object firstActive(Activate bean) throws Exception {
		log.info("firstActive");
//		if (!bean.validate()) {
//			return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
//		}
		return StdAuth.api.firstActive(Std.CGI.firstActive(), bean.toMap()).execute().body();

	}

}

package com.mx.cam.common.auth.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.auth.model.PrefixInfo;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.net.conf.Common;
import com.mx.cam.net.service.CommonAuth;

/**
 * 刮刮卡类型管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/com/prefixInfo")
@MustLogin
public class PrefixInfoController extends BaseController {
	private static Log log = LogFactory.getLog(PrefixInfoController.class);

	/**
	 * 查询刮刮卡类型
	 */
	@RequestMapping("/getPrefixInfo")
	@ResponseBody
	public Object getPrefixInfo(PrefixInfo bean) throws Exception {
		log.info("getPrefixInfo");
		return CommonAuth.api.getPrefixInfo(Common.CGI.getPrefixInfo(), bean.toMap()).execute().body();

	}

}

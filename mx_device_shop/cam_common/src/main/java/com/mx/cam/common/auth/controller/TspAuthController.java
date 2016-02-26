package com.mx.cam.common.auth.controller;

import com.mx.cam.common.auth.model.TspAuth;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.net.conf.Common;
import com.mx.cam.net.service.CommonAuth;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * tsp服务权限管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/com/tspAuth")
//@MustLogin
public class TspAuthController extends BaseController {
	private static Log log = LogFactory.getLog(TspAuthController.class);

	/**
	 * 查询tsp服务权限
	 */
	@RequestMapping("/getTspAuth")
	@ResponseBody
	public Object getTspAuth(TspAuth bean) throws Exception {
		log.info("getTspAuth");
		return CommonAuth.api.getTspAuth(Common.CGI.getTspAuth(), bean.toMap()).execute().body();
	}

}

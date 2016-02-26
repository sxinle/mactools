package com.mx.cam.common.auth.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.auth.model.Tsp;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.net.conf.Common;
import com.mx.cam.net.service.CommonAuth;

/**
 * tsp服务订单管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/com/tsp")
//@MustLogin
public class TspController extends BaseController {
	private static Log log = LogFactory.getLog(TspController.class);

	/**
	 * 查询tsp服务订单
	 */
	@RequestMapping("/getTsp")
	@ResponseBody
	public Object getTsp(Tsp bean) throws Exception {
		log.info("getTsp");
		return CommonAuth.api.getTsp(Common.CGI.getTsp(), bean.toMap()).execute().body();

	}

}

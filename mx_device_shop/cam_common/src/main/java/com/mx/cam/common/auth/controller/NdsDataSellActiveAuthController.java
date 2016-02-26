package com.mx.cam.common.auth.controller;

import com.mx.cam.net.conf.Common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.auth.model.NdsDataSellActiveAuth;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.net.service.CommonAuth;

/**
 * 销售激活订单管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/com/ndsDataSellActiveAuth")
@MustLogin
public class NdsDataSellActiveAuthController extends BaseController {
	private static Log log = LogFactory.getLog(NdsDataSellActiveAuthController.class);

	/**
	 * 查询销售激活订单
	 */
	@RequestMapping("/getNdsDataSellActiveAuth")
	@ResponseBody
	public Object getNdsDataSellActiveAuth(NdsDataSellActiveAuth bean) throws Exception {
		log.info("getNdsDataSellActiveAuth");
		return CommonAuth.api.getNdsDataSellActiveAuth(Common.CGI.getNdsDataSellActiveAuth(), bean.toMap()).execute().body();

	}

}

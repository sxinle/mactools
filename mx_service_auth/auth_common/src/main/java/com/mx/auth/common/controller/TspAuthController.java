package com.mx.auth.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.model.TspAuthInfo;
import com.mx.auth.common.service.TspAuthService;

/**
 * tsp服务权限管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/tspAuth")
public class TspAuthController extends BaseController {

	@Autowired
	private TspAuthService tspAuthService;

	/**
	 * 查看tsp服务权限
	 */
	@RequestMapping("/getTspAuth")
	public @ResponseBody
	Object getTspAuth(TspAuthInfo bean) throws Exception {
		return tspAuthService.getTspAuth(bean);
	}
}
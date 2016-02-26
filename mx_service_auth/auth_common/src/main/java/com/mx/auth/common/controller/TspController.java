package com.mx.auth.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.model.TspInfo;
import com.mx.auth.common.service.TspService;

/**
 * tsp服务订单管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/tsp")
public class TspController extends BaseController {

	@Autowired
	private TspService tspService;

	/**
	 * 查看tsp服务订单
	 */
	@RequestMapping("/getTsp")
	public @ResponseBody
	Object getTsp(TspInfo bean) throws Exception {
		return tspService.getTsp(bean);
	}
}
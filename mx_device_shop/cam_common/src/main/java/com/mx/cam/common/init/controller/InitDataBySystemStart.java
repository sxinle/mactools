package com.mx.cam.common.init.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.ResponseBuilder;
import com.mx.cam.common.init.model.PayAccount;
import com.mx.cam.common.init.service.InitDataBySystemStartService;

/**
 * 配置监听器,用于读取properties类型的配置文件
 * 
 * @author Chenzy
 * 
 */
@Controller
@RequestMapping("/init")
public class InitDataBySystemStart {
	private static Log logger = LogFactory.getLog(InitDataBySystemStart.class);
	@Autowired
	private InitDataBySystemStartService initDataBySystemStartService;

	static private Map<String, Map<String, Object>> alipayMap = null;

	static private List<PayAccount> weixinMap = null;

	static public Map<String, Map<String, Object>> getAlipayMap() {
		return alipayMap;
	}

	static public List<PayAccount> getWeixinMap() {
		return weixinMap;
	}

	// 程序入口
	@RequestMapping(value = "/loadEncryption")
	@ResponseBody
	private String init() {
		logger.info("Controller ==> loadEncryption Start");

		alipayMap = initDataBySystemStartService.getAlipayClient();

		weixinMap = initDataBySystemStartService.getWeixinPayPram();

		logger.info("Controller ==> loadEncryption loadEncryption");
		return ResponseBuilder.getRespCode(Constants.RESPCODE_SUCCESS);
	}

}

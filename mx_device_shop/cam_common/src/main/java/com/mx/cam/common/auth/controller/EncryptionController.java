package com.mx.cam.common.auth.controller;

import com.mx.cam.net.conf.Common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.auth.model.Encryption;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.net.service.CommonAuth;

/**
 * 加密库管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/com/encryption")
@MustLogin
public class EncryptionController extends BaseController {
	private static Log log = LogFactory.getLog(EncryptionController.class);

	/**
	 * 查询加密库
	 */
	@RequestMapping("/getEncryption")
	@ResponseBody
	public Object getEncryption(Encryption bean) throws Exception {
		log.info("getEncryption");
		return CommonAuth.api.getEncryption(Common.CGI.getEncryption(), bean.toMap()).execute().body();

	}
	
	/**
	 * 修改加密库
	 */
	@RequestMapping("/updateEncryption")
	@ResponseBody
	public Object updateEncryption(Encryption bean) throws Exception {
		log.info("updateEncryption");
		return CommonAuth.api.updateEncryption(Common.CGI.updateEncryption(), bean.toMap()).execute().body();

	}

}

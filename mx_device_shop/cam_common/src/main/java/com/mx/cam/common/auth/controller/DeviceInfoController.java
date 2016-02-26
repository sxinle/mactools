package com.mx.cam.common.auth.controller;

import com.mx.cam.common.auth.model.DeviceInfo;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.net.conf.Common;
import com.mx.cam.net.service.CommonAuth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 设备信息管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/com/deviceInfo")
@MustLogin
public class DeviceInfoController extends BaseController {
	/**
	 * 查询设备信息
	 */
	@RequestMapping("/getDeviceInfo")
	@ResponseBody
	public Object getDeviceInfo(DeviceInfo bean) throws Exception {
		return CommonAuth.api.getDeviceInfo(Common.CGI.getDeviceInfo(), bean.toMap()).execute().body();
	}
	
	/**
	 * 修改设备用户信息
	 */
	@RequestMapping("/updateDeviceInfo")
	@ResponseBody
	public Object updateDeviceInfo(DeviceInfo bean) throws Exception {
		return CommonAuth.api.updateDeviceUserInfo(Common.CGI.updateDeviceUserInfo(), bean.toMap()).execute().body();
	}

}

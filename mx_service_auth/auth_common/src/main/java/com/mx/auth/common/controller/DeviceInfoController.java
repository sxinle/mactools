package com.mx.auth.common.controller;

import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.model.DeviceInfo;
import com.mx.auth.common.service.DeviceInfoService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 设备信息管理Controller
 *
 * @author zhengy
 */
@Controller
@RequestMapping("/deviceInfo")
public class DeviceInfoController extends BaseController {

    private static final Logger logger = LogManager.getLogger(DeviceInfoController.class);

    @Autowired
    private DeviceInfoService deviceInfoService;

    /**
     * 查看设备信息
     */
    @RequestMapping("/getDeviceInfo")
    public
    @ResponseBody
    Object getDeviceInfo(DeviceInfo bean) throws Exception {
        logger.debug("getDeviceInfo=>{}", bean.toString());
        return deviceInfoService.getDeviceInfo(bean);
    }

    /**
     * 修改车机用户信息
     */
    @RequestMapping("/updateDeviceUserInfo")
    @ResponseBody
    public Object updateDeviceUserInfo(DeviceInfo bean) throws Exception {
        logger.debug("updateDeviceUserInfo=>{}", bean.toString());
        return deviceInfoService.updateDeviceUserInfo(bean);
    }
}
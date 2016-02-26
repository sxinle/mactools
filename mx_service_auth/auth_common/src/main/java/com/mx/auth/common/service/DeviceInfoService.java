package com.mx.auth.common.service;

import com.mx.auth.common.model.DeviceInfo;


public interface DeviceInfoService {

    // 查询车机用户信息
    Object getDeviceInfo(DeviceInfo bean) throws Exception;

    // 修改车机用户信息
    Object updateDeviceUserInfo(DeviceInfo bean) throws Exception;

}

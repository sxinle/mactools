package com.mx.auth.mazda.service;


import com.mx.auth.common.model.NdsTopDataVer;

/**
 * 数据升级管理Service
 *
 * @author zhengy
 */
public interface UpgradeService {

    /**
     * 验证车机号是否正确
     */
    String checkDeviceNoUpgrade(String deviceNo) throws Exception;

    /**
     * 全数据升级
     */
    String saveUpgrade(NdsTopDataVer topDataVer) throws Exception;
}

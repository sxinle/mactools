package com.mx.auth.mazda.service;

import com.mx.auth.mazda.beans.TspRenew;

public interface MazdaTspAuthService {

    /**
     * 获取Tsp服务权限
     */
    String getTspAuth(String productId, String deviceNo, String serviceTypes) throws Exception;

    /**
     * tsp 续期
     */
    Object payTspService(TspRenew param) throws Exception;
}

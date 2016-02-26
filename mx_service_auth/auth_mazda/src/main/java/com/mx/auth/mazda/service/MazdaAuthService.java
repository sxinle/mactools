package com.mx.auth.mazda.service;

import com.mx.auth.common.model.Activate;

/**
 * NDS鉴权接口Service
 * 
 * @author zhengy
 * 
 */
public interface MazdaAuthService {

    /**
     * 首次激活
     */
    String firstActive(Activate bean) throws Exception;
}

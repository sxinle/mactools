package com.mx.auth.std.service;

import com.mx.auth.common.model.Activate;


public interface StdAuthService {
	// 首次激活
    Object firstActive(Activate bean) throws Exception;
}

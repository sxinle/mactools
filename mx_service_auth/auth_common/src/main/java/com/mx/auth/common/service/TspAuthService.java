package com.mx.auth.common.service;

import com.mx.auth.common.model.TspAuthInfo;

public interface TspAuthService {

	// 查询tsp服务权限
	Object getTspAuth(TspAuthInfo bean) throws Exception;

}

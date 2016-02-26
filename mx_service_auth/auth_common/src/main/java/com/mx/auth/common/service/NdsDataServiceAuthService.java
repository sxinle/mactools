package com.mx.auth.common.service;

import com.mx.auth.common.model.NdsDataServiceAuth;


public interface NdsDataServiceAuthService {

	// 查询权限信息
	Object getNdsDataServiceAuthManage(NdsDataServiceAuth bean) throws Exception;

}

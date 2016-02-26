package com.mx.auth.common.service;

import com.mx.auth.common.model.NdsTopDataVer;


public interface NdsTopDataVerService {

	// 查询最高版本
	Object getNdsTopDataVerManage(NdsTopDataVer bean) throws Exception;

    Object getMinNdsTopDataVer(NdsTopDataVer bean);
}

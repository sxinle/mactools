package com.mx.auth.common.service;

import com.mx.auth.common.model.NdsDataActiveLog;


public interface NdsDataActiveLogService {

	// 查询激活记录log
	Object getNdsDataActiveLogManage(NdsDataActiveLog bean) throws Exception;

}

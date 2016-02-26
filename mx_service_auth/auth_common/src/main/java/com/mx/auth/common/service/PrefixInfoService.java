package com.mx.auth.common.service;

import com.mx.auth.common.model.PrefixInfo;

public interface PrefixInfoService {

	// 查询刮刮卡类型
	Object getPrefixInfo(PrefixInfo bean) throws Exception;
}

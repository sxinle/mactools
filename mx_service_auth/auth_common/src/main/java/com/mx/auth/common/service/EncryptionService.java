package com.mx.auth.common.service;

import com.mx.auth.common.model.Encryption;

public interface EncryptionService {

	// 获取加密库信息
	Object getEncryptionManage(Encryption bean) throws Exception;

	// 修改加密库信息
	Object updateEncryptionManage(Encryption bean) throws Exception;
}

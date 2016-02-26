package com.mx.auth.common.service;

import com.mx.auth.common.model.AuthOrder;


public interface AuthOrderService {

	// 查询鉴权订单
	Object getAuthOrderManage(AuthOrder bean) throws Exception;

}

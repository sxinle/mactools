package com.mx.auth.common.service;

import com.mx.auth.common.model.TspInfo;



public interface TspService {

	// 查询tsp服务订单
	Object getTsp(TspInfo bean) throws Exception;

}

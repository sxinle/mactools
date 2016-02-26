package com.mx.auth.common.service;

import com.mx.auth.common.model.NdsDataSellActiveAuth;


public interface NdsDataSellActiveAuthService {

	// 查询销售激活订单
	Object getNdsDataSellActiveAuthManage(NdsDataSellActiveAuth bean) throws Exception;

}

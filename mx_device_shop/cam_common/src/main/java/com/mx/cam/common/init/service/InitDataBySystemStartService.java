package com.mx.cam.common.init.service;

import java.util.List;
import java.util.Map;

import com.mx.cam.common.init.model.PayAccount;

/**
 * 配置监听器,用于读取properties类型的配置文件
 * 
 * @author Chenzy
 * 
 */
public interface InitDataBySystemStartService {

	public Map<String, Map<String, Object>> getAlipayClient();

	public List<PayAccount> getWeixinPayPram();

}

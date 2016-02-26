package com.mx.cam.common.init.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.mx.cam.common.init.dao.PayDao;
import com.mx.cam.common.init.model.AlipayParm;
import com.mx.cam.common.init.model.PayAccount;
import com.mx.cam.common.init.service.InitDataBySystemStartService;

/**
 * 配置监听器,用于读取properties类型的配置文件
 * 
 * @author Chenzy
 * 
 */
@Service("initDataBySystemStartService")
// 不同数据源使用不同的事务管理器
@Transactional("shop")
public class InitDataBySystemStartServiceImpl implements
		InitDataBySystemStartService {
	private static Log logger = LogFactory
			.getLog(InitDataBySystemStartServiceImpl.class);

	@Autowired
	private PayDao payDao;

	public Map<String, Map<String, Object>> getAlipayClient() {
		logger.info("Service ==> getAlipayClient()");
		Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
		
		try {
			List<AlipayParm> list = payDao.getAlipayParm();

			for(int i = 0; i < list.size(); i++){
				Map<String, Object> obj = new HashMap<String, Object>();
				AlipayClient alipayClient = new DefaultAlipayClient(
						list.get(i).getAlipay_gateway(), list.get(i).getApp_id(),
						list.get(i).getPrivate_key(), "json", list.get(i).getCharset(),
						list.get(i).getAlipay_public_key());
				obj.put("alipayClient", alipayClient);
				obj.put("url", list.get(i).getNotify_url());
				obj.put("alipay_public_key", list.get(i).getAlipay_public_key());
				obj.put("charset", list.get(i).getCharset());
				obj.put("partner", list.get(i).getPartner());
				
				map.put(list.get(i).getProduct_id(), obj);
			}
			
			
		} catch (Exception e) {
			logger.error(e);
		}
		return map;
	}

	public List<PayAccount> getWeixinPayPram() {
		logger.info("Service ==> getWeixinPayPram()");
		List<PayAccount> list = new ArrayList<PayAccount>();
		try {
			list = payDao.getPayParm();

		} catch (Exception e) {
			logger.error(e);
		}
		return list;
	}

}

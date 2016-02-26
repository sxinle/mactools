package com.mx.auth.common.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.dao.NdsDataSellActiveAuthDao;
import com.mx.auth.common.model.NdsDataSellActiveAuth;
import com.mx.auth.common.service.NdsDataSellActiveAuthService;

@Service
@Transactional
public class NdsDataSellActiveAuthServiceImpl implements NdsDataSellActiveAuthService {

	@Autowired
	private NdsDataSellActiveAuthDao ndsDataSellActiveAuthDao;

	/**
	 * 查询销售激活订单
	 */
	@Override
	public Object getNdsDataSellActiveAuthManage(NdsDataSellActiveAuth bean) throws Exception {

		List<NdsDataSellActiveAuth> list = ndsDataSellActiveAuthDao.getNdsDataSellActiveAuthManage(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

	}

}

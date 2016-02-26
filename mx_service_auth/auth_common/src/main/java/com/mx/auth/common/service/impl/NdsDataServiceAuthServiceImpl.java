package com.mx.auth.common.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.dao.NdsDataServiceAuthDao;
import com.mx.auth.common.model.NdsDataServiceAuth;
import com.mx.auth.common.service.NdsDataServiceAuthService;

@Service
@Transactional
public class NdsDataServiceAuthServiceImpl implements NdsDataServiceAuthService {

	@Autowired
	private NdsDataServiceAuthDao ndsDataServiceAuthDao;

	/**
	 * 查询权限信息
	 */
	@Override
	public Object getNdsDataServiceAuthManage(NdsDataServiceAuth bean) throws Exception {

		List<NdsDataServiceAuth> list = ndsDataServiceAuthDao.getNdsDataServiceAuthManage(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

	}

}

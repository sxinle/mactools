package com.mx.auth.common.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.dao.TspAuthDao;
import com.mx.auth.common.model.TspAuthInfo;
import com.mx.auth.common.service.TspAuthService;

@Service
@Transactional
public class TspAuthServiceImpl implements TspAuthService {

	@Autowired
	private TspAuthDao tspAuthDao;

	/**
	 * 查询tsp服务权限信息
	 */
	@Override
	public Object getTspAuth(TspAuthInfo bean) throws Exception {

		List<TspAuthInfo> list = tspAuthDao.getTspAuth(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

	}

}

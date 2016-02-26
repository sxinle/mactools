package com.mx.auth.common.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.dao.AuthOrderDao;
import com.mx.auth.common.model.AuthOrder;
import com.mx.auth.common.service.AuthOrderService;

@Service
@Transactional
public class AuthOrderServiceImpl implements AuthOrderService {

	@Autowired
	private AuthOrderDao authOrderDao;

	/**
	 * 查询鉴权订单信息
	 */
	@Override
	public Object getAuthOrderManage(AuthOrder bean) throws Exception {

		List<AuthOrder> list = authOrderDao.getAuthOrderManage(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

	}

}

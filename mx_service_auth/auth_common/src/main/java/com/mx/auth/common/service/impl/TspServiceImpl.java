package com.mx.auth.common.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.dao.TspDao;
import com.mx.auth.common.model.TspInfo;
import com.mx.auth.common.service.TspService;

@Service
@Transactional
public class TspServiceImpl implements TspService {

	@Autowired
	private TspDao tspDao;

	/**
	 * 查询tsp服务订单信息
	 */
	@Override
	public Object getTsp(TspInfo bean) throws Exception {

		List<TspInfo> list = tspDao.getTsp(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

	}

}

package com.mx.auth.common.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.dao.NdsDataActiveLogDao;
import com.mx.auth.common.model.NdsDataActiveLog;
import com.mx.auth.common.service.NdsDataActiveLogService;

@Service
@Transactional
public class NdsDataActiveLogServiceImpl implements NdsDataActiveLogService {

	@Autowired
	private NdsDataActiveLogDao ndsDataActiveLogDao;

	/**
	 * 查询激活记录log
	 */
	@Override
	public Object getNdsDataActiveLogManage(NdsDataActiveLog bean) throws Exception {

		List<NdsDataActiveLog> list = ndsDataActiveLogDao.getNdsDataActiveLogManage(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

	}

}

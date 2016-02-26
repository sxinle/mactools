package com.mx.auth.common.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.dao.PrefixInfoDao;
import com.mx.auth.common.model.PrefixInfo;
import com.mx.auth.common.service.PrefixInfoService;

@Service
@Transactional
public class PrefixInfoServiceImpl implements PrefixInfoService {

	@Autowired
	private PrefixInfoDao prefixInfoDao;

	/**
	 * 查询刮刮卡类型
	 */
	@Override
	public Object getPrefixInfo(PrefixInfo bean) throws Exception {

		List<PrefixInfo> list = prefixInfoDao.getPrefixInfo(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

	}
}

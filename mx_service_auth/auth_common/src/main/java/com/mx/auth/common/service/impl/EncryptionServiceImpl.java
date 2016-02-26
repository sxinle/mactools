package com.mx.auth.common.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.dao.EncryptionDao;
import com.mx.auth.common.model.Encryption;
import com.mx.auth.common.service.EncryptionService;

@Service
@Transactional
public class EncryptionServiceImpl implements EncryptionService {

	@Autowired
	private EncryptionDao encryptionDao;

	/**
	 * 获取加密库信息
	 */
	@Override
	public Object getEncryptionManage(Encryption bean) throws Exception {

		List<Encryption> list = encryptionDao.getEncryptionManage(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

	}

	/**
	 * 修改加密库信息
	 * 
	 */

	@Override
	public Object updateEncryptionManage(Encryption bean) throws Exception {

		encryptionDao.updateEncryptionManage(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;

	}
}

package com.mx.cam.std.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.common.Constants;
import com.mx.cam.std.dao.StdDataVerDao;
import com.mx.cam.std.model.DataVer;
import com.mx.cam.std.service.StdDataVerService;

/**
 * 数据版本管理Service
 * 
 * @author zhengy
 * 
 */
@Service
@Transactional("shop")
public class StdDataVerServiceImpl implements StdDataVerService {

	@Autowired
	private StdDataVerDao stdDataVerDao;

	/**
	 * 查询列表
	 */
	@Override
	public Object getDataVerManage(DataVer bean) throws Exception {
		List<DataVer> list = stdDataVerDao.getDataVerManage(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

	}

	/**
	 * 删除列表
	 * 
	 */
	@Override
	public Object deleteDataVerManage(String ids) throws Exception {

		JSONObject json = new JSONObject();
		String[] idArray = ids.split(",");
		stdDataVerDao.deleteDataVerManage(idArray);
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;
	}

	/**
	 * 保存列表
	 * 
	 */
	@Override
	public Object saveDataVerManage(DataVer bean) throws Exception {

		JSONObject json = new JSONObject();
		int num = stdDataVerDao.checkDataVerId(bean);
		if (num > 0) {
			json.put("respCode", Constants.RESPCODE_ERR_SAME);
			return json;
		}
		if ("".equals(bean.getId())||bean.getId() == null) {
			stdDataVerDao.insertDataVer(bean);
		} else {
			stdDataVerDao.updateDataVer(bean);
		}
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;

	}

}

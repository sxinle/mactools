package com.mx.cam.mazda.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.common.Constants;
import com.mx.cam.mazda.dao.MazdaCatagoryDao;
import com.mx.cam.mazda.dao.MazdaGoodsDao;
import com.mx.cam.mazda.model.Catagory;
import com.mx.cam.mazda.service.MazdaCatagoryService;

@Service
@Transactional("shop")
public class MazdaCatagoryServiceImpl implements MazdaCatagoryService {

	@Autowired
	private MazdaCatagoryDao mazdaCatagoryDao;

	@Autowired
	private MazdaGoodsDao mazdaGoodsDao;

	/**
	 * 查询商品类别信息列表
	 */
	@Override
	public Object getCatagoryManage(Catagory bean) throws Exception {
		List<Catagory> list = mazdaCatagoryDao.getCatagoryManage(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

	}

	/**
	 * 删除某些商品类别信息
	 * 
	 */
	@Override
	public Object deleteCatagoryManage(String ids) throws Exception {
		JSONObject json = new JSONObject();
		String[] idArray = ids.split(",");
		int num = mazdaGoodsDao.checkUsedByCatagoryId(idArray);
		if (num > 0) {
			json.put("respCode", Constants.RESPCODE_ERR_USED);
			return json;
		}
		mazdaCatagoryDao.deleteCatagoryManage(idArray);
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;
	}

	/**
	 * 添加修改商品类别信息
	 * 
	 */
	@Override
	public Object saveCatagoryManage(Catagory bean) throws Exception {
		JSONObject json = new JSONObject();
		int num = mazdaCatagoryDao.checkCatagoryId(bean);
		if (num > 0) {
			json.put("respCode", Constants.RESPCODE_ERR_SAME);
			return json;
		}
		if ("".equals(bean.getId())||bean.getId()==null) {
			mazdaCatagoryDao.saveCatagory(bean);
		} else {
			mazdaCatagoryDao.updateCatagory(bean);

			// 类别ID变更
			if (!bean.getId().equals(bean.getCatagory_id())) {
				// 更新商品表中的类别ID
				mazdaGoodsDao.updateGoodsCatagoryId(bean);
			}
		}
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;
	}

}

package com.mx.cam.mazda.service.impl;

import com.mx.cam.common.common.Constants;
import com.mx.cam.mazda.dao.MazdaGoodsDao;
import com.mx.cam.mazda.model.Goods;
import com.mx.cam.mazda.service.MazdaGoodsService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional("shop")
public class MazdaGoodsServiceImpl implements MazdaGoodsService {

	@Autowired
	private MazdaGoodsDao mazdaGoodsDao;

	/**
	 * 获取商品信息列表
	 * 
	 */
	@Override
	public Object getGoodsManage(Goods bean) throws Exception {

		List<Goods> list = mazdaGoodsDao.getGoodsManage(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;
	}

	/**
	 * 删除某些商品信息
	 * 
	 */
	@Override
	public Object deleteGoodsManage(String ids) throws Exception {
		JSONObject json = new JSONObject();
		String[] idArray = ids.split(",");
		mazdaGoodsDao.deleteGoodsManage(idArray);
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;
	}

	/**
	 * 增加修改某些商品信息
	 * 
	 */
	@Override
	public Object saveGoodsManage(Goods bean) throws Exception {
		JSONObject json = new JSONObject();
		int num = mazdaGoodsDao.checkGoodsId(bean);
		if (num > 0) {
			json.put("respCode", Constants.RESPCODE_ERR_SAME);
			return json;
		}
		if ("".equals(bean.getId())||bean.getId()==null) {
			mazdaGoodsDao.saveGoods(bean);
		} else {
			mazdaGoodsDao.updateGoods(bean);
		}

		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;
	}

    @Override
    public Object getServiceGoods() throws Exception {
        JSONObject root = new JSONObject();
        root.put("respCode", Constants.RESPCODE_SUCCESS);
        root.put("rows", mazdaGoodsDao.getServiceGoods());
        return root;
    }

    @Override
    public Object getAllServices() {
        JSONObject root = new JSONObject();
        root.put("respCode", Constants.RESPCODE_SUCCESS);
        root.put("rows", mazdaGoodsDao.getAllServices());
        return root;
    }
}

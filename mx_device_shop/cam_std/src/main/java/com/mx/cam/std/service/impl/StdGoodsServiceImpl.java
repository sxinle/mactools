package com.mx.cam.std.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.RandomGUID;
import com.mx.cam.std.dao.StdGoodsComboDao;
import com.mx.cam.std.dao.StdGoodsDao;
import com.mx.cam.std.dao.StdGoodsGroupDao;
import com.mx.cam.std.model.Goods;
import com.mx.cam.std.model.GoodsCombo;
import com.mx.cam.std.model.GoodsGroup;
import com.mx.cam.std.service.StdGoodsService;

@Service("stdGoodsService")
@Transactional("shop")
public class StdGoodsServiceImpl implements StdGoodsService {

	@Autowired
	private StdGoodsDao stdGoodsDao;
	@Autowired
	private StdGoodsComboDao stdGoodsComboDao;
	@Autowired
	private StdGoodsGroupDao stdGoodsGroupDao;

	/**
	 * 查询商品管理信息列表
	 */
	@Override
	public Object getGoodsManage(Goods bean) throws Exception {
		
		List<Goods> list = stdGoodsDao.getGoodsManage(bean);
		
		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

	}

	/**
	 * 删除商品管理信息
	 * 
	 */
	@Override
	public Object deleteGoodsManage(String ids) throws Exception {
		
		JSONObject json = new JSONObject();
		
		String[] idArray = ids.split(",");
		int num = stdGoodsGroupDao.getGoodsGroupByGoodsIdCount(idArray);
		if (num > 0) {
			json.put("respCode", Constants.RESPCODE_ERR_USED);
			return json;
		}
		// 删除主商品表数据
		stdGoodsDao.deleteGoodsManage(idArray);
		// 删除商品套餐表数据
		stdGoodsComboDao.deleteGoodsComboByGoodsId(idArray);
		// 删除组合商品关系表数据
		stdGoodsGroupDao.deleteGoodsGroupByGoodsPid(idArray);
		
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;
	}

	/**
	 * 查询商品套餐列表
	 */
	@Override
	public Object getGoodsComboManage(GoodsCombo bean) throws Exception {
		List<GoodsCombo> list =  stdGoodsComboDao.getGoodsComboManage(bean);
		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

	}

	/**
	 * 查询组合商品子商品信息列表
	 */
	@Override
	public Object getGoodsGroupManage(GoodsGroup bean) throws Exception {
		List<GoodsGroup> list = stdGoodsGroupDao.getGoodsGroupManage(bean);
		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;
	}

	/**
	 * 更新商品上下架状态
	 */
	@Override
	public Object updateGoodsUpDownFlag(Goods bean) throws Exception {
		
		JSONObject json = new JSONObject();
		// 更新商品上下架状态
		stdGoodsDao.updateGoodsUpDownFlag(bean);
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;
	}

	/**
	 * 添加商品
	 */
	@Override
	public Object insertGoodsManage(Goods bean) throws Exception {

		JSONObject json = new JSONObject();
		// 添加商品信息
		RandomGUID g_id = new RandomGUID(true);
		String goods_id = g_id.toString();
		bean.setGoods_id(goods_id);
		stdGoodsDao.insertGoods(bean);

		List<GoodsCombo> goodsComboList = bean.getGoodsComboList();
		for (int i = 0; i < goodsComboList.size(); i++) {
			// 添加商品套餐信息
			RandomGUID c_id = new RandomGUID(true);
			String combo_id = c_id.toString();
			GoodsCombo comboBean = goodsComboList.get(i);
			comboBean.setGoods_id(goods_id);
			comboBean.setCombo_id(combo_id);
			stdGoodsComboDao.insertGoodsCombo(comboBean);
		}

		if ("1".equals(bean.getGroup_flag())) {
			String[] groupId = bean.getGroupIds();
			for (int j = 0; j < groupId.length; j++) {
				// 添加组合商品信息
				GoodsGroup groupBean = new GoodsGroup();
				groupBean.setGoods_pid(goods_id);
				groupBean.setGoods_id(groupId[j]);
				stdGoodsGroupDao.insertGoodsGroup(groupBean);
			}
		}

		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;

	}

	/**
	 * 查询商品明细
	 */
	@Override
	public Object getGoodsItem(Goods bean) throws Exception {
		Goods goods = new Goods();
		// 查询商品表明细
		goods = stdGoodsDao.getGoodsItem(bean);

		// 查询商品套餐明细
		GoodsCombo comboBean = new GoodsCombo();
		comboBean.setGoods_id(bean.getGoods_id());
		List<GoodsCombo> comboList = stdGoodsComboDao
				.getGoodsComboManage(comboBean);
		goods.setGoodsComboList(comboList);

		// 商品为组合商品
		if ("1".equals(goods.getGroup_flag())) {
			// 查询组合商品明细
			GoodsGroup groupBean = new GoodsGroup();
			groupBean.setGoods_pid(bean.getGoods_id());
			List<GoodsGroup> groupList = stdGoodsGroupDao
					.getGoodsGroupManage(groupBean);
			goods.setGoodsGroupList(groupList);
		}

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("data", goods);
		return json;
	}

	/**
	 * 编辑商品
	 */
	@Override
	public Object updateGoodsManage(Goods bean) throws Exception {

		JSONObject json = new JSONObject();
		
		String goods_id = bean.getGoods_id();
		String[] idArray = { goods_id };
		// 删除商品套餐表数据
		stdGoodsComboDao.deleteGoodsComboByGoodsId(idArray);
		// 删除组合商品关系表数据
		stdGoodsGroupDao.deleteGoodsGroupByGoodsPid(idArray);

		// 更新商品信息
		stdGoodsDao.updateGoods(bean);

		List<GoodsCombo> goodsComboList = bean.getGoodsComboList();
		for (int i = 0; i < goodsComboList.size(); i++) {
			// 添加商品套餐信息
			RandomGUID c_id = new RandomGUID(true);
			String combo_id = c_id.toString();
			GoodsCombo comboBean = goodsComboList.get(i);
			comboBean.setGoods_id(goods_id);
			comboBean.setCombo_id(combo_id);
			stdGoodsComboDao.insertGoodsCombo(comboBean);
		}

		if ("1".equals(bean.getGroup_flag())) {
			String[] groupId = bean.getGroupIds();
			for (int j = 0; j < groupId.length; j++) {
				// 添加组合商品信息
				GoodsGroup groupBean = new GoodsGroup();
				groupBean.setGoods_pid(goods_id);
				groupBean.setGoods_id(groupId[j]);
				stdGoodsGroupDao.insertGoodsGroup(groupBean);
			}
		}

		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;

	}

}

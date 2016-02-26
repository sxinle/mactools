package com.mx.cam.std.dao;

import java.util.List;

import com.mx.cam.std.model.GoodsCombo;

/**
 * 商品套餐管理
 * 
 * @author zhengy
 */

public interface StdGoodsComboDao {

	// 删除商品套餐表数据
	public void deleteGoodsComboByGoodsId(String[] ids);

	// 查询商品套餐列表
	public List<GoodsCombo> getGoodsComboManage(GoodsCombo bean);

	// 添加商品套餐
	public void insertGoodsCombo(GoodsCombo bean);

}

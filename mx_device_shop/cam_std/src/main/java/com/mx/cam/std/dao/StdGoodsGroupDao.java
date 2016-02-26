package com.mx.cam.std.dao;

import java.util.List;

import com.mx.cam.std.model.GoodsGroup;

/**
 * 组合商品关系管理
 * 
 * @author zhengy
 */

public interface StdGoodsGroupDao {

	// 删除组合商品关系数据
	public void deleteGoodsGroupByGoodsPid(String[] ids);

	// 查询商品是否被组合商品使用
	public int getGoodsGroupByGoodsIdCount(String[] ids);

	// 查询组合商品的子商品列表
	public List<GoodsGroup> getGoodsGroupManage(GoodsGroup bean);
	
	// 添加组合商品信息
	public void insertGoodsGroup(GoodsGroup bean);

}

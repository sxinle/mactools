package com.mx.cam.std.dao;

import java.util.List;

import com.mx.cam.std.model.Goods;

/**
 * 商品管理
 * 
 * @author zhengy
 */

public interface StdGoodsDao {

	// 查询商品管理信息列表
	public List<Goods> getGoodsManage(Goods bean);

	// 删除商品信息
	public void deleteGoodsManage(String[] ids);

	// 更新商品上下架状态
	public void updateGoodsUpDownFlag(Goods bean);

	// 添加商品信息
	public void insertGoods(Goods bean);

	// 查询商品明细
	public Goods getGoodsItem(Goods bean);

	// 更新商品信息
	public void updateGoods(Goods bean);

}

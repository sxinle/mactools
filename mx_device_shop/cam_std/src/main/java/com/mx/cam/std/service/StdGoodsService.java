package com.mx.cam.std.service;

import com.mx.cam.std.model.Goods;
import com.mx.cam.std.model.GoodsCombo;
import com.mx.cam.std.model.GoodsGroup;

public interface StdGoodsService {

	// 查询商品列表
	Object getGoodsManage(Goods bean) throws Exception;

	// 删除商品信息
	Object deleteGoodsManage(String ids) throws Exception;

	// 查询商品套餐列表
	Object getGoodsComboManage(GoodsCombo bean) throws Exception;

	// 查询组合商品子商品信息列表
	Object getGoodsGroupManage(GoodsGroup bean) throws Exception;

	// 更新商品上下架状态
	Object updateGoodsUpDownFlag(Goods bean) throws Exception;

	// 添加商品
	Object insertGoodsManage(Goods bean) throws Exception;

	// 查询商品明细
	Object getGoodsItem(Goods bean) throws Exception;

	// 编辑商品
	Object updateGoodsManage(Goods bean) throws Exception;

}

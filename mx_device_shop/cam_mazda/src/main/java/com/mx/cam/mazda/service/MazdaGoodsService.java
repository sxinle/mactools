package com.mx.cam.mazda.service;

import com.mx.cam.mazda.model.Goods;

public interface MazdaGoodsService {

	// 获取商品信息列表
	Object getGoodsManage(Goods bean) throws Exception;

	// 删除某些商品信息
	Object deleteGoodsManage(String ids) throws Exception;

	// 增加修改某些商品信息
	Object saveGoodsManage(Goods bean) throws Exception;

    // 获取服务类商品
    Object getServiceGoods() throws Exception;

    // 获取服务列表
    Object getAllServices();
}

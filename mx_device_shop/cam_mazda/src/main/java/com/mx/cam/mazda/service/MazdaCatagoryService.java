package com.mx.cam.mazda.service;

import com.mx.cam.mazda.model.Catagory;

public interface MazdaCatagoryService {

	// 查询商品类别信息列表
	Object getCatagoryManage(Catagory bean) throws Exception;

	// 删除某些商品信息
	Object deleteCatagoryManage(String ids) throws Exception;

	// 添加修改某些商品信息
	Object saveCatagoryManage(Catagory bean) throws Exception;

}

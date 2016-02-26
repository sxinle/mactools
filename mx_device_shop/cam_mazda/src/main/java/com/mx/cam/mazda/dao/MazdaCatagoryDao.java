package com.mx.cam.mazda.dao;


import com.mx.cam.mazda.model.Catagory;

import java.util.List;

/**
 * 
 * 商品类别信息管理
 * 
 * @ClassName: EncryptionPathDao
 * @author 张雪健（zhangxj@meixing.com）
 * @date 2015年7月21日 下午5:12:07
 */

public interface MazdaCatagoryDao {

	// 查询商品类别信息列表
    List<Catagory> getCatagoryManage(Catagory bean);

	// 删除某些商品类别信息
    void deleteCatagoryManage(String[] ids);

	// 验证商品类别信息是否重复
    int checkCatagoryId(Catagory bean);

	// 添加商品类别信息
    void saveCatagory(Catagory bean);

	// 修改商品类别信息
    void updateCatagory(Catagory bean);

}

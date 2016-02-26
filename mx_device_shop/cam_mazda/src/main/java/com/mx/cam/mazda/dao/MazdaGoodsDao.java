package com.mx.cam.mazda.dao;


import com.mx.cam.mazda.model.Catagory;
import com.mx.cam.mazda.model.Goods;
import com.mx.cam.mazda.model.GoodsService;

import java.util.List;

/**
 * 
 * 商品管理Dao
 * 
 * @ClassName: GoodsDao
 * @author 张雪健（zhangxj@meixing.com）
 * @date 2015年7月21日 下午5:12:07
 */

public interface MazdaGoodsDao {

    // 获取商品信息
    List<Goods> getGoodsManage(Goods bean);

    // 删除商品信息
    void deleteGoodsManage(String[] ids);

    // 验证商品信息是否重复
    int checkGoodsId(Goods bean);

    // 添加商品信息
    void saveGoods(Goods bean);

    // 修改商品信息
    void updateGoods(Goods bean);

    // 通过商品类别id判断是否有与商品系列表的关联
    int checkUsedByCatagoryId(String[] ids);
    
    //更新商品表中的类别ID
    void updateGoodsCatagoryId(Catagory bean);

    List<Goods> getGoods(String[] catagoryIds);

    //根据商品ID取得商品信息
    List<Goods> getGoodsById(String[] idArray);

    // 获取服务类商品
    List<Goods> getServiceGoods();

    // 获取服务列表
    List<GoodsService> getAllServices();
}

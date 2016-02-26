package com.mx.auth.common.dao;

import com.mx.auth.common.model.Product;

import java.util.List;

/**
 * 产品系列管理
 * @author zhengy
 */

public interface ProductDao {

	// 查询产品系列信息列表
    List<Product> getProductManage(Product bean);

	// 修改产品系列信息
    void updateProductManage(Product bean);

}

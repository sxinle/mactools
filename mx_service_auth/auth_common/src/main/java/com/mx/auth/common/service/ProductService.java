package com.mx.auth.common.service;

import com.mx.auth.common.model.Product;

public interface ProductService {

	// 查询产品系列列表(for web)
	Object getProductManage(Product bean) throws Exception;

	// 修改产品系列名称信息
	Object updateProductManage(Product bean) throws Exception;

	// 查询产品系列列表
    Object getProductSeries(Product bean) throws Exception;
}

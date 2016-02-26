package com.mx.auth.common.service.impl;

import java.util.Iterator;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.PdpServerConnector;
import com.mx.auth.common.dao.ProductDao;
import com.mx.auth.common.model.Product;
import com.mx.auth.common.service.ProductService;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;

	/**
	 * 查询产品系列信息列表
	 */
	@Override
	public Object getProductManage(Product bean) throws Exception {

		List<Product> list = productDao.getProductManage(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

	}

	/**
	 * 修改产品系列信息
	 * 
	 */
	@Override
	public Object updateProductManage(Product product) throws Exception {
		productDao.updateProductManage(product);
		// 清空PDP中对应的权限数据缓存
        PdpServerConnector.instance().clearCustomerAuthCache(product.getProduct_id());
		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;
	}

	/**
     * 取得产品系列信息列表
     */
    @Override
    public Object getProductSeries(Product bean) throws Exception {
        List<Product> series = productDao.getProductManage(bean);
        JSONObject root = new JSONObject();
        JSONArray result = new JSONArray();
        Iterator<Product> it = series.iterator();
        while (it.hasNext()) {
            Product item = it.next();
            JSONObject product = new JSONObject();
            product.put("id", item.getProduct_id());
            product.put("name", item.getProduct_name());
            product.put("secretKey", item.getSecret_key());
            product.put("permission", item.getPermission());
            result.add(product);
        }
        root.put("respCode", Constants.RESPCODE_SUCCESS);
        root.put("result", result);
        return root;
    }
}

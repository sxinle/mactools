package com.mx.cam.mazda.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.common.Constants;
import com.mx.cam.mazda.dao.MazdaOrderItemDao;
import com.mx.cam.mazda.model.OrderItem;
import com.mx.cam.mazda.service.MazdaOrderItemService;

/**
 * 订单明细管理Service
 * 
 * @author zhengy
 * 
 */
@Service
@Transactional("shop")
public class MazdaOrderItemServiceImpl implements MazdaOrderItemService {

	@Autowired
	private MazdaOrderItemDao mazdaOrderItemDao;

	/**
	 * 查询订单明细列表
	 */
	@Override
	public Object getOrderItem(OrderItem bean) throws Exception {

		// 查询订单明细列表
		List<OrderItem> list = mazdaOrderItemDao.getOrderItem(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;
	}

}

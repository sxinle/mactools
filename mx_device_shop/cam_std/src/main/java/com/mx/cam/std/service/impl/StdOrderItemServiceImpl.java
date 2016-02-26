package com.mx.cam.std.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.common.Constants;
import com.mx.cam.std.dao.StdOrderItemDao;
import com.mx.cam.std.model.OrderItem;
import com.mx.cam.std.service.StdOrderItemService;

/**
 * 订单明细管理Service
 * 
 * @author zhengy
 * 
 */
@Service("stdOrderItemService")
@Transactional("shop")
public class StdOrderItemServiceImpl implements StdOrderItemService {

	@Autowired
	private StdOrderItemDao stdOrderItemDao;

	/**
	 * 查询订单明细列表
	 */
	@Override
	public Object getOrderItem(OrderItem bean) throws Exception {

		// 查询订单明细列表
		List<OrderItem> list = stdOrderItemDao.getOrderItem(bean);

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;
	}

}

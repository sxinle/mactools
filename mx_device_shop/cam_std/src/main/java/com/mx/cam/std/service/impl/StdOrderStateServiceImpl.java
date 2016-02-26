package com.mx.cam.std.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.common.Constants;
import com.mx.cam.std.dao.StdOrderStateDao;
import com.mx.cam.std.model.OrderState;
import com.mx.cam.std.service.StdOrderStateService;

/**
 * 订单状态管理Service
 * 
 * @author zhengy
 * 
 */
@Service("stdOrderStateService")
@Transactional("shop")
public class StdOrderStateServiceImpl implements StdOrderStateService {

	@Autowired
	private StdOrderStateDao stdOrderStateDao;

	/**
	 * 查询订单状态列表
	 */
	@Override
	public Object getOrderState(OrderState bean) throws Exception {

		// 查询订单状态列表
		List<OrderState> list = stdOrderStateDao.getOrderState(bean);
		
		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("data", list);
		return json;
	}

}

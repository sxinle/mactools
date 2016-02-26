package com.mx.cam.mazda.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.common.Constants;
import com.mx.cam.mazda.dao.MazdaOrderStateDao;
import com.mx.cam.mazda.model.OrderState;
import com.mx.cam.mazda.service.MazdaOrderStateService;

/**
 * 订单状态管理Service
 * 
 * @author zhengy
 * 
 */
@Service
@Transactional("shop")
public class MazdaOrderStateServiceImpl implements MazdaOrderStateService {

	@Autowired
	private MazdaOrderStateDao mazdaOrderStateDao;

	/**
	 * 查询订单状态列表
	 */
	@Override
	public Object getOrderState() throws Exception {

		// 查询订单状态列表
		List<OrderState> list = mazdaOrderStateDao.getOrderState();

		JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		return json;
	}

}

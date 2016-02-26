package com.mx.cam.mazda.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.common.Constants;
import com.mx.cam.mazda.dao.MazdaPaymentModeDao;
import com.mx.cam.mazda.model.PaymentMode;
import com.mx.cam.mazda.service.MazdaPaymentModeService;

/**
 * 支付方式管理Service
 * 
 * @author zhengy
 * 
 */
@Service
@Transactional("shop")
public class MazdaPaymentModeServiceImpl implements MazdaPaymentModeService {

	@Autowired
	private MazdaPaymentModeDao mazdapaymentModeDao;

	/**
	 * 查询支付方式列表
	 */
	@Override
	public Object getPaymentMode() throws Exception {

		// 查询支付方式列表
		List<PaymentMode> list = mazdapaymentModeDao.getPaymentMode();

        JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		return json;
	}

}

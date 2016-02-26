package com.mx.cam.std.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.common.Constants;
import com.mx.cam.std.dao.StdPaymentModeDao;
import com.mx.cam.std.model.PaymentMode;
import com.mx.cam.std.model.ProductPayment;
import com.mx.cam.std.service.StdPaymentModeService;

/**
 * 支付方式管理Service
 * 
 * @author zhengy
 * 
 */
@Service
@Transactional("shop")
public class StdPaymentModeServiceImpl implements StdPaymentModeService {

	@Autowired
	private StdPaymentModeDao stdPaymentModeDao;

	/**
	 * 查询支付方式列表
	 */
	@Override
	public Object getPaymentMode() throws Exception {

		// 查询支付方式列表
		List<PaymentMode> list = stdPaymentModeDao.getPaymentMode();

        JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		return json;
	}
	
	/**
	 * 绑定支付方式
	 */
	@Override
	public Object saveProductPayment(ProductPayment bean) throws Exception {

		//删除旧的绑定支付方式
		stdPaymentModeDao.deleteProductPayment(bean);
		
		for(int i = 0;i<bean.getMode_ids().length; i++){
			ProductPayment parm = new ProductPayment();
			parm.setProduct_id(bean.getProduct_id());
			parm.setMode_id(bean.getMode_ids()[i]);
			//绑定新的支付方式
			stdPaymentModeDao.saveProductPayment(parm);
		}

        JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;
	}

}

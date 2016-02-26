package com.mx.cam.std.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.common.MustLogin;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.std.model.ProductPayment;
import com.mx.cam.std.service.StdPaymentModeService;

/**
 * 支付方式Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("std/paymentMode")
@MustLogin
public class StdPaymentModeController extends BaseController {
	private static Log log = LogFactory.getLog(StdPaymentModeController.class);

	@Autowired
	private StdPaymentModeService stdPaymentModeService;

	/**
	 * 取得支付方式列表数据
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getPaymentMode")
	public @ResponseBody
	Object getPaymentMode() throws Exception {
		log.info("getPaymentMode");
		
		return stdPaymentModeService.getPaymentMode();
	}
	/**
	 * 绑定支付方式
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveProductPayment")
	public @ResponseBody
	Object saveProductPayment(ProductPayment bean) throws Exception {
		log.info("saveProductPayment");
		
		return stdPaymentModeService.saveProductPayment(bean);
	}

}
package com.mx.cam.mazda.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.mazda.service.MazdaPaymentModeService;

/**
 * 支付方式Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/paymentMode")
@MustLogin
public class MazdaPaymentModeController extends BaseController {
	private static Log log = LogFactory.getLog(MazdaPaymentModeController.class);

	@Autowired
	private MazdaPaymentModeService mazdaPaymentModeService;

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
		
		return mazdaPaymentModeService.getPaymentMode();
	}

}
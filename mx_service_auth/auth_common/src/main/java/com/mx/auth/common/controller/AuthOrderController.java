package com.mx.auth.common.controller;

import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.model.AuthOrder;
import com.mx.auth.common.service.AuthOrderService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 鉴权订单管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/authOrder")
public class AuthOrderController extends BaseController {

    private static final Logger logger = LogManager.getLogger(AuthOrderController.class);

	@Autowired
	private AuthOrderService authOrderService;

	/**
	 * 查看设备信息
	 */
	@RequestMapping("/getAuthOrder")
	public @ResponseBody
	Object getAuthOrder(AuthOrder bean) throws Exception {
        logger.debug("getAuthOrder=>{}", bean.toString());
        return authOrderService.getAuthOrderManage(bean);
	}
}
package com.mx.cam.std.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.std.model.OrderItem;
import com.mx.cam.std.service.StdOrderItemService;

/**
 * 订单管理明细Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/std/orderItem")
@MustLogin
public class StdOrderItemController extends BaseController {
	private static Log log = LogFactory.getLog(StdOrderItemController.class);

	@Autowired
	private StdOrderItemService stdOrderItemService;

	/**
	 * 取得订单明细数据
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getOrderItem")
	public @ResponseBody
	Object getOrderItem(OrderItem bean) throws Exception {
		log.info("getOrderItem");

		return stdOrderItemService.getOrderItem(bean);
	}

}
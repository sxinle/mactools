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
import com.mx.cam.mazda.model.OrderItem;
import com.mx.cam.mazda.service.MazdaOrderItemService;

/**
 * 订单管理明细Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/orderItem")
@MustLogin
public class MazdaOrderItemController extends BaseController {
	private static Log log = LogFactory.getLog(MazdaOrderItemController.class);

	@Autowired
	private MazdaOrderItemService mazdaOrderItemService;

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

		return mazdaOrderItemService.getOrderItem(bean);
	}

}
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
import com.mx.cam.mazda.model.Catagory;
import com.mx.cam.mazda.service.MazdaCatagoryService;

/**
 * 商品类别管理Controller
 * 
 * @author zhengxj
 */
@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/catagory")
@MustLogin
public class MazdaCatagoryController extends BaseController {
	private static Log log = LogFactory.getLog(MazdaCatagoryController.class);

	@Autowired
	private MazdaCatagoryService mazdaCatagoryService;

	/**
	 * 在商品类别表中查找数据
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getCatagoryManage")
	public @ResponseBody
	Object getCatagoryManage(Catagory bean) throws Exception {
		log.info("getCatagoryManage");

		return mazdaCatagoryService.getCatagoryManage(bean);
	}

	/**
	 * 在商品类别表中删除数据
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteCatagoryManage")
	public @ResponseBody
	Object deleteCatagoryManage(String ids) throws Exception {
		log.info("deleteCatagoryManage");

		return mazdaCatagoryService.deleteCatagoryManage(ids);
	}

	/**
	 * 在商品类别表中添加修改数据
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveCatagoryManage")
	public @ResponseBody
	Object saveCatagoryManage(Catagory bean) throws Exception {
		log.info("saveCatagoryManage");

		return mazdaCatagoryService.saveCatagoryManage(bean);
	}
}
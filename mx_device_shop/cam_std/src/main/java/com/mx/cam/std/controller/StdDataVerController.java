package com.mx.cam.std.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.std.model.DataVer;
import com.mx.cam.std.service.StdDataVerService;

/**
 * 数据版本号管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/std/dataVer")
@MustLogin
public class StdDataVerController extends BaseController {
	private static Log log = LogFactory.getLog(StdDataVerController.class);

	@Autowired
	private StdDataVerService stdDataVerService;

	/**
	 * 查询数据版本信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getDataVerManage")
	public @ResponseBody
	Object getSoftVerManage(DataVer bean) throws Exception {
		log.info("getDataVerManage");

		return stdDataVerService.getDataVerManage(bean);
	}

	/**
	 * 删除数据版本信息
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteDataVerManage")
	public @ResponseBody
	Object deleteDataVerManage(String ids) throws Exception {
		log.info("deleteDataVerManage");

		return stdDataVerService.deleteDataVerManage(ids);
	}

	/**
	 * 添加修改数据版本信息
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveDataVerManage")
	public @ResponseBody
	Object saveSoftVerManage(DataVer bean) throws Exception {
		log.info("saveDataVerManage");

		return stdDataVerService.saveDataVerManage(bean);
	}

}
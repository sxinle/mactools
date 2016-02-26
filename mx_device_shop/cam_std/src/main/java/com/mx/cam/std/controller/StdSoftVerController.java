package com.mx.cam.std.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.std.model.SoftVer;
import com.mx.cam.std.service.StdSoftVerService;

/**
 * 软件版本号管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/std/softVer")
@MustLogin
public class StdSoftVerController extends BaseController {
	private static Log log = LogFactory.getLog(StdSoftVerController.class);

	@Autowired
	private StdSoftVerService stdSoftVerService;

	/**
	 * 查询软件版本管理数据
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getSoftVerManage")
	public @ResponseBody
	Object getSoftVerManage(SoftVer bean) throws Exception {
		log.info("getSoftVerManage");

		return stdSoftVerService.getSoftVerManage(bean);
	}

	/**
	 * 删除软件版本数据
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteSoftVerManage")
	public @ResponseBody
	Object deleteSoftVerManage(String ids) throws Exception {
		log.info("deleteSoftVerManage");

		return stdSoftVerService.deleteSoftVerManage(ids);
	}

	/**
	 * 添加或修改软件版本数据
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveSoftVerManage")
	public @ResponseBody
	Object saveSoftVerManage(SoftVer bean) throws Exception {
		log.info("saveSoftVerManage");

		return stdSoftVerService.saveSoftVerManage(bean);
	}

}
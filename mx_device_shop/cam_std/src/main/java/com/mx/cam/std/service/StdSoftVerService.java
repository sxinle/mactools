package com.mx.cam.std.service;

import com.mx.cam.std.model.SoftVer;

/**
 * 软件版本管理Service
 * 
 * @author zhengy
 * 
 */
public interface StdSoftVerService {

	/**
	 * 查询软件版本列表
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object getSoftVerManage(SoftVer bean) throws Exception;

	/**
	 * 删除软件版本信息
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	Object deleteSoftVerManage(String ids) throws Exception;

	/**
	 * 保存软件版本信息
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object saveSoftVerManage(SoftVer bean) throws Exception;

}

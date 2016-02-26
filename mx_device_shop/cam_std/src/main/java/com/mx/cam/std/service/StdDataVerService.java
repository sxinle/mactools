package com.mx.cam.std.service;

import com.mx.cam.std.model.DataVer;

/**
 * 数据版本版本管理Service
 * 
 * @author zhengy
 * 
 */
public interface StdDataVerService {

	/**
	 * 查询数据版本列表
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object getDataVerManage(DataVer bean) throws Exception;

	/**
	 * 删除数据版本
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	Object deleteDataVerManage(String ids) throws Exception;

	/**
	 * 保存数据版本
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	Object saveDataVerManage(DataVer bean) throws Exception;

}

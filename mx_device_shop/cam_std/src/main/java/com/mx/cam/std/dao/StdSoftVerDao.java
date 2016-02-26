package com.mx.cam.std.dao;

import java.util.List;

import com.mx.cam.std.model.SoftVer;

/**
 * 软件版本管理Dao
 * 
 * @author zhangxj
 * 
 */
public interface StdSoftVerDao {

	// 查询软件版本列表
	public List<SoftVer> getSoftVerManage(SoftVer bean);

	// 删除软件版本
	public void deleteSoftVerManage(String[] ids);

	// 验证是否重复
	public int checkSoftVerId(SoftVer bean);

	// 添加软件版本
	public void insertSoftVer(SoftVer bean);

	// 更新软件版本
	public void updateSoftVer(SoftVer bean);

}

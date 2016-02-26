package com.mx.cam.std.dao;

import java.util.List;

import com.mx.cam.std.model.DataVer;

/**
 * 数据版本管理Dao
 * 
 * @author zhengy
 * 
 */
public interface StdDataVerDao {

	// 查询数据版本列表
	public List<DataVer> getDataVerManage(DataVer bean);
	
	// 删除数据版本
	public void deleteDataVerManage(String[] ids);

	// 验证是否重复
	public int checkDataVerId(DataVer bean);

	// 添加数据版本
	public void insertDataVer(DataVer bean);

	// 更新数据版本
	public void updateDataVer(DataVer bean);

}

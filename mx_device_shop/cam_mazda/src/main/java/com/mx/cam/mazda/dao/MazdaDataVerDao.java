package com.mx.cam.mazda.dao;


import com.mx.cam.mazda.model.DataVer;

import java.util.List;

/**
 * 数据版本管理Dao
 *
 * @author zhengy
 */
public interface MazdaDataVerDao {

	// 查询数据版本列表
    List<DataVer> getDataVerManage(DataVer bean);
	
	// 删除数据版本
    void deleteDataVerManage(String[] ids);

	// 验证是否重复
    int checkDataVerId(DataVer bean);

	// 添加数据版本
    void insertDataVer(DataVer bean);

	// 更新数据版本
    void updateDataVer(DataVer bean);

    List<DataVer> getAllVers();
}

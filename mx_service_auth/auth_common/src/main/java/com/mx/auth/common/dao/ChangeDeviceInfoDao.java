package com.mx.auth.common.dao;


import com.mx.auth.common.model.ChangeDevice;

/**
 * 更换车机信息表Dao
 * 
 * @author zhengy
 * 
 */
public interface ChangeDeviceInfoDao {

	// 更换车机号
    void insertChangeDeviceInfo(ChangeDevice bean);

}

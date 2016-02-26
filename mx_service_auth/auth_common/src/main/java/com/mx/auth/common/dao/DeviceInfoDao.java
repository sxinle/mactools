package com.mx.auth.common.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mx.auth.common.model.Activate;
import com.mx.auth.common.model.DeviceInfo;


/**
 * 车机信息Dao
 * 
 * @author zhengy
 * 
 */
public interface DeviceInfoDao {
	//********************管理工具使用********************************
	//查询车机信息
	List<DeviceInfo> getDeviceInfo(DeviceInfo bean);
	
    // 修改车机用户信息
    int updateDeviceUserInfo(DeviceInfo bean);
    
    //********************管理工具使用********************************
    
    //********************更换导航机使用********************************
    //通过VIN查询车机号
    String selectDeviceNoByVin(@Param("product_id") String product_id,@Param("vin") String vin);
    //查询车机号是否存在
    int selectDeviceNoCount(@Param("product_id") String product_id,@Param("device_no") String device_no);
    //更换车机信息表
    void updateDeviceInfoByChangeDevice(@Param("product_id") String product_id,@Param("old_device_no") String old_device_no,@Param("new_device_no") String new_device_no);
    //********************更换导航机使用********************************
    
    List<DeviceInfo> findByExample(DeviceInfo deviceInfo);

    int checkDeviceNo(DeviceInfo bean);

    int checkVin(DeviceInfo bean);

    List<DeviceInfo> getDeviceUserInfo(DeviceInfo bean);

    String selectVin(String device_no);

    void insertDeviceUser(Activate bean);

    Activate getDeviceUserByDevice(String device_no);
}

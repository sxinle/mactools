package com.mx.auth.common.dao;

import com.mx.auth.common.model.DeviceInfo;
import com.mx.auth.common.model.NdsDataServiceAuth;

import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * 服务权限管理Dao
 *
 * @author zhengy
 */
public interface NdsDataServiceAuthDao {
	//查询权限信息
    List<NdsDataServiceAuth> getNdsDataServiceAuthManage(NdsDataServiceAuth bean);

    // 查询订单的服务权限是否已存在
    int getCountByOrderId(String order_id);

    //插入服务鉴权数据
    void insert(NdsDataServiceAuth bean);

    //查询收费权限最大结束时间
    String getNdsMaxEndTimeNotFree(NdsDataServiceAuth bean);

    //验证免费服务鉴权是否过期
    List<NdsDataServiceAuth> getNdsAuthTypeFree(NdsDataServiceAuth bean);

    //更新免费服务鉴权记录的结束时间
    void updateNdsAuthEndDate(NdsDataServiceAuth bean);

    //马自达首次激活==================================================================================================
    List<NdsDataServiceAuth> getByDeviceNo(NdsDataServiceAuth bean);

    void updateStartEndTime(NdsDataServiceAuth ndsAuth);

    void updateNums(NdsDataServiceAuth ndsAuth);

    int checkDeviceNo(DeviceInfo bean);

    int checkDeviceNoUpgrade(DeviceInfo bean);
    
    //更换导航机使用
    //更换权限信息
    void updateAuthByChangeDevice(@Param("product_id") String product_id,@Param("old_device_no") String old_device_no,@Param("new_device_no") String new_device_no);
}

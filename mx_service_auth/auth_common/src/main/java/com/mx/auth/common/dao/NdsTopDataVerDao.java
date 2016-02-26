package com.mx.auth.common.dao;

import com.mx.auth.common.model.NdsTopDataVer;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 服务权限版本管理Dao
 *
 * @author zhengy
 */
public interface NdsTopDataVerDao {

    void updateDataVer(NdsTopDataVer bean);

    void fullRegionUpdate(@Param("ver") NdsTopDataVer ver,@Param("regions") List<String> regions);

    void insert(NdsTopDataVer model);

    List<NdsTopDataVer> findByExample(NdsTopDataVer ndsTopDataVer);
    
    List<NdsTopDataVer> getNdsTopDataVerManage(NdsTopDataVer bean);

    List<NdsTopDataVer> findByDeviceNo(NdsTopDataVer topDataVer);
    
    //更换导航机用
    //更换最高版本信息
    void updateTopVerByChangeDevice(@Param("product_id") String product_id,@Param("old_device_no") String old_device_no,@Param("new_device_no") String new_device_no);

}

package com.mx.auth.common.dao;

import com.mx.auth.common.model.NdsDataActiveLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 激活记录log管理Dao
 *
 * @author zhengy
 */
public interface NdsDataActiveLogDao {

    List<NdsDataActiveLog> getNdsDataActiveLogManage(NdsDataActiveLog bean);

    List<NdsDataActiveLog> getFirstActivate(String device_no);

    List<NdsDataActiveLog> getActiveLogInfo(NdsDataActiveLog bean);

    List<NdsDataActiveLog> getSerialNumberInfo(NdsDataActiveLog bean);

    void insertNdsDataActiveLog(NdsDataActiveLog activeLog);

    //更换导航机用
    //更换激活log信息
    void updateActiveLogByChangeDevice(@Param("product_id") String product_id, @Param("old_device_no") String old_device_no,
                                       @Param("new_device_no") String new_device_no);

    List<NdsDataActiveLog> retrieveActLog(@Param("product_id") String product_id, @Param("device_no") String device_no,
                                          @Param("vin") String vin, @Param("user_name") String user_name, @Param("phone") String phone,
                                          @Param("startDate") String startDate, @Param("endDate") String endDate, @Param("active_type") String activeType
            , @Param("order_id") String order_id);
}

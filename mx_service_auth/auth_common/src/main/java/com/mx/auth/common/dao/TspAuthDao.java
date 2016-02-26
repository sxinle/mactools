package com.mx.auth.common.dao;

import com.mx.auth.common.model.TspAuth;
import com.mx.auth.common.model.TspAuthInfo;
import com.mx.auth.common.model.TspInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TspAuthDao {

	List<TspAuth> getServiceAuth(@Param("product_id") String productId,
			@Param("device_no") String deviceNo,
			@Param("service_type") int serviceType);

	int addTspAuth(TspAuth tspAuth);

	List<TspInfo> getTspFreeTime(String authOrderId);

	List<TspAuth> getActiveTspRecordInfo(@Param("act_time") String act_time,
			@Param("vin") String vin);

	int updateFirstTspFreeTime(@Param("free_time") long free_time,
			@Param("service_code") int service_code);

	void updateEndDate(@Param("deviceNo") String deviceNo,
			@Param("productID") String productID,
			@Param("isExpired") String isExpired,
			@Param("items") List<String> items);

	void deleteByDev(@Param("deviceNo") String deviceNo,
			@Param("productID") String productID);

	List<TspAuthInfo> getTspAuth(TspAuthInfo bean);

	// 更换导航机用 更换车机信息
	void updateTspAuthByChangeDevice(@Param("product_id") String product_id,
			@Param("old_device_no") String old_device_no,
			@Param("new_device_no") String new_device_no);

    void updateTspEndDate(TspAuthInfo info);
}

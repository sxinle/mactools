package com.mx.auth.common.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mx.auth.common.model.Activate;
import com.mx.auth.common.model.NdsDataActiveLog;
import com.mx.auth.common.model.NdsDataSellActiveAuth;
import com.mx.auth.common.model.NdsDataServiceAuth;
import com.mx.auth.common.model.NdsTopDataVer;
import com.mx.auth.common.model.TspAuth;

/**
 * 鉴权接口Dao
 * 
 * @author zhengy
 */

public interface StdAuthDao {

	// 查询数据版本表List
	public List<NdsTopDataVer> getDataVerList(NdsDataServiceAuth bean);

	// 查询数据权限表List
	public List<NdsDataServiceAuth> getDataAuthList(NdsDataServiceAuth bean);

	// 查询最高数据版本号
	public List<NdsTopDataVer> getDataVersion(NdsTopDataVer bean);

	// 查询数据权限
	public List<NdsDataServiceAuth> getDataAuthAll(NdsDataServiceAuth bean);

	// 更新鉴权次数减1
	public void updateNums(NdsDataServiceAuth bean);

	// 更新最高版本号
	public void updateNdsDataVer(NdsTopDataVer bean);

	// 插入激活记录表
	public void insertNdsDataActiveLog(NdsDataActiveLog bean);

	// 查询权限表是否有车机记录
	public List<NdsDataServiceAuth> getNdsDataServiceAuthList(
			@Param("product_id") String product_id,
			@Param("device_no") String device_no);

	// 查询权限表是否有未激活记录
	public List<NdsDataServiceAuth> getNdsDataServiceAuthActiveList(
			@Param("product_id") String product_id,
			@Param("device_no") String device_no);

	// 查询销售激活记录表中是否有此产品系列无号段记录
	public List<NdsDataSellActiveAuth> getNdsDataSellActiveAuthList(
			String product_id);

	// 首次激活更新权限表
	public void updateNdsDataServiceAuth(NdsDataServiceAuth bean);

	// 首次激活插入最高版本表
	public void insertNdsTopDataVer(NdsTopDataVer bean);

	// 首次激活插入设备信息表
	public void insertDeviceInfo(Activate bean);
	
	// 首次激活更新设备信息表
	public void updateDeviceInfo(Activate bean);

	// 首次激活插入权限表
	public void insertNdsDataServiceAuth(NdsDataServiceAuth bean);

	// 更新无号段销售激活次数-1
	public int updateNdsDataSellActiveAuthNums(
			@Param("sell_auth_id") String sell_auth_id,
			@Param("old_nums") String old_nums,
			@Param("new_nums") String new_nums);
	
	// 获取TSP服务的有效期
	public List<TspAuth> getTspAuthFreeTime(
			@Param("auth_order_id") String auth_order_id,
			@Param("product_id") String product_id,
			@Param("device_no") String device_no);
	
	// 首次激活更新服务权限表
	public void updateTspAuth(TspAuth bean);
	
	// 查询权限订单厂商ID
	public String getAuthOrderOmeId(String auth_order_id);

}

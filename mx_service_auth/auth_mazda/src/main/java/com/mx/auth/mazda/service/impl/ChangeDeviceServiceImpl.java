package com.mx.auth.mazda.service.impl;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.dao.ChangeDeviceInfoDao;
import com.mx.auth.common.dao.DeviceInfoDao;
import com.mx.auth.common.dao.NdsDataActiveLogDao;
import com.mx.auth.common.dao.NdsDataServiceAuthDao;
import com.mx.auth.common.dao.NdsTopDataVerDao;
import com.mx.auth.common.dao.TspAuthDao;
import com.mx.auth.common.model.ChangeDevice;
import com.mx.auth.mazda.service.ChangeDeviceService;

@Service
@Transactional
public class ChangeDeviceServiceImpl implements ChangeDeviceService {

	private static final Logger logger = LogManager
			.getLogger(ChangeDeviceServiceImpl.class);

	@Autowired
	private DeviceInfoDao deviceInfoDao;
	@Autowired
	private NdsDataServiceAuthDao ndsDataServiceAuthDao;
	@Autowired
	private NdsTopDataVerDao ndsTopDataVerDao;
	@Autowired
	private NdsDataActiveLogDao ndsDataActiveLogDao;
	@Autowired
	private ChangeDeviceInfoDao changeDeviceInfoDao;
	@Autowired
	private TspAuthDao tspAuthDao;

	/**
	 * 查询产品系列信息列表
	 */
	public Object changeDevice(String product_id, String vin,
			String old_device_no, String new_device_no, String handlers)
			throws Exception {

		logger.info("Service ==> changeDevice");
		JSONObject json = new JSONObject();

		logger.debug("info ：get old_device_no by vin");
		String deviceNo = deviceInfoDao.selectDeviceNoByVin(product_id, vin);
		if (StringUtils.isEmpty(deviceNo)) {
			json.put("respCode", Constants.RESPCODE_NOTFOUND_DEVICENO);
			return json;
		}
		// 如果传入的旧车机号不为空，但是无效。
		if (!StringUtils.isEmpty(old_device_no)
				&& !deviceNo.equals(old_device_no)) {
			json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
			return json;
		}

		// 验证old_device_no和new_device_no是否相同
		logger.debug("info ：check old_device_no and new_device_no the same");
		if (deviceNo.equals(new_device_no)) {
			json.put("respCode", Constants.RESPCODE_ERR_NO_RIGHT);
			return json;
		}

		ChangeDevice bean = new ChangeDevice();
		bean.setProduct_id(product_id);
		bean.setOld_device_no(deviceNo);
		bean.setNew_device_no(new_device_no);
		bean.setHandlers(handlers);

		// 查询新车机是否存在
		int count = deviceInfoDao
				.selectDeviceNoCount(product_id, new_device_no);
		if (count > 0) {// 存在
			String deviceNoTest = deviceNo + "TEST";
			//将旧车机号更换成旧车机号+TEST
			// 更换车机信息表
			deviceInfoDao.updateDeviceInfoByChangeDevice(product_id,deviceNo,deviceNoTest);
			// 更换权限信息
			ndsDataServiceAuthDao.updateAuthByChangeDevice(product_id,deviceNo,deviceNoTest);
			// 更换最高版本信息
			ndsTopDataVerDao.updateTopVerByChangeDevice(product_id,deviceNo,deviceNoTest);
			// 更换激活log信息
			ndsDataActiveLogDao.updateActiveLogByChangeDevice(product_id,deviceNo,deviceNoTest);
			// 更新服务鉴权信息表
			tspAuthDao.updateTspAuthByChangeDevice(product_id,deviceNo,deviceNoTest);
			
			//将新车机号更换成旧车机号
			// 更换车机信息表
			deviceInfoDao.updateDeviceInfoByChangeDevice(product_id,new_device_no,deviceNo);
			// 更换权限信息
			ndsDataServiceAuthDao.updateAuthByChangeDevice(product_id,new_device_no,deviceNo);
			// 更换最高版本信息
			ndsTopDataVerDao.updateTopVerByChangeDevice(product_id,new_device_no,deviceNo);
			// 更换激活log信息
			ndsDataActiveLogDao.updateActiveLogByChangeDevice(product_id,new_device_no,deviceNo);
			// 更新服务鉴权信息表
			tspAuthDao.updateTspAuthByChangeDevice(product_id,new_device_no,deviceNo);
			
			//将旧车机号+TEST更换成新车机号
			// 更换车机信息表
			deviceInfoDao.updateDeviceInfoByChangeDevice(product_id,deviceNoTest,new_device_no);
			// 更换权限信息
			ndsDataServiceAuthDao.updateAuthByChangeDevice(product_id,deviceNoTest,new_device_no);
			// 更换最高版本信息
			ndsTopDataVerDao.updateTopVerByChangeDevice(product_id,deviceNoTest,new_device_no);
			// 更换激活log信息
			ndsDataActiveLogDao.updateActiveLogByChangeDevice(product_id,deviceNoTest,new_device_no);
			// 更新服务鉴权信息表
			tspAuthDao.updateTspAuthByChangeDevice(product_id,deviceNoTest,new_device_no);
		} else {// 不存在
			// 更换车机信息表
			deviceInfoDao.updateDeviceInfoByChangeDevice(product_id, deviceNo,new_device_no);
			// 更换权限信息
			ndsDataServiceAuthDao.updateAuthByChangeDevice(product_id,deviceNo,new_device_no);
			// 更换最高版本信息
			ndsTopDataVerDao.updateTopVerByChangeDevice(product_id,deviceNo,new_device_no);
			// 更换激活log信息
			ndsDataActiveLogDao.updateActiveLogByChangeDevice(product_id,deviceNo,new_device_no);
			// 更新服务鉴权信息表
			tspAuthDao.updateTspAuthByChangeDevice(product_id,deviceNo,new_device_no);
		}
		// 插入车机更换信息表
		changeDeviceInfoDao.insertChangeDeviceInfo(bean);

		json.put("respCode", Constants.RESPCODE_SUCCESS);
		return json;
	}
	
    /**
     * 根据车架号查询车机号
     *
     * @throws Exception
     */
    public String getDeviceNoByCarNo(String product_id, String vin) throws Exception {
        logger.info("Service ==> dataAuthActive");
        logger.debug("product_id=" + product_id);
        logger.debug("vin=" + vin);

        JSONObject json = new JSONObject();

        String device_no = deviceInfoDao.selectDeviceNoByVin(product_id,vin);

        if (StringUtils.isEmpty(device_no)) {
            json.put("respCode", Constants.RESPCODE_ERR_ENDTIME);
            return json.toString();
        }

        json.put("respCode", Constants.RESPCODE_SUCCESS);
        json.put("deviceNo", device_no);
        return json.toString();
    }

}

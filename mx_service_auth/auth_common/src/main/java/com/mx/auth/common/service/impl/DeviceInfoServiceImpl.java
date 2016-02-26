package com.mx.auth.common.service.impl;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.enums.ServiceInfo;
import com.mx.auth.common.dao.DeviceInfoDao;
import com.mx.auth.common.dao.TspAuthDao;
import com.mx.auth.common.model.DeviceInfo;
import com.mx.auth.common.model.TspAuthInfo;
import com.mx.auth.common.service.DeviceInfoService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DeviceInfoServiceImpl implements DeviceInfoService {

    @Autowired
    private DeviceInfoDao deviceInfoDao;
    @Autowired
    private TspAuthDao    tspAuthDao;

    /**
     * 查询车机信息列表
     */
    @Override
    public Object getDeviceInfo(DeviceInfo bean) throws Exception {
        List<DeviceInfo> list = deviceInfoDao.getDeviceInfo(bean);
        JSONObject json = new JSONObject();
        json.put(Constants.RESPCODE_KEY, Constants.RESPCODE_SUCCESS);
        json.put("rows", list);
        json.put("total", bean.getTotal());

        if (list.size() == 1) {// 同时查出TMC权限截止日期
            DeviceInfo device = list.get(0);
            TspAuthInfo param = new TspAuthInfo();
            param.setProduct_id(device.getProduct_id());
            param.setDevice_no(device.getDevice_no());
            param.setService_type(ServiceInfo.MX_TMC.getServiceCode() + "");
            List<TspAuthInfo> rets = tspAuthDao.getTspAuth(param);
            if (rets.size() > 0) {
                json.put("tmc_end_date", rets.get(0).getEnd_date());
            }
        }

        return json;

    }

    /**
     * 修改车机用户信息
     */
    @Override
    public Object updateDeviceUserInfo(DeviceInfo bean) throws Exception {
        JSONObject json = new JSONObject();
        int no = deviceInfoDao.updateDeviceUserInfo(bean);
        if (no > 0) {
            json.put(Constants.RESPCODE_KEY, Constants.RESPCODE_SUCCESS);
        } else {
            json.put(Constants.RESPCODE_KEY, Constants.RESPCODE_ERR_DEVICE_NO_USER);
        }
        return json;

    }

}

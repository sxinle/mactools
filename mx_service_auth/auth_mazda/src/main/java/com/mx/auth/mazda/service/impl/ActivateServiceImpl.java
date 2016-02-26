package com.mx.auth.mazda.service.impl;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.ResponseBuilder;
import com.mx.auth.common.dao.DeviceInfoDao;
import com.mx.auth.common.dao.NdsDataActiveLogDao;
import com.mx.auth.common.model.DeviceInfo;
import com.mx.auth.common.model.NdsDataActiveLog;
import com.mx.auth.mazda.beans.ReqRetrieveActCode;
import com.mx.auth.mazda.service.ActivateService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * 首次激活管理Service
 *
 * @author zhengy
 */
@Service
@Transactional
public class ActivateServiceImpl implements ActivateService {

    @Autowired
    private DeviceInfoDao       deviceInfoDao;
    @Autowired
    private NdsDataActiveLogDao activeLogDao;

    @Override
    public String checkHasActive(DeviceInfo bean) throws Exception {

        //验证车机号是否已经激活
        if (deviceInfoDao.checkDeviceNo(bean) > 0) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_HAS_DEVICE_NO);
        }

        //验证车架号是否已经激活
        if (deviceInfoDao.checkVin(bean) > 0) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_HAS_VIN);
        }

        return ResponseBuilder.getRespCode(Constants.RESPCODE_SUCCESS);
    }

    @Override
    public JSONObject getActiveLog(ReqRetrieveActCode param) throws Exception {
        List<NdsDataActiveLog> logs = activeLogDao.retrieveActLog(param.getProduct_id(), param.getDevice_no(), param.getVin(),
                param.getUser_name(), param.getPhone(), param.getStartDate(), param.getEndDate(), param.getActive_type(), param.getOrder_id());
        JSONObject ret = new JSONObject();
        ret.put("respCode", Constants.RESPCODE_SUCCESS);
        ret.put("rows", logs);
        return ret;
    }

}

package com.mx.auth.mazda.service;

import com.mx.auth.common.model.DeviceInfo;
import com.mx.auth.mazda.beans.ReqRetrieveActCode;
import net.sf.json.JSONObject;


/**
 * 激活管理Service
 *
 * @author zhengy
 */
public interface ActivateService {

    /**
     * 验证车机号和车架号是否被激活
     */
    String checkHasActive(DeviceInfo bean) throws Exception;

    JSONObject getActiveLog(ReqRetrieveActCode param) throws Exception;
}

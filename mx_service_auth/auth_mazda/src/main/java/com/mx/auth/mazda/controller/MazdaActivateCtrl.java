package com.mx.auth.mazda.controller;

import com.mx.auth.mazda.beans.ReqRetrieveActCode;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.ResponseBuilder;
import com.mx.auth.common.model.Activate;
import com.mx.auth.common.model.DeviceInfo;
import com.mx.auth.mazda.service.ActivateService;
import com.mx.auth.mazda.service.MazdaAuthService;


/**
 * 激活管理Controller
 *
 * @author zhengy
 */
@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/activate")
public class MazdaActivateCtrl extends BaseController {

    private static final Logger logger = LogManager.getLogger(MazdaActivateCtrl.class);

    @Autowired
    private ActivateService  activateService;
    @Autowired
    private MazdaAuthService authService;

    /**
     * 验证车机是否激活
     */
    @RequestMapping("/checkHasActive")
    @ResponseBody
    public String checkHasActive(DeviceInfo bean) throws Exception {
        logger.debug("checkHasActive=>{}", bean.toString());
        return activateService.checkHasActive(bean);
    }

    /**
     * 首次激活
     */
    @RequestMapping(value = "/firstActive")
    @ResponseBody
    public String firstActive(Activate activate) throws Exception {
        logger.debug("firstActive=>{}", activate.toString());
        return activate.validate() ? authService.firstActive(activate)
                : ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
    }

    /**
     * 查找激活历史记录
     */
    @RequestMapping("/retrieveActCode")
    @ResponseBody
    public Object retrieveActCode(ReqRetrieveActCode param) throws Exception {
        logger.debug("retrieveActCode=>{}", param.toString());
        return activateService.getActiveLog(param);
    }

}
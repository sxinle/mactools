package com.mx.auth.mazda.controller;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.model.NdsTopDataVer;
import com.mx.auth.mazda.service.UpgradeService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 升级管理Controller
 *
 * @author zhengy
 */
@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/upgrade")
public class UpgradeController extends BaseController {

    private static final Logger logger = LogManager.getLogger(UpgradeController.class);

    @Autowired
    private UpgradeService upgradeService;

    /**
     * 验证车机是否正确
     */
    @RequestMapping("/checkDeviceNoUpgrade")
    @ResponseBody
    public String checkDeviceNoUpgrade(String device_no) throws Exception {
        logger.debug("checkDeviceNoUpgrade=>{}", "device_no=" + device_no);
        return upgradeService.checkDeviceNoUpgrade(device_no);
    }

    /**
     * 全数据升级下载
     */
    @RequestMapping("/saveUpgradeExport")
    @ResponseBody
    public Object saveUpgradeExport(NdsTopDataVer topDataVer) throws Exception {
        logger.debug("saveUpgradeExport=>{}", topDataVer.toString());
        return upgradeService.saveUpgrade(topDataVer);
    }

}
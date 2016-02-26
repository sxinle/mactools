package com.mx.auth.common.controller;

import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.model.NdsTopDataVer;
import com.mx.auth.common.service.NdsTopDataVerService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 最高版本管理Controller
 *
 * @author zhengy
 */
@Controller
@RequestMapping("/ndsTopDataVer")
public class NdsTopDataVerController extends BaseController {

    private static final Logger logger = LogManager.getLogger(NdsTopDataVerController.class);

    @Autowired
    private NdsTopDataVerService ndsTopDataVerService;

    /**
     * 查看最高版本信息
     */
    @RequestMapping("/getNdsTopDataVer")
    @ResponseBody
    public Object getNdsTopDataVer(NdsTopDataVer bean) throws Exception {
        logger.debug("getNdsTopDataVer=>{}", bean.toString());
        return ndsTopDataVerService.getNdsTopDataVerManage(bean);
    }

    /**
     * 获取所有省份最低数据版本权限
     */
    @RequestMapping("/getMinNdsTopDataVer")
    @ResponseBody
    public Object getMinNdsTopDataVer(NdsTopDataVer bean) throws Exception {
        logger.debug("getMinNdsTopDataVer=>{}", bean.toString());
        return ndsTopDataVerService.getMinNdsTopDataVer(bean);
    }
}
package com.mx.auth.common.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.model.NdsDataActiveLog;
import com.mx.auth.common.service.NdsDataActiveLogService;

/**
 * 激活记录log管理Controller
 *
 * @author zhengy
 */
@Controller
@RequestMapping("/ndsDataActiveLog")
public class NdsDataActiveLogController extends BaseController {

    private static final Logger logger = LogManager.getLogger(NdsDataActiveLogController.class);

    @Autowired
    private NdsDataActiveLogService ndsDataActiveLogService;

    /**
     * 查看激活记录log
     */
    @RequestMapping("/getNdsDataActiveLog")
    @ResponseBody
    public Object getNdsDataActiveLog(NdsDataActiveLog bean) throws Exception {
        logger.debug("getNdsDataActiveLog=>{}", bean.toString());
        return ndsDataActiveLogService.getNdsDataActiveLogManage(bean);
    }
}
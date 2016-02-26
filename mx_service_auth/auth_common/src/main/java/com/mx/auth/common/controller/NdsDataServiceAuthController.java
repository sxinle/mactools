package com.mx.auth.common.controller;

import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.model.NdsDataServiceAuth;
import com.mx.auth.common.service.NdsDataServiceAuthService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 权限信息管理Controller
 *
 * @author zhengy
 */
@Controller
@RequestMapping("/ndsDataServiceAuth")
public class NdsDataServiceAuthController extends BaseController {

    private static final Logger logger = LogManager.getLogger(NdsDataServiceAuthController.class);

    @Autowired
    private NdsDataServiceAuthService ndsDataServiceAuthService;

    /**
     * 查看权限信息
     */
    @RequestMapping("/getNdsDataServiceAuth")
    @ResponseBody
    public Object getNdsDataServiceAuth(NdsDataServiceAuth bean) throws Exception {
        logger.debug("getNdsDataServiceAuth=>{}" + bean.toString());
        return ndsDataServiceAuthService.getNdsDataServiceAuthManage(bean);
    }
}
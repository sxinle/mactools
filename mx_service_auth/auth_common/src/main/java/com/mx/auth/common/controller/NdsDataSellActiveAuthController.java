package com.mx.auth.common.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.model.NdsDataSellActiveAuth;
import com.mx.auth.common.service.NdsDataSellActiveAuthService;

/**
 * 销售激活订单管理Controller
 *
 * @author zhengy
 */
@Controller
@RequestMapping("/ndsDataSellActiveAuth")
public class NdsDataSellActiveAuthController extends BaseController {

    private static final Logger logger = LogManager.getLogger(NdsDataSellActiveAuthController.class);

    @Autowired
    private NdsDataSellActiveAuthService ndsDataSellActiveAuthService;

    /**
     * 查看销售激活订单
     */
    @RequestMapping("/getNdsDataSellActiveAuth")
    @ResponseBody
    public Object getNdsDataSellActiveAuth(NdsDataSellActiveAuth bean) throws Exception {
        logger.debug("getNdsDataSellActiveAuth=>{}", bean.toString());
        return ndsDataSellActiveAuthService.getNdsDataSellActiveAuthManage(bean);
    }
}
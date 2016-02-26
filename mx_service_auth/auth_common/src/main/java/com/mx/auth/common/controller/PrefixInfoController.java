package com.mx.auth.common.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.model.PrefixInfo;
import com.mx.auth.common.service.PrefixInfoService;

/**
 * 刮刮卡类型Controller
 *
 * @author zhengy
 */
@Controller
@RequestMapping("/prefixInfo")
public class PrefixInfoController extends BaseController {

    private static final Logger logger = LogManager.getLogger(PrefixInfoController.class);

    @Autowired
    private PrefixInfoService prefixInfoService;

    /**
     * 查看刮刮卡类型
     */
    @RequestMapping("/getPrefixInfo")
    @ResponseBody
    public Object getPrefixInfo(PrefixInfo bean) throws Exception {
        logger.debug("getPrefixInfo=>{}", bean.toString());
        return prefixInfoService.getPrefixInfo(bean);
    }
}
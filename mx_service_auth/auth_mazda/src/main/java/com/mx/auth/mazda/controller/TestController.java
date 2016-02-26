package com.mx.auth.mazda.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.mazda.beans.TestBean;
import com.mx.auth.mazda.service.TestService;

/**
 * 测试后门Controller
 *
 * @author zhengy
 */
@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/test")
public class TestController extends BaseController {

    private static final Logger logger = LogManager.getLogger(TestController.class);

    @Autowired
    private TestService testService;

    @RequestMapping("/modifyTspPermission")
    public
    @ResponseBody
    String modifyTspPermission(TestBean bean) throws Exception {
        logger.debug("modifyTspPermission=>{}", bean.toString());
        testService.modifyTspPermission(bean);
        return "SUNCCESS";
    }

    @RequestMapping("/getReset")
    public
    @ResponseBody
    String getReset(TestBean bean) throws Exception {
        logger.debug("getReset=>{}", bean.toString());
        testService.getReset(bean);
        return "SUNCCESS";
    }

    /**
     * 直接取消免费期
     * 
     * @param bean
     * @return
     * @throws Exception
     */
    @RequestMapping("/abrogateFree")
    public @ResponseBody
    String abrogateFree(TestBean bean) throws Exception {
        logger.info("abrogateFree");
        logger.debug("device_no={} productId={}", bean.getDeviceNo(), bean.getProductID());
        testService.abrogateFree(bean.getDeviceNo(), bean.getProductID());
        return "SUNCCESS";
    }
}
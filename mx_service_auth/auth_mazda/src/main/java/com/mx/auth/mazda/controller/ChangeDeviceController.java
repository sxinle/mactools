package com.mx.auth.mazda.controller;

import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.ResponseBuilder;
import com.mx.auth.mazda.service.ChangeDeviceService;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 更换导航机接口Controller
 *
 * @author zhengy
 */
@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/auth")
public class ChangeDeviceController extends BaseController {
    private static final Logger logger = LogManager.getLogger(ChangeDeviceController.class);

    @Autowired
    private ChangeDeviceService changeDeviceService;

    /**
     * 更换导航机
     */
    @RequestMapping("/changeDevice")
    @ResponseBody
    // TODO 改为接收VO为参数，重写toString
    public Object ChangeDevice(String product_id, String car_no, String new_device_no, String old_device_no,
                               String handlers) throws Exception {
        logger.info("changeDevice");
        logger.debug("product_id = " + product_id);
        logger.debug("car_no = " + car_no);
        logger.debug("new_device_no = " + new_device_no);
        logger.debug("old_device_no = " + old_device_no);
        logger.debug("handlers = " + handlers);

        if (StringUtils.isAnyEmpty(product_id, car_no, new_device_no, handlers)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }

        return changeDeviceService.changeDevice(product_id, car_no, old_device_no, new_device_no, handlers);
    }

    /**
     * 获取车机序列号
     */
    @RequestMapping(value = "/getDeviceNoByCarNo")
    @ResponseBody
    public Object getDeviceNoByCarNo(String product_id, String car_no) throws Exception {
        logger.info("Controller ==> getDeviceNoByCarNo");
        logger.debug("product_id=" + product_id);
        logger.debug("car_no=" + car_no);

        if (StringUtils.isAnyEmpty(product_id, car_no)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }

        return changeDeviceService.getDeviceNoByCarNo(product_id, car_no);
    }
}
package com.mx.auth.std.controller;

import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.ResponseBuilder;
import com.mx.auth.common.model.Activate;
import com.mx.auth.common.service.AuthService;
import com.mx.auth.std.service.StdAuthService;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 鉴权管理WebController
 *
 * @author zhengy
 */
@Controller
@RequestMapping("/std/auth")
public class StdAuthController extends BaseController {

    private static final Logger logger = LogManager.getLogger(StdAuthController.class);

    @Autowired
    private StdAuthService stdAuthService;
    @Autowired
    private AuthService    authService;

    /**
     * 获取数据权限列表(Web接口用)
     */
    @RequestMapping("/getDataAuth")
    @ResponseBody
    public Object getDataAuth(String product_id, String device_no, String region_ids, String encryption) throws Exception {
        logger.info("getDataAuth");
        logger.debug("product_id = " + product_id);
        logger.debug("device_no = " + device_no);
        logger.debug("region_ids = " + region_ids);
        logger.debug("encryption = " + encryption);

        if (StringUtils.isAnyEmpty(product_id, device_no, region_ids, encryption)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }

        return authService.getDataAuth(product_id, device_no, region_ids, encryption);
    }

    /**
     * 数据激活(Web接口用)
     */
    @RequestMapping("/dataAuthActive")
    @ResponseBody
    public Object dataAuthActive(String product_id, String device_no,
                                 String region_ids, String data_versions, String soft_version,
                                 String encryption) throws Exception {
        logger.info("dataAuthActive");
        logger.debug("product_id = " + product_id);
        logger.debug("device_no = " + device_no);
        logger.debug("region_ids = " + region_ids);
        logger.debug("data_versions = " + data_versions);
        logger.debug("soft_version = " + soft_version);
        logger.debug("encryption = " + encryption);

        if (StringUtils.isAnyEmpty(product_id, device_no, region_ids, data_versions, soft_version, encryption)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }

        return authService.dataAuthActive(product_id, device_no, region_ids, data_versions, soft_version, encryption);
    }

    /**
     * 首次激活
     */
    @RequestMapping(value = "/firstActive")
    @ResponseBody
    public Object firstActive(Activate bean) throws Exception {
        logger.debug(bean.toString());
        return bean.validate() ? stdAuthService.firstActive(bean) : ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
    }
}
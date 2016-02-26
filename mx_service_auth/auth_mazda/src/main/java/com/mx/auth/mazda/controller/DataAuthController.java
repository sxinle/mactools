package com.mx.auth.mazda.controller;

import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.ResponseBuilder;
import com.mx.auth.common.service.AuthService;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 马自达NDS数据鉴权接口Controller
 *
 * @author zhengy
 */
@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/data")
public class DataAuthController extends BaseController {

    private static final Logger logger = LogManager.getLogger(DataAuthController.class);

    @Autowired
    private AuthService authService;

    /**
     * 获取数据权限列表
     */
    @RequestMapping(value = "/getDataAuth")
    @ResponseBody
    public Object getDataAuth(String product_id, String device_no, String region_ids, String encryption) throws Exception {
        logger.info("Controller ==> getDataAuth");
        logger.debug("product_id=" + product_id);
        logger.debug("device_no=" + device_no);
        logger.debug("region_ids=" + region_ids);
        logger.debug("encryption=" + encryption);

        if (StringUtils.isAnyEmpty(product_id, device_no, region_ids, encryption)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }

        return authService.getDataAuth(product_id, device_no, region_ids, encryption);
    }

    /**
     * 3.17 数据激活(暂时不删)
     */
    @RequestMapping(value = "/dataAuthActive")
    @ResponseBody
    public Object dataAuthActive(String product_id, String device_no, String region_ids, String data_versions,
                                 String encryption, String serverTime) throws Exception {
        logger.info("Controller ==> dataAuthActive");
        logger.debug("product_id=" + product_id);
        logger.debug("device_no=" + device_no);
        logger.debug("region_ids=" + region_ids);
        logger.debug("data_versions=" + data_versions);
        logger.debug("encryption=" + encryption);

        if (StringUtils.isAnyEmpty(product_id, device_no, region_ids, data_versions, encryption)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }

        return authService.dataAuthActive(product_id, device_no, region_ids, data_versions, encryption, serverTime);
    }
}
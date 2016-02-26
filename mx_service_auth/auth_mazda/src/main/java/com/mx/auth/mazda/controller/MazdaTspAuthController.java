package com.mx.auth.mazda.controller;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.ResponseBuilder;
import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.mazda.beans.TspRenew;
import com.mx.auth.mazda.service.MazdaTspAuthService;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.URLDecoder;


/**
 * 查询序列号管理Controller
 *
 * @author zhengy
 */
@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/service")
public class MazdaTspAuthController extends BaseController {

    private static final Logger logger = LogManager.getLogger(MazdaTspAuthController.class);

    @Autowired
    private MazdaTspAuthService mazdaTspAuthService;

    /**
     * 续订tsp服务
     */
    @RequestMapping("/tspRenew")
    @ResponseBody
    public Object tspRenew(TspRenew param) throws Exception {
        logger.debug(param.toString());
        return mazdaTspAuthService.payTspService(param);
    }

    /**
     * 服务鉴权：获取服务权限
     */
    @RequestMapping(value = "/getServiceAuth")
    public
    @ResponseBody
    String getTspAuth(String product_id, String device_no, String service_codes) throws Exception {
        logger.info("Controller ==> getTspAuth");
        logger.debug("product_id=" + product_id);
        logger.debug("device_no=" + device_no);
        logger.debug("service_codes=" + service_codes);
        String de_service_codes = URLDecoder.decode(service_codes, "utf-8");

        if (StringUtils.isAnyEmpty(product_id, device_no, de_service_codes)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }
        return mazdaTspAuthService.getTspAuth(product_id, device_no, de_service_codes);
    }
}
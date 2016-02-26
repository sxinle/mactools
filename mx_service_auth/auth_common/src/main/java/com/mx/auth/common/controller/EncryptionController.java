package com.mx.auth.common.controller;

import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.model.Encryption;
import com.mx.auth.common.service.EncryptionService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 加密库管理Controller
 *
 * @author zhengy
 */
@Controller
@RequestMapping("/encryption")
public class EncryptionController extends BaseController {

    private static final Logger logger = LogManager.getLogger(EncryptionController.class);

    @Autowired
    private EncryptionService encryptionService;

    /**
     * 在加密库表中查找数据
     */
    @RequestMapping("/getEncryption")
    @ResponseBody
    public Object getEncryption(Encryption bean) throws Exception {
        logger.debug("getEncryption=>{}", bean.toString());
        return encryptionService.getEncryptionManage(bean);
    }

    /**
     * 在加密库表中修改数据
     */
    @RequestMapping("/updateEncryption")
    @ResponseBody
    public Object updateEncryption(Encryption bean) throws Exception {
        logger.debug("updateEncryption=>{}", bean.toString());
        return encryptionService.updateEncryptionManage(bean);
    }
}
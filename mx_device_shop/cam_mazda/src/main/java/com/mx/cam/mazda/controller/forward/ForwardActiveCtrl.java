package com.mx.cam.mazda.controller.forward;

import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.ResponseBuilder;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.mazda.beans.ReqActiveCheckNo;
import com.mx.cam.mazda.beans.ReqRetrieveActCode;
import com.mx.cam.mazda.model.Activate;
import com.mx.cam.net.conf.Mazda;
import com.mx.cam.net.service.MazdaAuth;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by hsong on 16-1-8.
 */

@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/active")
public class ForwardActiveCtrl extends BaseController {

    /**
     * 验证车机是否激活
     */
    @RequestMapping("/checkIfDupActive")
    @ResponseBody
    public Object checkHasActive(ReqActiveCheckNo checkNo) throws Exception {
        if (!checkNo.validate()) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }
        return MazdaAuth.api.checkHasActive(Mazda.CGI.checkHasActive(), checkNo.toMap()).execute().body();
    }

    /**
     * 保存车机用户并首次激活(Ajax)
     */
    @RequestMapping("/ajaxSaveActivate")
    @ResponseBody
    public Object ajaxSaveActivate(Activate bean) throws Exception {
        int retCode;
        if (!bean.validate()) {
            retCode = Constants.RESPCODE_ERR_PARAM;
        } else {
            Map resp = MazdaAuth.api.saveDevUserAndActive(Mazda.CGI.saveActivate(), bean.toMap()).execute().body();
            Object actCode = resp.get("actCode");
            if (null == actCode) {
                Object respCode = resp.get(Constants.KEY_RESP_CODE);
                if (null != respCode && respCode.toString().equals("-103")) {
                    retCode = Constants.RESPCODE_ERR_DUP_ACTIVE;
                } else {
                    retCode = Constants.RESPCODE_FAILURE;
                }
            } else {
                JSONObject obj = new JSONObject();
                obj.put("respCode", Constants.RESPCODE_SUCCESS);
                obj.put("deviceNo", bean.getDevice_no());
                obj.put("actCode", actCode);
                obj.put("softVer", bean.getSoft_ver());
                return obj;
            }
        }
        return ResponseBuilder.getRespCode(retCode);
    }

    /**
     * 激活记录查询(激活码找回Ajax)
     */
    @RequestMapping("/retrieveActCode")
    @ResponseBody
    public Object retrieveActCode(ReqRetrieveActCode param) throws Exception {
        return MazdaAuth.api.retrieveActCode(Mazda.CGI.retrieveActCode(), param.toMap()).execute().body();
    }
}

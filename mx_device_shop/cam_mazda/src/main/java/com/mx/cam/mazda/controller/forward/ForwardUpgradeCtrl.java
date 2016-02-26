package com.mx.cam.mazda.controller.forward;

import com.mx.cam.common.auth.model.NdsTopDataVer;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.ResponseBuilder;
import com.mx.cam.mazda.model.Activate;
import com.mx.cam.mazda.service.MazdaVerService;
import com.mx.cam.net.conf.Common;
import com.mx.cam.net.conf.Mazda;
import com.mx.cam.net.service.CommonAuth;
import com.mx.cam.net.service.MazdaAuth;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/upgrade")
public class ForwardUpgradeCtrl extends BaseController {

    @Autowired
    private MazdaVerService mazdaVerService;

    /**
     * 验证车机是否可升级(包括验证是否免费期内)
     */
    @RequestMapping("/checkDeviceNoUpgrade")
    @ResponseBody
    public Object checkDeviceNoUpgrade(String device_no) throws Exception {
        Map<String, String> param = new HashMap<>();
        param.put("device_no", device_no);
        return MazdaAuth.api.upgradeCheckDeviceNo(Mazda.CGI.upgradeCheckDeviceNo(), param).execute().body();
    }

    /**
     * 获取所有地图版本列表(不可升级的版本，界面置灰)
     */
    @RequestMapping("/getAllDataVer")
    @ResponseBody
    public Object getAllDataVer(Activate activate) throws Exception {
        Map<String, Object> ret = CommonAuth.api.getRegionsMinDataVer(Common.CGI.getRegionsMinDataVer(), activate.toMap()).execute().body();
        int respCode = (int) ret.get(Constants.KEY_RESP_CODE);
        boolean succ = ret != null && respCode == Constants.RESPCODE_SUCCESS;
        return !succ ? ResponseBuilder.getRespCode(Constants.RESPCODE_FAILURE)
                : mazdaVerService.getDataVersWithMark(ret.get("minVer").toString());
    }

    /**
     * 升级数据，返回激活码(ajax)
     */
    @RequestMapping("/doAjaxUpgrade")
    @ResponseBody
    public Object doAjaxUpgrade(NdsTopDataVer topDataVer) throws Exception {
        int respCode;
        if (!topDataVer.validate()) {
            respCode = Constants.RESPCODE_ERR_PARAM;
        } else {
            Map resp = MazdaAuth.api.saveUpgradeExport(Mazda.CGI.saveUpgradeExport(), topDataVer.toMap()).execute().body();
            Object actCode = resp.get("actCode");

            if (null == actCode) {
                respCode = Constants.RESPCODE_FAILURE;
            } else {
                respCode = Constants.RESPCODE_SUCCESS;
                JSONObject obj = new JSONObject();
                obj.put("actCode", actCode);
                obj.put("deviceNo", topDataVer.getDevice_no());
                obj.put("respCode", respCode);
                return obj;
            }
        }
        return ResponseBuilder.getRespCode(respCode);
    }

}
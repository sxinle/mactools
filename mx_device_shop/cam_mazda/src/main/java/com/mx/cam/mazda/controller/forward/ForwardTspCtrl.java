package com.mx.cam.mazda.controller.forward;

import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.mazda.model.TspRenew;
import com.mx.cam.net.conf.Common;
import com.mx.cam.net.conf.Mazda;
import com.mx.cam.net.service.CommonAuth;
import com.mx.cam.net.service.MazdaAuth;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by hsong on 16-1-11.
 */
@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/tspService")
public class ForwardTspCtrl extends BaseController {

    /**
     * 续订tsp服务
     */
    @RequestMapping("/tspRenew")
    @ResponseBody
    public Object renew(TspRenew renew) throws Exception {
        return MazdaAuth.api.tspRenew(Mazda.CGI.tspRenew(), renew.toMap()).execute().body();
    }


    /**
     * tsp到期查询
     */
    @RequestMapping("/tspInfoQuery")
    @ResponseBody
    public Object tspInfoQuery(String product_id, String device_no) throws Exception {
        Map<String, String> param = new HashMap<>();
        param.put("product_id", product_id);
        param.put("device_no", device_no);
        Map ret = CommonAuth.api.getTspAuth(Common.CGI.getTspAuth(), param).execute().body();

        return ret;
    }
}

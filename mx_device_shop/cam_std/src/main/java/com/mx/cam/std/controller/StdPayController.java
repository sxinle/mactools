package com.mx.cam.std.controller;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.CommonUtils;
import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.ResponseBuilder;
import com.mx.cam.common.init.model.Notify;
import com.mx.cam.std.service.StdPayService;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

import java.io.InputStream;
import java.util.Map;

/**
 * 商品管理WebController
 *
 * @author zhengy
 */
@Controller
@RequestMapping("/std/pay")
public class StdPayController extends BaseController {
    private static Log log = LogFactory.getLog(StdPayController.class);

    @Autowired
    private StdPayService stdPayService;

    /**
     * 获取商品信息列表(Web接口用)
     */
    @RequestMapping("/getGoodsList")
    @ResponseBody
    public Object getGoodsList(String product_id) throws Exception {
        log.info("getGoodsList");
        log.debug("product_id = " + product_id);

        if (StringUtils.isAnyEmpty(product_id)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }
        return stdPayService.getGoodsList(product_id);
    }

    /**
     * 获取商品套餐(Web接口用)
     */
    @RequestMapping("/getGoodsComboList")
    @ResponseBody
    public Object getGoodsComboList(String product_id, String goods_id) throws Exception {
        log.info("getGoodsComboList");
        log.debug("product_id = " + product_id);
        log.debug("goods_id = " + goods_id);

        if (StringUtils.isAnyEmpty(product_id, goods_id)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }
        return stdPayService.getGoodsComboList(product_id, goods_id);
    }

    /**
     * 获取商品信息和套餐信息列表(Web接口用)
     */
    @RequestMapping("/getGoodsAndComboList")
    @ResponseBody
    public Object getGoodsAndComboList(String product_id) throws Exception {
        log.info("getGoodsAndComboList");
        log.debug("product_id = " + product_id);

        if (StringUtils.isAnyEmpty(product_id)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }
        return stdPayService.getGoodsAndComboList(product_id);
    }

    /**
     * 获取支付方式(Web接口用)
     */
    @RequestMapping("/getPayWayList")
    @ResponseBody
    public Object getPayWayList(String product_id) throws Exception {
        log.info("getPayWayList");
        log.debug("product_id = " + product_id);

        if (StringUtils.isAnyEmpty(product_id)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }

        return stdPayService.getPayWayList(product_id);
    }

    /**
     * 查询订单状态(Web接口用)
     */
    @RequestMapping("/orderQuery")
    @ResponseBody
    public Object orderQuery(String product_id, String order_id) throws Exception {
        log.info("orderQuery");
        log.debug("product_id = " + product_id);
        log.debug("order_id = " + order_id);
        if (StringUtils.isAnyEmpty(product_id, order_id)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }

        return stdPayService.orderQuery(product_id, order_id);
    }

    /**
     * 支付请求(Web接口用)
     */
    @RequestMapping("/unifiedOrder")
    @ResponseBody
    public Object unifiedOrder(String product_id, String device_no, String goods_ids,
                               String combo_ids, String data_ver, String pay_id,String scheme_id) throws Exception {
        log.info("unifiedOrder");
        log.debug("product_id = " + product_id);
        log.debug("device_no = " + device_no);
        log.debug("goods_ids = " + goods_ids);
        log.debug("combo_ids = " + combo_ids);
        log.debug("data_ver = " + data_ver);
        log.debug("pay_id = " + pay_id);
        log.debug("scheme_id = " + scheme_id);
        if (StringUtils.isAnyEmpty(product_id, device_no, goods_ids, combo_ids, pay_id)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }

        return stdPayService.unifiedOrder(product_id, device_no, goods_ids, combo_ids, data_ver, pay_id,scheme_id);
    }

    /**
     * 微信支付回调函数
     */
    @RequestMapping(value = "/getWechatNotify")
    @ResponseBody
    public String getWechatNotify() throws Exception {
        log.info("Controller ==> getWechatNotify");

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        request.setCharacterEncoding("UTF-8");
        int size = request.getContentLength();

        InputStream is = request.getInputStream();

        byte[] reqBodyBytes = CommonUtils.readBytes(is, size);

        String res = new String(reqBodyBytes);

        log.debug(res);

        Notify bean = stdPayService.getWechatNotify(res);

        XStream xStreamForRequestPostData = new XStream(new DomDriver("UTF-8",
                new XmlFriendlyNameCoder("-_", "_")));
        String postDataXML = xStreamForRequestPostData.toXML(bean);

        log.debug(postDataXML);

        return postDataXML;
    }

    /**
     * 支付宝支付回调函数
     */
    @RequestMapping(value = "/getAlipayNotify")
    @ResponseBody
    public String getAlipayNotify(HttpServletRequest request) throws Exception {
        log.info("Controller ==> getAlipayNotify");

        String str;
        Map<String, String> params = CommonUtils.convertParamMap(request .getParameterMap());

        str = stdPayService.getAlipayNotify(params);

        return str;
    }

    /**
     * 刮刮卡支付下单请求(Web接口用)
     */
    @RequestMapping("/cardOrder")
    @ResponseBody
    public Object cardOrder(String product_id, String device_no, String goods_ids, String combo_ids, String data_ver, String pay_id,String scheme_id) throws Exception {
        log.info("cardOrder");
        log.debug("product_id = " + product_id);
        log.debug("device_no = " + device_no);
        log.debug("goods_ids = " + goods_ids);
        log.debug("combo_ids = " + combo_ids);
        log.debug("data_ver = " + data_ver);
        log.debug("pay_id = " + pay_id);
        log.debug("scheme_id=" + scheme_id);
        

        if (StringUtils.isAnyEmpty(product_id, device_no, goods_ids, combo_ids, pay_id)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }

        return stdPayService.cardOrder(product_id, device_no, goods_ids, combo_ids, data_ver, pay_id,scheme_id);
    }

    /**
     * 刮刮卡支付
     */
    @RequestMapping("/cardPay")
    @ResponseBody
    public Object cardPay(String product_id, String device_no, String order_id,
                          String card_no, String card_password) throws Exception {
        log.info("cardPay");
        log.debug("product_id = " + product_id);
        log.debug("device_no = " + device_no);
        log.debug("order_id = " + order_id);
        log.debug("card_no = " + card_no);
        log.debug("card_password = " + card_password);

        if (StringUtils.isAnyEmpty(product_id, device_no, order_id, card_no, card_password)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }
        return stdPayService.cardPay(product_id, device_no, order_id, card_no, card_password);
    }
}
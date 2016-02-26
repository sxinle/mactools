package com.mx.cam.mazda.controller;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.CommonUtils;
import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.ResponseBuilder;
import com.mx.cam.common.init.model.Notify;
import com.mx.cam.mazda.service.MazdaPayService;
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

@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/pay")
public class MazdaPayController extends BaseController {
    private static Log logger = LogFactory.getLog(MazdaPayController.class);
    @Autowired
    private MazdaPayService mazdaPayService;

    /**
     * 支付请求生成二维码
     */
    @RequestMapping(value = "/unifiedOrder")
    @ResponseBody
    public Object unifiedOrder(String product_id, String device_no, String goods_ids, String data_ver) throws Exception {
        logger.info("Controller ==> unifiedOrder");
        logger.debug("product_id=" + product_id);
        logger.debug("device_no=" + device_no);
        logger.debug("goods_ids=" + goods_ids);
        logger.debug("data_ver=" + data_ver);

        if (StringUtils.isAnyEmpty(product_id, device_no, goods_ids, data_ver)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }
        // 微信支付
        return mazdaPayService.getPayParm(product_id, device_no, goods_ids, data_ver);
    }

    /**
     * 微信支付回调函数
     */
    @RequestMapping(value = "/getWechatNotify")
    @ResponseBody
    public String getWechatNotify() throws Exception {
        logger.info("Controller ==> getNotify");

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        request.setCharacterEncoding("UTF-8");
        int size = request.getContentLength();

        InputStream is = request.getInputStream();
        byte[] reqBodyBytes = CommonUtils.readBytes(is, size);
        String res = new String(reqBodyBytes);

        Notify bean = mazdaPayService.getWechatNotify(res);
        XStream xStreamForRequestPostData = new XStream(new DomDriver("UTF-8", new XmlFriendlyNameCoder("-_", "_")));
        String postDataXML = xStreamForRequestPostData.toXML(bean);
        return postDataXML;
    }


    /**
     * 微信支付回调函数
     */
    @ResponseBody
    @RequestMapping(value = "/getAlipayNotify")
    public String getAlipayNotify(HttpServletRequest request) throws Exception {
        logger.info("Controller ==> getAlipayNotify");
        String str;
        Map<String, String> params = CommonUtils.convertParamMap(request.getParameterMap());

        str = mazdaPayService.getAlipayNotify(params);
        return str;
    }

    /**
     * 3.8 获取商品信息列表
     */
    @RequestMapping(value = "/getGoodsList")
    @ResponseBody
    public Object getGoodsList(String product_id, String catagory_ids) throws Exception {
        logger.info("Controller ==> getGoodsList");
        logger.debug("product_id=" + product_id);
        logger.debug("catagory_ids=" + catagory_ids);

        if (StringUtils.isAnyEmpty(product_id, catagory_ids)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }
        return mazdaPayService.getGoodsList(product_id, catagory_ids);
    }

    /**
     * 3.10 查询订单状态
     */
    @RequestMapping(value = "/orderQuery")
    @ResponseBody
    public Object orderQuery(String product_id, String order_id) throws Exception {
        logger.info("Controller ==> orderQuery");
        logger.debug("product_id=" + product_id);
        logger.debug("order_id=" + order_id);

        if (StringUtils.isAnyEmpty(product_id, order_id)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }
        return mazdaPayService.orderQuery(product_id, order_id);
    }

    /**
     * 刮刮卡下单请求
     */
    @RequestMapping(value = "/cardOrder")
    @ResponseBody
    public Object cardOrder(String product_id, String device_no, String goods_ids, String data_ver) throws Exception {
        logger.info("Controller ==> cardOrder");
        logger.debug("product_id=" + product_id);
        logger.debug("device_no=" + device_no);
        logger.debug("goods_ids=" + goods_ids);
        logger.debug("data_ver=" + data_ver);

//        if (StringUtils.isAnyEmpty(product_id, device_no, goods_ids,data_ver)) {
        if (StringUtils.isAnyEmpty(product_id, device_no, goods_ids)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }
        // 微信支付
        return mazdaPayService.cardOrder(product_id, device_no, goods_ids, data_ver);
    }

    /**
     * 刮刮卡支付
     */
    @RequestMapping("/cardPay")
    @ResponseBody
    public Object cardPay(String product_id, String device_no, String order_id, String card_no, String card_password) throws Exception {
        logger.info("Controller ==> cardPay");
        logger.debug("product_id = " + product_id);
        logger.debug("device_no = " + device_no);
        logger.debug("order_id = " + order_id);
        logger.debug("card_no = " + card_no);
        logger.debug("card_password = " + card_password);

        if (StringUtils.isAnyEmpty(product_id, device_no, order_id, card_no, card_password)) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_PARAM);
        }
        return mazdaPayService.cardPay(product_id, device_no, order_id, card_no, card_password);
    }

}

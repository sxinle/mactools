package com.mx.auth.common.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.auth.common.common.base.BaseController;
import com.mx.auth.common.model.Product;
import com.mx.auth.common.service.ProductService;

/**
 * 产品系列管理Controller
 *
 * @author zhengy
 */
@Controller
@RequestMapping("/product")
public class ProductController extends BaseController {
    private static final Logger logger = LogManager.getLogger(ProductController.class);

    @Autowired
    private ProductService productService;

    /**
     * 查看产品系列数据
     */
    @RequestMapping("/getProduct")
    @ResponseBody
    public Object getProduct(Product bean) throws Exception {
        logger.debug("getProduct=>{}", bean.toString());
        return productService.getProductManage(bean);
    }

    /**
     * 修改产品系列数据
     */
    @RequestMapping("/updateProduct")
    @ResponseBody
    public Object updateProduct(Product bean) throws Exception {
        logger.debug("updateProduct=>{}", bean.toString());
        return productService.updateProductManage(bean);
    }

    /**
     * 查看产品系列信息列表
     * {
     * "respCode":xxx,
     * "result": [
     * {
     * "id": "601301",
     * "name": "马自达G5",
     * "secretKey": "995d0af44aab357f2880cb937905d5c0",
     * "permission": 1
     * },...
     * ]
     * }
     */
    @RequestMapping("/getProductSeries")
    @ResponseBody
    public Object getProductSeries(Product bean) throws Exception {
        logger.debug("getProductSeries=>{}", bean.toString());
        return productService.getProductSeries(bean);
    }
}
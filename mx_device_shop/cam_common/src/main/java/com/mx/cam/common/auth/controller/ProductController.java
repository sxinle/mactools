package com.mx.cam.common.auth.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.auth.model.Product;
import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.net.conf.Common;
import com.mx.cam.net.service.CommonAuth;

/**
 * 产品系列管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/com/product")
//@MustLogin
public class ProductController extends BaseController {
	private static Log log = LogFactory.getLog(ProductController.class);

	/**
	 * 查询产品系列
	 */
	@RequestMapping("/getProduct")
	@ResponseBody
	@MustLogin
	public Object getProduct(Product bean) throws Exception {
		log.info("getProduct");
		return CommonAuth.api.getProduct(Common.CGI.getProduct(), bean.toMap()).execute().body();

	}
	
	/**
	 * 修改产品系列
	 */
	@RequestMapping("/updateProduct")
	@ResponseBody
	@MustLogin
	public Object updateProduct(Product bean) throws Exception {
		log.info("updateProduct");
		return CommonAuth.api.updateProduct(Common.CGI.updateProduct(), bean.toMap()).execute().body();
	}


    /**
     * 查询产品系列
     */
    @RequestMapping("/getProductSeries")
    @ResponseBody
    public Object getProductSeries(Product bean) throws Exception {
        log.info("getProductSeries");
        return CommonAuth.api.getProductSeries(Common.CGI.getProductSeries(), bean.toMap()).execute().body();
    }
}

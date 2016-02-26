package com.mx.cam.mazda.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.mazda.model.Goods;
import com.mx.cam.mazda.service.MazdaGoodsService;

/**
 * 商品管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/goods")
@MustLogin
public class MazdaGoodsController extends BaseController {
	private static Log log = LogFactory.getLog(MazdaGoodsController.class);

	@Autowired
	private MazdaGoodsService mazdaGoodsService;

	/**
	 * 获取商品信息
	 */
	@RequestMapping("/getGoodsManage")
	public @ResponseBody
	Object getGoodsManage(Goods bean) throws Exception {
		log.info("getGoodsManage");

		return mazdaGoodsService.getGoodsManage(bean);
	}

    /**
     * 获取服务类商品信息
     */
    @RequestMapping("/getServiceGoods")
    @ResponseBody
    public Object getServiceGoods() throws Exception {
        log.info("getServiceGoods");
        return mazdaGoodsService.getServiceGoods();
    }

	/**
	 * 删除某些商品信息
	 */
	@RequestMapping("/deleteGoodsManage")
    @ResponseBody
	public Object deleteGoodsManage(String ids) throws Exception {
		log.info("deleteGoodsManage");

		return mazdaGoodsService.deleteGoodsManage(ids);

	}

	/**
	 * 保存和修改商品信息
	 */
	@RequestMapping("/saveGoodsManage")
    @ResponseBody
	public Object saveGoodsManage(Goods bean) throws Exception {
		log.info("saveGoodsManage");
		return mazdaGoodsService.saveGoodsManage(bean);
	}

    /**
     * 获取服务列表
     */
    @RequestMapping("/getAllServices")
    @ResponseBody
    public Object getAllServices() throws Exception {
        log.info("getAllService");
        return mazdaGoodsService.getAllServices();
    }
}
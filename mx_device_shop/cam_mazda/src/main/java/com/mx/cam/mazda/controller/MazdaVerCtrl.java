package com.mx.cam.mazda.controller;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.mazda.model.DataVer;
import com.mx.cam.mazda.model.SoftVer;
import com.mx.cam.mazda.service.MazdaVerService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by hsong on 16-1-11.
 */
@Controller
@RequestMapping(Constants.PREFIX_MAZDA + "/ver")
@MustLogin
public class MazdaVerCtrl extends BaseController {
    private static Log log = LogFactory.getLog(MazdaVerCtrl.class);

    @Autowired
    MazdaVerService mazdaVerService;


    /**
     * 查询软件版本管理数据
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("/getSoftVerList")
    public
    @ResponseBody
    Object getSoftVerList(SoftVer bean) throws Exception {
        log.info("getSoftVerList");
        return mazdaVerService.getSoftVerManage(bean);
    }

    /**
     * 删除软件版本数据
     *
     * @param ids
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteSoftVerManage")
    public
    @ResponseBody
    Object deleteSoftVerManage(String ids) throws Exception {
        log.info("deleteSoftVerManage");
        return mazdaVerService.deleteSoftVerManage(ids);
    }

    /**
     * 添加或修改软件版本数据
     *
     * @param bean
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveSoftVerManage")
    public
    @ResponseBody
    Object saveSoftVerManage(SoftVer bean) throws Exception {
        log.info("saveSoftVerManage");
        return mazdaVerService.saveSoftVerManage(bean);
    }

    /**
     * 查询数据版本信息
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("/getDataVerList")
    public
    @ResponseBody
    Object getDataVerList(DataVer bean) throws Exception {
        log.info("getDataVerList");
        return mazdaVerService.getDataVerManage(bean);
    }

    /**
     * 删除数据版本信息
     *
     * @param ids
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteDataVerManage")
    public
    @ResponseBody
    Object deleteDataVerManage(String ids) throws Exception {
        log.info("deleteDataVerManage");
        return mazdaVerService.deleteDataVerManage(ids);
    }

    /**
     * 添加修改数据版本信息
     *
     * @param bean
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveDataVerManage")
    public
    @ResponseBody
    Object saveSoftVerManage(DataVer bean) throws Exception {
        log.info("saveDataVerManage");
        return mazdaVerService.saveDataVerManage(bean);
    }


}

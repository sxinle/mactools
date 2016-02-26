package com.mx.cam.mazda.service;

import com.mx.cam.mazda.model.DataVer;
import com.mx.cam.mazda.model.SoftVer;


/**
 * 激活管理Service
 *
 * @author zhengy
 */
public interface MazdaVerService {

    /**
     * 查询软件版本列表
     */
    Object getSoftVerManage(SoftVer bean) throws Exception;

    /**
     * 删除软件版本信息
     */
    Object deleteSoftVerManage(String ids) throws Exception;

    /**
     * 保存软件版本信息
     */
    Object saveSoftVerManage(SoftVer bean) throws Exception;

    /**
     * 查询数据版本列表
     */
    Object getDataVerManage(DataVer bean) throws Exception;

    /**
     * 删除数据版本
     */
    Object deleteDataVerManage(String ids) throws Exception;

    /**
     * 保存数据版本
     */
    Object saveDataVerManage(DataVer bean) throws Exception;

    /**
     * 保存数据版本
     */
    Object getDataVersWithMark(String minVer) throws Exception;


}

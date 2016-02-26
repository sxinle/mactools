package com.mx.cam.mazda.service.impl;

import com.mx.cam.common.common.Constants;
import com.mx.cam.mazda.dao.MazdaDataVerDao;
import com.mx.cam.mazda.dao.MazdaSovtVerDao;
import com.mx.cam.mazda.model.DataVer;
import com.mx.cam.mazda.model.SoftVer;
import com.mx.cam.mazda.service.MazdaVerService;
import com.mx.server.common.dataver.DataVerComparator;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 订单管理Service
 *
 * @author zhengy
 */
@Service
@Transactional("shop")
public class MazdaVerServiceImpl implements MazdaVerService {

    @Autowired
    private MazdaSovtVerDao mazdaSovtVerDao;
    @Autowired
    private MazdaDataVerDao mazdaDataVerDao;


    /**
     * 查询列表
     */
    @Override
    public Object getSoftVerManage(SoftVer bean) throws Exception {
        List<SoftVer> list = mazdaSovtVerDao.getSoftVerManage(bean);
        JSONObject json = new JSONObject();
        json.put("respCode", Constants.RESPCODE_SUCCESS);
        json.put("rows", list);
        json.put("total", bean.getTotal());
        return json;

    }

    /**
     * 删除列表
     */
    @Override
    public Object deleteSoftVerManage(String ids) throws Exception {
        JSONObject json = new JSONObject();
        String[] idArray = ids.split(",");
        mazdaSovtVerDao.deleteSoftVerManage(idArray);
        json.put("respCode", Constants.RESPCODE_SUCCESS);
        return json;
    }

    /**
     * 保存列表
     */
    @Override
    public Object saveSoftVerManage(SoftVer bean) throws Exception {
        JSONObject json = new JSONObject();
        int num = mazdaSovtVerDao.checkSoftVerId(bean);
        if (num > 0) {
            json.put("respCode", Constants.RESPCODE_ERR_SAME);
            return json;
        }
        if ("".equals(bean.getId())||bean.getId()==null) {
            //添加软件版本数据
            mazdaSovtVerDao.insertSoftVer(bean);
        } else {
            //更新软件版本数据
            mazdaSovtVerDao.updateSoftVer(bean);
        }
        json.put("respCode", Constants.RESPCODE_SUCCESS);
        return json;

    }


    /**
     * 查询列表
     */
    @Override
    public Object getDataVerManage(DataVer bean) throws Exception {
        List<DataVer> list = mazdaDataVerDao.getDataVerManage(bean);

        JSONObject json = new JSONObject();
        json.put("respCode", Constants.RESPCODE_SUCCESS);
        json.put("rows", list);
        json.put("total", bean.getTotal());
        return json;

    }

    /**
     * 删除列表
     */
    @Override
    public Object deleteDataVerManage(String ids) throws Exception {

        JSONObject json = new JSONObject();
        String[] idArray = ids.split(",");
        mazdaDataVerDao.deleteDataVerManage(idArray);
        json.put("respCode", Constants.RESPCODE_SUCCESS);
        return json;
    }

    /**
     * 保存列表
     */
    @Override
    public Object saveDataVerManage(DataVer bean) throws Exception {

        JSONObject json = new JSONObject();
        int num = mazdaDataVerDao.checkDataVerId(bean);
        if (num > 0) {
            json.put("respCode", Constants.RESPCODE_ERR_SAME);
            return json;
        }
        if ("".equals(bean.getId())||bean.getId()==null) {
            mazdaDataVerDao.insertDataVer(bean);
        } else {
            mazdaDataVerDao.updateDataVer(bean);
        }
        json.put("respCode", Constants.RESPCODE_SUCCESS);
        return json;

    }

    @Override
    public Object getDataVersWithMark(String minVer) throws Exception {
        List<DataVer> allVers = mazdaDataVerDao.getAllVers();
        JSONObject root = new JSONObject();
        JSONArray rows = new JSONArray();

        for (DataVer dataVer : allVers) {
            JSONObject node = new JSONObject();
            String compareRetStr = DataVerComparator.judgeBigger(minVer, dataVer.getVer_id());
            boolean canNotUpdate = compareRetStr.contains("[1]") || compareRetStr.contains("[0]");
            node.put("validate", canNotUpdate ? 0 : 1);
            node.put("verName", dataVer.getVer_name());
            node.put("verId", dataVer.getVer_id());
            rows.add(node);
        }
        root.put("rows", rows);
        root.put(Constants.KEY_RESP_CODE, Constants.RESPCODE_SUCCESS);

        return root;
    }

    public static void main(String[] args) {
        System.out.println(DataVerComparator.judgeBigger("T04.8003.02.08.01.00-15.01.01-03-N", "T04.8003.02.09.01.00-15.03.01-06-N"));
    }
}

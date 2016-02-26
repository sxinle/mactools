package com.mx.auth.common.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.ResponseBuilder;
import com.mx.auth.common.dao.NdsTopDataVerDao;
import com.mx.auth.common.model.NdsTopDataVer;
import com.mx.auth.common.service.NdsTopDataVerService;
import com.mx.server.common.dataver.DataVerComparator;

@Service
@Transactional
public class NdsTopDataVerServiceImpl implements NdsTopDataVerService {

    @Autowired
    private NdsTopDataVerDao ndsTopDataVerDao;

    /**
     * 查询最高版本
     */
    @Override
    public Object getNdsTopDataVerManage(NdsTopDataVer bean) throws Exception {
        List<NdsTopDataVer> list = ndsTopDataVerDao.getNdsTopDataVerManage(bean);
        JSONObject json = new JSONObject();
        json.put("respCode", Constants.RESPCODE_SUCCESS);
        json.put("rows", list);
        json.put("total", bean.getTotal());
        return json;

    }

    @Override
    public Object getMinNdsTopDataVer(NdsTopDataVer bean) {
        List<NdsTopDataVer> vers = ndsTopDataVerDao.getNdsTopDataVerManage(bean);
        if(vers.isEmpty()) return ResponseBuilder.getRespCode(Constants.RESPCODE_FAILURE);

        String minVer = vers.get(0).getData_ver();// 取最小数据权限版本
        for (NdsTopDataVer ver : vers) {
            String compareRet = DataVerComparator.judgeBigger(minVer, ver.getData_ver());
            if(compareRet.contains("[1]")) {
                minVer = ver.getData_ver();
            }
        }

        JSONObject obj = new JSONObject();
        obj.put(Constants.RESPCODE_KEY, Constants.RESPCODE_SUCCESS);
        obj.put("minVer", minVer);

        return obj;
    }

    public static void main(String[] args) {
        String result = DataVerComparator.judgeBigger("T04.8003.02.06.01.00-15.01.01-04-N", "T04.8003.02.06.01.00-14.04.01-01-N");
        System.out.println(result);
    }
}

package com.mx.cam.std.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.common.Constants;
import com.mx.cam.std.dao.StdSoftVerDao;
import com.mx.cam.std.model.SoftVer;
import com.mx.cam.std.service.StdSoftVerService;

/**
 * 软件版本管理Service
 * 
 * @author zhengy
 * 
 */
@Service
@Transactional("shop")
public class StdSoftVerServiceImpl implements StdSoftVerService {

    @Autowired
    private StdSoftVerDao stdSoftVerDao;

    /**
     * 查询列表
     */
    @Override
    public Object getSoftVerManage(SoftVer bean) throws Exception {
        List<SoftVer> list = stdSoftVerDao.getSoftVerManage(bean);
        JSONObject json = new JSONObject();
		json.put("respCode", Constants.RESPCODE_SUCCESS);
		json.put("rows", list);
		json.put("total", bean.getTotal());
		return json;

    }

    /**
     * 删除列表
     * 
     */
    @Override
    public Object deleteSoftVerManage(String ids) throws Exception {
    	JSONObject json = new JSONObject();
        String[] idArray = ids.split(",");
        stdSoftVerDao.deleteSoftVerManage(idArray);
        json.put("respCode", Constants.RESPCODE_SUCCESS);
        return json;
    }

    /**
     * 保存列表
     * 
     */
    @Override
    public Object saveSoftVerManage(SoftVer bean) throws Exception {
    	JSONObject json = new JSONObject();
    	int num = stdSoftVerDao.checkSoftVerId(bean);
    	if(num > 0){
    		json.put("respCode", Constants.RESPCODE_ERR_SAME);
			return json;
    	}
    	if("".equals(bean.getId())||bean.getId() == null){
    		//添加软件版本数据
    		stdSoftVerDao.insertSoftVer(bean);
    	}else{
    		//更新软件版本数据
    		stdSoftVerDao.updateSoftVer(bean);
    	}
    	json.put("respCode", Constants.RESPCODE_SUCCESS);
        return json;
    	
    }
    
}

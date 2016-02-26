package com.mx.auth.mazda.service.impl;

import java.util.Arrays;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.auth.common.common.ConfigListener;
import com.mx.auth.common.common.PdpServerConnector;
import com.mx.auth.common.dao.NdsDataServiceAuthDao;
import com.mx.auth.common.dao.TspAuthDao;
import com.mx.auth.common.model.NdsDataServiceAuth;
import com.mx.auth.mazda.beans.TestBean;
import com.mx.auth.mazda.service.TestService;

/**
 * 测试用后门接口
 * 
 * @author Chenzy
 *
 */
@Service
@Transactional
public class TestServiceImpl implements TestService {
    private static final Logger logger = LogManager.getLogger(TestServiceImpl.class);

    @Autowired
    private TspAuthDao    tspAuthDao;
    @Autowired
    private NdsDataServiceAuthDao dataServiceAuthDao;
    
    @Override
    public void getReset(TestBean bean) throws Exception {
        logger.info("getReset");
        tspAuthDao.deleteByDev(bean.getDeviceNo(), bean.getProductID());
        PdpServerConnector.instance().clearAuthCache(bean.getProductID(), bean.getDeviceNo());
    }

    @Override
    public void modifyTspPermission(TestBean bean) throws Exception {
        logger.info("modifyTspPermission");
        String[] items = bean.getServiceType().split(",");
        tspAuthDao.updateEndDate(bean.getDeviceNo(), bean.getProductID(), bean.getIsExpired(), Arrays.asList(items));
        PdpServerConnector.instance().clearAuthCache(bean.getProductID(), bean.getDeviceNo());
    }

    @Override
    public void abrogateFree(String deviceNo, String productId) throws Exception {
        logger.info("abrogateFree");
        String[] regions = ConfigListener.instance().getProduceSysConfig().getRegionidsStr().split(",");
        for (int i = 0; i < regions.length; ++i) {
            NdsDataServiceAuth dataServiceAuth = new NdsDataServiceAuth();
            dataServiceAuth.setProduct_id(productId);
            dataServiceAuth.setDevice_no(deviceNo);
            dataServiceAuth.setRegion_code(regions[i]);
            dataServiceAuthDao.updateNdsAuthEndDate(dataServiceAuth);
        }
        PdpServerConnector.instance().clearAuthCache(productId, deviceNo);
    }
}

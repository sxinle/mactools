package com.mx.auth.mazda.service.impl;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.ResponseBuilder;
import com.mx.auth.common.dao.NdsDataServiceAuthDao;
import com.mx.auth.common.dao.NdsTopDataVerDao;
import com.mx.auth.common.model.DeviceInfo;
import com.mx.auth.common.model.NdsTopDataVer;
import com.mx.auth.common.service.ActCodeProducerService;
import com.mx.auth.mazda.service.UpgradeService;
import com.mx.server.common.dataver.DataVerComparator;
import net.sf.json.JSONObject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


/**
 * 数据升级管理Service
 *
 * @author zhengy
 */
@Service
@Transactional
public class UpgradeServiceImpl implements UpgradeService {

    private static final Logger logger = LogManager.getLogger(UpgradeServiceImpl.class);

    @Autowired
    private NdsTopDataVerDao       ndsTopDataVerDao;
    @Autowired
    private NdsDataServiceAuthDao  ndsDataServiceAuthDao;
    @Autowired
    private ActCodeProducerService actCodeProducerService;

    /**
     * 验证车机号是否正确
     */
    @Override
    public String checkDeviceNoUpgrade(String deviceNo) throws Exception {
        DeviceInfo device = new DeviceInfo();
        device.setDevice_no(deviceNo);
        //验证车机号是否正确
        int num = ndsDataServiceAuthDao.checkDeviceNo(device);
        if (num == 0) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_DEVICE_NOT_FOUND);
        }
        //验证车机号是否可升级
        int upgrade = ndsDataServiceAuthDao.checkDeviceNoUpgrade(device);
        if (upgrade == 0) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_DEV_NO_PERMISSION);
        }

        return ResponseBuilder.getRespCode(Constants.RESPCODE_SUCCESS);
    }

    /**
     * 保存升级数据
     */
    @Override
    public String saveUpgrade(NdsTopDataVer topDataVer) throws Exception {
        final String deviceNo = topDataVer.getDevice_no();
        final String productId = topDataVer.getProduct_id();
        final String softVer = topDataVer.getSoft_ver();

        List<NdsTopDataVer> allTopVers = ndsTopDataVerDao.findByDeviceNo(topDataVer);
        String targetVer = topDataVer.getData_ver();
        List<String> shouldUpdateRegions = new ArrayList<>();// 比目标地图版本低的省份列表

        for (NdsTopDataVer topVer : allTopVers) {
            String currentVer = topVer.getData_ver();
            boolean shouldUpdate = DataVerComparator.judgeBigger(targetVer, currentVer).contains("[1]");
            if (shouldUpdate) {
                logger.debug("originDataVer:{}  newDataVer:{} ==[{}]", currentVer, targetVer, topVer.getRegion_code());
                shouldUpdateRegions.add(topVer.getRegion_code());
            }
        }

        if (!shouldUpdateRegions.isEmpty()) {
            ndsTopDataVerDao.fullRegionUpdate(topDataVer, shouldUpdateRegions);
        }

        final String actCode;
        {
            JSONObject libRet = actCodeProducerService.doActivate(deviceNo, productId,
                    softVer, topDataVer.getData_ver(), Constants.WHOLE_COUNTRY_CODE);
            if (null == libRet) {
                return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_ENCRYPTION);
            }
            actCode = libRet.getString("actCodeStr");
        }

        HashMap<Object, Object> ret = new HashMap<>();
        ret.put(Constants.RESPCODE_KEY, Constants.RESPCODE_SUCCESS);
        ret.put("actCode", actCode);

        return JSONObject.fromObject(ret).toString();
    }
}

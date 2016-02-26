package com.mx.auth.mazda.service.impl;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.dao.DeviceInfoDao;
import com.mx.auth.common.dao.TspAuthDao;
import com.mx.auth.common.model.TspAuth;
import com.mx.auth.common.model.TspAuthInfo;
import com.mx.auth.mazda.beans.TspRenew;
import com.mx.auth.mazda.service.MazdaTspAuthService;
import net.sf.json.JSONObject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Tsp鉴权服务
 *
 * @author wxc
 */
@Service
@Transactional
public class MazdaTspAuthServiceImpl implements MazdaTspAuthService {
    private static final Logger logger = LogManager.getLogger(MazdaTspAuthServiceImpl.class);

    @Autowired
    TspAuthDao    tspAuthDao;
    @Autowired
    DeviceInfoDao deviceInfoDao;

    /**
     * 获取服务权限
     */
    @Override
    public String getTspAuth(String productId, String deviceNo, String serviceTypes) throws Exception {
        logger.info("Service ==> getTspAuth");
        logger.debug("productId={} deviceNo={} serviceTypes={}", productId, deviceNo, serviceTypes);
        Date now = new Date(System.currentTimeMillis());
        String[] serviceTypeArr = serviceTypes.split(",");
        List<JSONObject> serviceAuthInfo = new ArrayList<>();
        for (String serviceType : serviceTypeArr) {
            List<TspAuth> tspAuths = tspAuthDao.getServiceAuth(productId,
                    deviceNo,
                    Integer.parseInt(serviceType));
            List<JSONObject> regionAuthInfo = new ArrayList<>();
            for (TspAuth tspAuth : tspAuths) {
                JSONObject tspAuthObj = new JSONObject();
                Date start = tspAuth.getStart_date();
                Date end = tspAuth.getEnd_date();
                if (start != null) {
                    tspAuthObj.put("startDate", new SimpleDateFormat("yyyy-MM-dd").format(start));
                }
                if (end != null) {
                    tspAuthObj.put("endDate", new SimpleDateFormat("yyyy-MM-dd").format(end));
                }
                tspAuthObj.put("authType", tspAuth.getAuth_type());
                regionAuthInfo.add(tspAuthObj);
            }
            StringBuffer endDate = new StringBuffer();
            int authCode = checkVinTspAuth(tspAuths, endDate);
            logger.debug("auth=" + authCode);
            JSONObject authInfo = new JSONObject();
            authInfo.put("serviceCode", serviceType);
            authInfo.put("deviceNo", deviceNo);
            authInfo.put("servAuthCode", authCode);
            authInfo.put("endDate", endDate.toString());
            authInfo.put("serviceAuthInfo", regionAuthInfo);
            serviceAuthInfo.add(authInfo);
        }
        // 返回值设定
        JSONObject root = new JSONObject();
        root.put("authInfo", serviceAuthInfo);
        root.put("respCode", Constants.RESPCODE_SUCCESS);
        root.put("currDate", new SimpleDateFormat("yyyy-MM-dd").format(now));
        return root.toString();
    }

    @Override
    public Object payTspService(TspRenew param) throws Exception {
        TspAuthInfo example = new TspAuthInfo();
        example.setProduct_id(param.getProduct_id());
        example.setDevice_no(param.getDevice_no());
        example.setService_type(param.getService_type());

        TspAuthInfo info = tspAuthDao.getTspAuth(example).get(0);

        SimpleDateFormat sfm = new SimpleDateFormat("yyyy-MM-dd");
        Date orgEndDate = sfm.parse(info.getEnd_date());
        Calendar orgDate = Calendar.getInstance();
        orgDate.setTime(orgEndDate);
        orgDate.add(Calendar.YEAR, param.getYears_cnt());
        String newEndDate = sfm.format(orgDate.getTime());

        info.setEnd_date(newEndDate);
        tspAuthDao.updateTspEndDate(info);

        JSONObject ret = new JSONObject();
        ret.put("respCode", Constants.RESPCODE_SUCCESS);
        ret.put("newDate", newEndDate);

        return ret;
    }

    // 查询指定vin对应的权限信息
    private int checkVinTspAuth(List<TspAuth> tspAuths, StringBuffer endDate) {
        if (tspAuths == null || tspAuths.size() == 0) {
            return Constants.VIN_NOT_EXIST;
        } else {
            long currtime = System.currentTimeMillis();
            long endtime = 0;
            for (int i = 0; i < tspAuths.size(); ++i) {
                TspAuth tspAuth = tspAuths.get(i);
                Date thisEndTime = tspAuth.getEnd_date();
                if (thisEndTime != null && thisEndTime.getTime() > endtime) {
                    endtime = thisEndTime.getTime();
                }
            }
            int retCode = Constants.SERVICE_OUT_DATE;
            if (endtime > currtime) {
                retCode = Constants.SERVICE_CAN;
            }
            // 更新结束日期
            String endDateStr = new SimpleDateFormat("yyyy-MM-dd").format(new Date(endtime));
            endDate.append(endDateStr);
            return retCode;
        }
    }
}


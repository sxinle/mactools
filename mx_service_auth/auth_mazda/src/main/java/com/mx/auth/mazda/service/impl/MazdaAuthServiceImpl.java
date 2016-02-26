package com.mx.auth.mazda.service.impl;

import com.mx.auth.common.common.CommonUtils;
import com.mx.auth.common.common.ConfigListener;
import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.PdpServerConnector;
import com.mx.auth.common.common.ResponseBuilder;
import com.mx.auth.common.dao.*;
import com.mx.auth.common.model.*;
import com.mx.auth.common.service.ActCodeProducerService;
import com.mx.auth.mazda.service.MazdaAuthService;

import net.sf.json.JSONObject;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * NDS鉴权接口Service
 *
 * @author zhengy
 */
@Service
@Transactional
public class MazdaAuthServiceImpl implements MazdaAuthService {

    private static final Logger logger = LogManager.getLogger(MazdaAuthServiceImpl.class);

    @Autowired
    private NdsTopDataVerDao         ndsTopDataVerDao;
    @Autowired
    private NdsDataActiveLogDao      ndsDataActiveLogDao;
    @Autowired
    private TspAuthDao               tspAuthDao;
    @Autowired
    private NdsDataServiceAuthDao    ndsDataServiceAuthDao;
    @Autowired
    private DeviceInfoDao            deviceInfoDao;
    @Autowired
    private NdsDataSellActiveAuthDao ndsDataSellActiveAuthDao;
    @Autowired
    private ActCodeProducerService   actCodeProducerService;

    @Override
    public String firstActive(Activate bean) throws Exception {
        logger.info("firstActive");
        logger.debug("param=", bean.toString());
        String deviceNo = bean.getDevice_no();
        String productId = bean.getProduct_id();
        String dataVer = bean.getData_version_id();
        String softVer = bean.getSoft_ver_id();

        DeviceInfo example = new DeviceInfo(bean);
        List<DeviceInfo> records = deviceInfoDao.findByExample(example);
        boolean alreadyActive = records.size() > 0;
        if (!alreadyActive) {
            // 根据车机号取得模型号和加密库ID
            final String actCode;
            final String deviceSerialNum;
            JSONObject libRet;
            try {
                libRet = actCodeProducerService.doActivate(deviceNo, productId, softVer, dataVer, Constants.WHOLE_COUNTRY_CODE);
                if (null == libRet) {
                    return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_ENCRYPTION);
                }
            } catch (Exception e) {
                logger.error("调用加密库出错！！！");
                throw e;
            }
            actCode = libRet.getString("actCodeStr");
            deviceSerialNum = libRet.getString("deviceNoStr");

            /* ① 绑定车机用户 */
            deviceInfoDao.insertDeviceUser(bean);
            /* ② NDS数据授权 */
            NdsDataSellActiveAuth authSell = activeNdsDataService(deviceNo, productId, softVer, dataVer, actCode, deviceSerialNum);
            /* ③ 马自达Tsp授权 */
            activeTspService(authSell.getAuth_order_id(), bean);
            /* ④ 剩余数量-1 */
            authSell.setNums((Integer.parseInt(authSell.getNums()) - 1) + "");
            ndsDataSellActiveAuthDao.update(authSell);

            JSONObject json = new JSONObject();
            json.put("respCode", Constants.RESPCODE_SUCCESS);
            json.put("actCode", actCode);
            
            // 清空PDP中对应的权限数据缓存
            PdpServerConnector.instance().clearAuthCache(productId, deviceNo);

            return json.toString();
        } else {
            logger.info("deviceNo:{} 已经激活过!!!", deviceNo);
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_ENDTIME);
        }
    }

    // ==================================================================================================================
    public NdsDataSellActiveAuth activeNdsDataService(String deviceNo, String productId, String softVer, String dataVer, String actCode, String deviceSerialNum) throws Exception {
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        final String now = fmt.format(new Date());

        List<NdsDataSellActiveAuth> authList = ndsDataSellActiveAuthDao.findByProductId(productId);
        if (authList.size() == 0) {
            throw new RuntimeException("激活记录未找到!!!(table: te_nds_data_sell_active_auth)");
        }

        NdsDataSellActiveAuth orderAuth = authList.get(0);

        String[] regions = ConfigListener.instance().getProduceSysConfig().getRegionidsStr().split(",");
        activeEachRegion(regions, deviceNo, productId, dataVer, orderAuth);

        NdsDataActiveLog activeLog = new NdsDataActiveLog(CommonUtils.genUUID(), productId,
                deviceNo, softVer, dataVer, Constants.WHOLE_COUNTRY_CODE, now, actCode, deviceSerialNum,
                Constants.ACT_TYPE_NEW, Constants.ACT_SOURCE_WEB);

        ndsDataActiveLogDao.insertNdsDataActiveLog(activeLog);

        return orderAuth;
    }

    public void activeEachRegion(String[] regIds, String deviceNo, String productId,
                                 String dataVer, NdsDataSellActiveAuth orderAuth) {
        // TODO use batch insert
        String now = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        for (String regCode : regIds) {
            NdsTopDataVer bean = new NdsTopDataVer(deviceNo, productId, regCode, dataVer);
            ndsTopDataVerDao.insert(bean);
            // 鉴权表添加32个省的鉴权记录，鉴权类型为2

            String endTime = getEndTime(orderAuth.getFree_upg_duration());
            String years = orderAuth.getFree_upg_duration();
            int freeTimes = Integer.parseInt(orderAuth.getFree_upg_times());
            NdsDataServiceAuth ndsAuth = new NdsDataServiceAuth(CommonUtils.genUUID(), productId,
                    deviceNo, orderAuth.getAuth_order_id(), regCode, now, endTime, freeTimes,
                    freeTimes, years, dataVer, Constants.FREE_AUTH + "",
                    Constants.AUTH_RULE_PERIOD, Constants.AUTH_BUSINESS_MODE_SELL_NO_NUM);
            ndsDataServiceAuthDao.insert(ndsAuth);
        }
    }

    public String getEndTime(String duration) {
        String endTime = CommonUtils.getDate(1000);// 容错...防止格式不正确
        if (duration.contains("|")) {
            String[] num_unit = duration.split("\\|");
            int calendar_unit = Calendar.YEAR;
            switch (Integer.parseInt(num_unit[1])) {
                case 0:
                    calendar_unit = Calendar.MONTH;
                    break;
                case 1:
                    calendar_unit = Calendar.DAY_OF_YEAR;
                    break;
                case 2:
                    calendar_unit = Calendar.YEAR;
            }
            endTime = CommonUtils.getDate(Integer.parseInt(num_unit[0]), calendar_unit);
        }
        return endTime;
    }

    public void activeTspService(String authOrderId, Activate bean) throws Exception {
        List<TspInfo> tspInfos = tspAuthDao.getTspFreeTime(authOrderId);
        if(tspInfos.isEmpty()) {
            logger.error("TSP service authOrder is Empty! [auth_order_id: {}]", authOrderId);
        }

        for (TspInfo tspInfo : tspInfos) {
            Date now = new Date();
            TspAuth tspAuth = new TspAuth(tspInfo.getService_type(), now, new SimpleDateFormat("yyyy-MM-dd").parse(getEndTime(tspInfo.getFree_upg_duration())),
                    now, authOrderId, bean.getProduct_id(), bean.getDevice_no(), "1");
            tspAuthDao.addTspAuth(tspAuth);
        }
    }
}

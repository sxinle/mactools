package com.mx.auth.std.service.impl;

import com.mx.auth.common.common.ActiveCodeProducer;
import com.mx.auth.common.common.CommonUtils;
import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.RandomGUID;
import com.mx.auth.common.dao.StdAuthDao;
import com.mx.auth.common.dao.TspAuthDao;
import com.mx.auth.common.model.*;
import com.mx.auth.common.service.ActCodeProducerService;
import com.mx.auth.std.service.StdAuthService;
import net.sf.json.JSONObject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service("stdAuthService")
@Transactional
public class StdAuthServiceImpl implements StdAuthService {

    private static final Logger logger = LogManager.getLogger(StdAuthServiceImpl.class);

    @Autowired
    private StdAuthDao stdAuthDao;

    @Autowired
    private ActCodeProducerService actCodeProducerService;

    @Autowired
    private TspAuthDao tspAuthDao;

    /*
     * 首次激活
     */
    @Override
    public Object firstActive(Activate bean) throws Exception {
        logger.info("Service ==> firstActive");

        String product_id = bean.getProduct_id();
        String device_no = bean.getProduct_id();
        String soft_ver = bean.getSoft_ver();
        String data_version = bean.getData_version();

        logger.debug("product_id=" + product_id);
        logger.debug("device_no=" + device_no);
        logger.debug("soft_ver=" + soft_ver);
        logger.debug("data_version=" + data_version);
        logger.debug("vin=" + bean.getVin());

        JSONObject json = new JSONObject();

        // 查询权限表是否有车机记录
        List<NdsDataServiceAuth> list = stdAuthDao.getNdsDataServiceAuthList(
                product_id, device_no);
        // 有记录
        if (list.size() > 0) {
            // 查询权限表是否有未激活记录
            List<NdsDataServiceAuth> activeList = stdAuthDao
                    .getNdsDataServiceAuthActiveList(product_id, device_no);
            // 有号段未激活
            if (activeList.size() > 0) {
                // 取得加密库文件
                ActiveCodeProducer producer = actCodeProducerService
                        .generateProducer(product_id, soft_ver);

                // ///////////////////////调用加密库生成激活码///////////////////////
                String actCode = "xxx";
                JSONObject obj = producer.pruduceActivationCode(device_no,
                        product_id, data_version, "5600",
                        producer.getCurrentDate(), producer.getActWay());
                actCode = obj.getString("actCodeStr");
                // ///////////////////////调用加密库生成激活码///////////////////////
                // 首次激活插入激活记录表
                NdsDataActiveLog logBean = new NdsDataActiveLog();
                RandomGUID g_id = new RandomGUID(true);
                String id = g_id.toString();
                logBean.setId(id);
                logBean.setProduct_id(product_id);
                logBean.setDevice_no(device_no);
                logBean.setSoft_ver(soft_ver);
                logBean.setData_ver(data_version);
                logBean.setRegion_code("5600");
                logBean.setActive_code(actCode);
                logBean.setActive_type("1");// 激活类型（1：新装；2：续费）
                logBean.setActive_source("1");// 激活途径(0：生产系统，1：美行TSP车机商城，2：美行商城，3：马自达商城，4：其他)
                stdAuthDao.insertNdsDataActiveLog(logBean);

//                // 查询权限订单厂商ID
//                String oem_id = stdAuthDao.getAuthOrderOmeId(activeList.get(0).getAuth_order_id());
//                bean.setOem_id(oem_id);
                // 首次激活更新设备信息表
                stdAuthDao.updateDeviceInfo(bean);

                for (int i = 0; i < activeList.size(); i++) {
                    // 首次激活更新权限表
                    NdsDataServiceAuth authBean = new NdsDataServiceAuth();
                    authBean.setAuth_id(activeList.get(i).getAuth_id());
                    authBean.setEnd_time(CommonUtils.getEndTime(
                            activeList.get(i).getYears(),
                            java.util.Calendar.getInstance()));
                    stdAuthDao.updateNdsDataServiceAuth(authBean);
                    // 首次激活更新最高版本表
                    NdsTopDataVer topDataVerBean = new NdsTopDataVer();
                    topDataVerBean.setDevice_no(device_no);
                    topDataVerBean.setProduct_id(product_id);
                    topDataVerBean.setData_ver(data_version);
                    topDataVerBean.setRegion_code(activeList.get(i)
                            .getRegion_code());
                    stdAuthDao.updateNdsDataVer(topDataVerBean);

                }

                // 查询服务权限有效期
                List<TspAuth> tspAuthList = stdAuthDao.getTspAuthFreeTime(activeList.get(0).getAuth_order_id(), product_id, device_no);
                for (int k = 0; k < tspAuthList.size(); k++) {
                    tspAuthList.get(k).setEnd_date(new SimpleDateFormat("yyyy-MM-dd").parse(CommonUtils.getEndTime(
                            tspAuthList.get(k).getFree_upg_duration(),
                            java.util.Calendar.getInstance())));
                    //首次激活更新服务鉴权（开始时间、结束时间）
                    stdAuthDao.updateTspAuth(tspAuthList.get(k));
                }

                json.put("respCode", Constants.RESPCODE_SUCCESS);
                json.put("actCode", actCode);
                return json;
            } else {
                // 已经激活过
                json.put("respCode", Constants.RESPCODE_ACTIVED);
                return json;
            }
        } else {// 无记录
            // 查询销售激活记录表中是否有此产品系列无号段记录
            List<NdsDataSellActiveAuth> sellList = stdAuthDao
                    .getNdsDataSellActiveAuthList(product_id);
            // 无号段未激活
            if (sellList.size() > 0) {
                // TODO 判断车机号是否符合产品系列规则
                boolean rule = true;
                // 符合规则
                if (rule) {
                    // 更新无号段销售激活次数-1
                    int no = stdAuthDao.updateNdsDataSellActiveAuthNums(
                            sellList.get(0).getSell_auth_id(), sellList.get(0)
                                    .getNums(), String.valueOf(Integer
                                    .parseInt(sellList.get(0).getNums()) - 1));
                    while (no == 0) {
                        sellList = stdAuthDao
                                .getNdsDataSellActiveAuthList(product_id);
                        if (sellList.size() > 0) {
                            no = stdAuthDao.updateNdsDataSellActiveAuthNums(
                                    sellList.get(0).getSell_auth_id(), sellList
                                            .get(0).getNums(), String
                                            .valueOf(Integer.parseInt(sellList
                                                    .get(0).getNums()) - 1));
                        } else {
                            // 产品系列和车机号不匹配
                            json.put("respCode", Constants.RESPCODE_MISMATCHING);
                            return json;
                        }
                    }

                    // 取得加密库文件
                    ActiveCodeProducer producer = actCodeProducerService
                            .generateProducer(product_id, soft_ver);

                    // ///////////////////////调用加密库生成激活码///////////////////////
                    String actCode = "xxx";
                    JSONObject obj = producer.pruduceActivationCode(device_no,
                            product_id, data_version, "5600",
                            producer.getCurrentDate(), producer.getActWay());
                    actCode = obj.getString("actCodeStr");
                    // ///////////////////////调用加密库生成激活码///////////////////////
                    // 首次激活插入激活记录表
                    NdsDataActiveLog logBean = new NdsDataActiveLog();
                    RandomGUID g_id = new RandomGUID(true);
                    String id = g_id.toString();
                    logBean.setId(id);
                    logBean.setProduct_id(product_id);
                    logBean.setDevice_no(device_no);
                    logBean.setSoft_ver(soft_ver);
                    logBean.setData_ver(data_version);
                    logBean.setRegion_code("5600");
                    logBean.setActive_code(actCode);
                    logBean.setActive_type("1");// 激活类型（1：新装；2：续费）
                    logBean.setActive_source("1");// 激活途径(0：生产系统，1：美行TSP车机商城，2：美行商城，3：马自达商城，4：其他)
                    stdAuthDao.insertNdsDataActiveLog(logBean);
                    
                    // 查询权限订单厂商ID
                    String oem_id = stdAuthDao.getAuthOrderOmeId(sellList.get(0).getAuth_order_id());
                    bean.setOem_id(oem_id);
                    // 首次激活插入设备信息表
                    stdAuthDao.insertDeviceInfo(bean);

                    String[] region_code = sellList.get(0).getRegion_code()
                            .split(",");
                    for (int i = 0; i < region_code.length; i++) {
                        // 首次激活更新权限表
                        NdsDataServiceAuth authBean = new NdsDataServiceAuth();
                        RandomGUID a_id = new RandomGUID(true);
                        String auth_id = a_id.toString();
                        authBean.setAuth_id(auth_id);
                        authBean.setProduct_id(product_id);
                        authBean.setDevice_no(device_no);
                        authBean.setAuth_order_id(sellList.get(0)
                                .getAuth_order_id());
                        authBean.setRegion_code(region_code[i]);
                        authBean.setEnd_time(CommonUtils.getEndTime(sellList
                                        .get(0).getFree_upg_duration(),
                                java.util.Calendar.getInstance()));
                        authBean.setInit_nums(Integer.parseInt(sellList.get(0)
                                .getFree_upg_times()));
                        authBean.setNums(Integer.parseInt(sellList.get(0)
                                .getFree_upg_times()));
                        authBean.setYears(sellList.get(0)
                                .getFree_upg_duration());
//						authBean.setData_ver(sellList.get(0).getData_ver());
                        authBean.setAuth_type("1");
                        authBean.setAuth_rule(sellList.get(0).getAuth_rule());
                        authBean.setBusiness_mode(sellList.get(0)
                                .getBusiness_mode());
                        authBean.setDevice_type("1");
                        stdAuthDao.insertNdsDataServiceAuth(authBean);
                        // 首次激活插入最高版本表
                        NdsTopDataVer topDataVerBean = new NdsTopDataVer();
                        topDataVerBean.setDevice_no(device_no);
                        topDataVerBean.setProduct_id(product_id);
                        topDataVerBean.setData_ver(data_version);
                        topDataVerBean.setRegion_code(region_code[i]);
                        stdAuthDao.insertNdsTopDataVer(topDataVerBean);
                    }

                    //查询服务权限有效期
                    List<TspInfo> tspInfos = tspAuthDao.getTspFreeTime(sellList.get(0).getAuth_order_id());
                    for (TspInfo tspInfo : tspInfos) {
                        Date now = new Date();
                        TspAuth tspAuth = new TspAuth(tspInfo.getService_type(), now,
                                new SimpleDateFormat("yyyy-MM-dd").parse(CommonUtils.getEndTime(tspInfo.getFree_upg_duration(), java.util.Calendar.getInstance())),
                                now, sellList.get(0).getAuth_order_id(), product_id, device_no, "1");
                        //首次激活插入服务鉴权
                        tspAuthDao.addTspAuth(tspAuth);
                    }

                    json.put("respCode", Constants.RESPCODE_SUCCESS);
                    json.put("actCode", actCode);
                    return json;

                } else {// 不符合规则
                    // 产品系列和车机号不匹配
                    json.put("respCode", Constants.RESPCODE_MISMATCHING);
                    return json;
                }

            } else {
                // 产品系列和车机号不匹配
                json.put("respCode", Constants.RESPCODE_MISMATCHING);
                return json;
            }

        }
    }

}

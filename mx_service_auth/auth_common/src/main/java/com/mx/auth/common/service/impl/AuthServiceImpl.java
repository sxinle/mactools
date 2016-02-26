package com.mx.auth.common.service.impl;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.auth.common.common.ActiveCodeProducer;
import com.mx.auth.common.common.ConfigListener;
import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.DataUpgradeSysConnector;
import com.mx.auth.common.common.RandomGUID;
import com.mx.auth.common.dao.StdAuthDao;
import com.mx.auth.common.model.NdsDataActiveLog;
import com.mx.auth.common.model.NdsDataServiceAuth;
import com.mx.auth.common.model.NdsTopDataVer;
import com.mx.auth.common.service.ActCodeProducerService;
import com.mx.auth.common.service.AuthService;

@Service("authService")
@Transactional
public class AuthServiceImpl implements AuthService {

	private static final Logger logger = LogManager
			.getLogger(AuthServiceImpl.class);

	@Autowired
	private StdAuthDao stdAuthDao;
	
	@Autowired
	private ActCodeProducerService actCodeProducerService;

	/**
	 * 获取数据权限列表(Web接口用)
	 */
	@Override
	public Object getDataAuth(String product_id, String device_no,
			String region_ids, String encryption) throws Exception {
		logger.info("Service ==> getDataAuth");

		JSONObject json = new JSONObject();
		// 查询数据权限
		String[] ids = region_ids.split(",");
		NdsDataServiceAuth authBean = new NdsDataServiceAuth();
		authBean.setProduct_id(product_id);
		authBean.setDevice_no(device_no);
		authBean.setRegion_ids(ids);
		// 查询数据版本表List
		List<NdsTopDataVer> dataVerList = stdAuthDao.getDataVerList(authBean);
		// 查询数据权限表List
		List<NdsDataServiceAuth> list = stdAuthDao.getDataAuthList(authBean);

		if (dataVerList.size() > 0) {
			json.put("respCode", Constants.RESPCODE_SUCCESS);
			List<JSONObject> authInfo = new ArrayList<>();
			for (int i = 0; i < dataVerList.size(); i++) {
				JSONObject region = new JSONObject();
				region.put("regionId",
						Integer.valueOf(dataVerList.get(i).getRegion_code()));
				region.put("topDataVer", dataVerList.get(i).getData_ver());
				List<JSONObject> regionAuthInfo = new ArrayList<>();
				for (int k = 0; k < list.size(); k++) {
					if (dataVerList.get(i).getRegion_code().toString()
							.equals(list.get(k).getRegion_code().toString())) {
						JSONObject obj = new JSONObject();
						obj.put("startTime", StringUtils.trimToEmpty(list.get(k)
								.getStart_time()));
						obj.put("endTime", StringUtils.trimToEmpty(list.get(k)
								.getEnd_time()));
						obj.put("num", list.get(k).getNums());
						obj.put("dataVer", list.get(k).getData_ver());
						obj.put("authType",
								Integer.valueOf(list.get(k).getAuth_type()));
						obj.put("authRule",
								Integer.valueOf(list.get(k).getAuth_rule()));
						obj.put("businessMode",
								Integer.valueOf(list.get(k).getBusiness_mode()));
						regionAuthInfo.add(obj);
					}
				}
				if (regionAuthInfo.size() > 0) {
					region.put("authFlag", 1);
					region.put("regionAuthInfo", regionAuthInfo);
				} else {
					region.put("authFlag", 0);
				}
				authInfo.add(region);
			}
			json.put("authInfo", authInfo);

		} else {
			json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
		}
		return json;
	}

	/**
	 * 数据激活(Web接口用)
	 */
	@Override
	public Object dataAuthActive(String product_id, String device_no,
			String region_ids, String data_versions, String soft_version,
			String encryption) throws Exception {
		logger.info("Service ==> dataAuthActive");

		JSONObject json = new JSONObject();
		String[] region_id = region_ids.split(",");
		String[] data_version = data_versions.split(",");

		json.put("respCode", Constants.RESPCODE_SUCCESS);
		List<JSONObject> authInfo = new ArrayList<>();
		String data_vers = "";
		// 取得数据版本号
		for (int i = 0; i < data_version.length; i++) {

			NdsTopDataVer dataVerBean = new NdsTopDataVer();
			dataVerBean.setProduct_id(product_id);
			dataVerBean.setDevice_no(device_no);
			dataVerBean.setRegion_code(region_id[i]);

			// 查询最高数据版本号
			List<NdsTopDataVer> versionList = stdAuthDao
					.getDataVersion(dataVerBean);

			if (versionList.size() > 0) {
				data_vers += versionList.get(0).getData_ver() + ",";
			} else {
				// 验证失败
				json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
				return json;
			}
		}
		data_vers = data_vers.substring(0, data_vers.length() - 1);

		// //////////////////////NDS数据升级系统验证//////////////////////////////
		DataUpgradeSysConnector dataUpdConnector = new DataUpgradeSysConnector(
				ConfigListener.instance().getProduceSysConfig()
						.getUrlNDSDataVersion());
		JSONObject jsonObj = dataUpdConnector.getNDSDataVersion(data_versions,
				data_vers);
		logger.info("jsonObj ==> " + jsonObj.toString());
		// ////////////////////////////////////////////////////
		JSONArray flag = null;
		if (jsonObj.has("respCode") && jsonObj.has("respJudge")) {
			if (jsonObj.getInt("respCode") == Constants.RESPCODE_SUCCESS) {
				flag = jsonObj.getJSONArray("respJudge");
				if (flag.size() != data_version.length) {
					json.put("respCode", Constants.RESPCODE_FAILURE);
					return json;
				}
			} else {
				json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
				return json;
			}
		} else {
			json.put("respCode", Constants.RESPCODE_FAILURE);
			return json;
		}

		ActiveCodeProducer producer = actCodeProducerService.generateProducer(
				product_id, soft_version);
		for (int i = 0; i < region_id.length; i++) {
			// ///////////////////////调用加密库生成激活码///////////////////////
			String actCode = "xxx";
			JSONObject obj = producer.pruduceActivationCode(device_no,
					product_id, data_version[i], region_id[i],
					producer.getCurrentDate(), producer.getActWay());
			actCode = obj.getString("actCodeStr");
			// ///////////////////////调用加密库生成激活码///////////////////////

			NdsTopDataVer dataVerBean = new NdsTopDataVer();
			dataVerBean.setProduct_id(product_id);
			dataVerBean.setDevice_no(device_no);
			dataVerBean.setRegion_code(region_id[i]);

            // 更新高版本
            if ("1".equals(flag.get(i).toString())) {

                NdsDataServiceAuth authBean = new NdsDataServiceAuth();
                authBean.setDevice_no(device_no);
                authBean.setProduct_id(product_id);
                authBean.setRegion_code(region_id[i]);
                List<NdsDataServiceAuth> list = stdAuthDao.getDataAuthAll(authBean);

                if (list.size() > 0) {

                    // 鉴权表次数减1
                    logger.info("info ：nums - 1");
                    if (list.get(0).getNums() != -1) {
                        list.get(0).setNums(list.get(0).getNums() - 1);
                        stdAuthDao.updateNums(list.get(0));
                    }

                    // 保存高版本号(不考虑组合商品概念)
                    logger.info("info ：update high dataVersion");
                    dataVerBean.setData_ver(data_version[i]);
                    stdAuthDao.updateNdsDataVer(dataVerBean);

                } else {
                    // 验证失败
                    json.put("respCode", Constants.RESPCODE_NOBINDDEVICE);
                    return json;
                }
            }

			NdsDataActiveLog logBean = new NdsDataActiveLog();
			RandomGUID g_id = new RandomGUID(true);
			String id = g_id.toString();
			logBean.setId(id);
			logBean.setProduct_id(product_id);
			logBean.setDevice_no(device_no);
			logBean.setSoft_ver(soft_version);
			logBean.setData_ver(data_version[i]);
			logBean.setRegion_code(region_id[i]);
			logBean.setActive_code(actCode);
			logBean.setActive_type("2");// 激活类型（1：新装；2：续费）
			logBean.setActive_source("1");// 激活途径(0：生产系统，1：美行TSP车机商城，2：美行商城，3：马自达商城，4：其他)
			stdAuthDao.insertNdsDataActiveLog(logBean);

			JSONObject authInfoJson = new JSONObject();
			authInfoJson.put("regionId", Integer.valueOf(region_id[i]));
			authInfoJson.put("dataVersion", data_version[i]);
			authInfoJson.put("actCode", actCode);// 激活码
			authInfo.add(authInfoJson);

		}

		json.put("actInfo", authInfo);
		return json;
	}
}

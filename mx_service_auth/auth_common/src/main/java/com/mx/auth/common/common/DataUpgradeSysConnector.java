package com.mx.auth.common.common;

import net.sf.json.JSONObject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.HashMap;
import java.util.Map;

public class DataUpgradeSysConnector {
    private static final Logger logger = LogManager.getLogger(DataUpgradeSysConnector.class);

    private String url;

    public DataUpgradeSysConnector(String url) {
        this.setUrl(url);
    }

    public JSONObject getNDSDataVersion(String curr_ver, String dest_ver) throws Exception {
        logger.info("getNDSDataVersion");
        logger.debug("curr_ver=" + curr_ver);
        logger.debug("dest_ver=" + dest_ver);

        Map<String, String> mvps = new HashMap<>();
        mvps.put("curr_ver", curr_ver);
        mvps.put("dest_ver", dest_ver);

        String contents;

        contents = HttpSenderManager.instance().doGet(this.getUrl(), mvps);
        logger.debug("response=" + contents);
        JSONObject jsonObj = JSONObject.fromObject(contents);
        return jsonObj;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }


    public JSONObject getUrlWeixinOrderQuery(String product_id, String order_id) throws Exception {
        logger.debug("order_id=" + order_id);

        Map<String, String> mvps = new HashMap<>();
        mvps.put("product_id", product_id);
        mvps.put("order_id", order_id);

        String contents;

        contents = HttpSenderManager.instance().doGet(this.getUrl(), mvps);
        logger.debug("response=" + contents);
        JSONObject jsonObj = JSONObject.fromObject(contents);
        return jsonObj;
    }

    public JSONObject getUrlAlipayOrderQuery(String product_id, String order_id) throws Exception {

        Map<String, String> mvps = new HashMap<>();
        mvps.put("product_id", product_id);
        mvps.put("order_id", order_id);

        String contents;

        contents = HttpSenderManager.instance().doGet(this.getUrl(), mvps);
        logger.debug("response=" + contents);
        JSONObject jsonObj = JSONObject.fromObject(contents);
        return jsonObj;
    }
}

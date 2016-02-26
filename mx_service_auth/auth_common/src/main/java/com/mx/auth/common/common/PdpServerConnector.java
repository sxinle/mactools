package com.mx.auth.common.common;

import com.mx.ngtp.util.UtilCommon;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.HashMap;
import java.util.Map;

public class PdpServerConnector {
    private static final Logger logger = LogManager.getLogger(PdpServerConnector.class);
    
    private PdpServerConnector() {
    }

    private static class PdpServerConnectorHolder {
        private static PdpServerConnector instance = new PdpServerConnector();
    }

    public static PdpServerConnector instance() {
        return PdpServerConnectorHolder.instance;
    }

    public void clearAuthCache(String productId, String deviceNo) throws Exception {
        String url = ConfigListener.instance().getPdpServerConfig().getClearAuthCacheUrl();
        Map<String, String> mvps = new HashMap<>();
        mvps.put("auth_key", UtilCommon.makeAuthKey(productId, deviceNo));
        String ret = HttpSenderManager.instance().doGet(url, mvps);
        if (!"SUCCESS".equals(ret)) {
            logger.error(ret);
        }
    }
    
    public void clearCustomerAuthCache(String productId) throws Exception {
        String url = ConfigListener.instance().getPdpServerConfig().getClearCustomerAuthCacheUrl();
        Map<String, String> mvps = new HashMap<>();
        mvps.put("customer_key", productId);
        String ret = HttpSenderManager.instance().doGet(url, mvps);
        if (!"SUCCESS".equals(ret)) {
            logger.error(ret);
        }
    }
}

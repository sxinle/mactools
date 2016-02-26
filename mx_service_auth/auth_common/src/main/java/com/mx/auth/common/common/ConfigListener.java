package com.mx.auth.common.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.mx.server.common.config.ConfigLoader;

/**
 * 配置监听器,用于读取properties类型的配置文件
 * 
 * @author Chenzy
 */
public class ConfigListener {
    private static final Logger logger = LogManager.getLogger(ConfigListener.class.getName());

    private ProduceSysConfig produceSysConfig = new ProduceSysConfig();
    private PdpServerConfig pdpServerConfig = new PdpServerConfig();

    private ConfigListener() {
        InputStream is = ConfigListener.class.getResourceAsStream("/common.properties");
        Properties properties = new Properties();
        try {
            properties.load(is);
            String regionid = properties.get("regionid").toString();
            String ndsDataVersion = properties.get("url.NDSDataVersion").toString();
            String urlPdpServer = ConfigLoader.getInstance().getProperty("pdpserver.url").toString();
            String methodClearAuthCache = properties.getProperty("pdpserver.method.clearAuthCache").toString();
            String methodClearCustomerAuthCache = properties.getProperty("pdpserver.method.clearCustomerAuthCache").toString();
            String ndsHost = ConfigLoader.getInstance().getProperty("mx_service_auth.nds_data_version");
            String proxyOnoff = ConfigLoader.getInstance().getProperty("mx_service_auth.proxy.onOff");
            logger.debug("regionid=" + regionid);
            logger.debug("ndsDataVersion=" + ndsDataVersion);
            logger.debug("urlPdpServer=" + urlPdpServer);
            logger.debug("methodClearAuthCache=" + methodClearAuthCache);
            logger.debug("methodClearCustomerAuthCache=" + methodClearCustomerAuthCache);
            logger.debug("ndsHost=" + ndsHost);
            logger.debug("proxyOnoff=" + proxyOnoff);

            if (!StringUtils.isEmpty(ndsHost) && !ndsHost.endsWith("/")) {
                ndsHost += "/";
            }
            // 更新生产系统配置
            produceSysConfig.setRegionidsStr(regionid);
            produceSysConfig.setUrlNDSDataVersion(ndsHost+ndsDataVersion);
            produceSysConfig.setOnOff(Boolean.parseBoolean(proxyOnoff));
            // 更新PDP Server配置
            pdpServerConfig.setClearAuthCacheUrl(urlPdpServer + methodClearAuthCache);
            pdpServerConfig.setClearCustomerAuthCacheUrl(urlPdpServer + methodClearCustomerAuthCache);
        } catch (IOException e) {
            logger.error(e);
        } finally {
            try {
                is.close();
            } catch (IOException e) {
                logger.error(e);
            }
        }
    }

    private static class ConfigListenerHolder {
        private static ConfigListener instance = new ConfigListener();
    }

    public static ConfigListener instance() {
        return ConfigListenerHolder.instance;
    }

    public ProduceSysConfig getProduceSysConfig() {
        return produceSysConfig;
    }

    public PdpServerConfig getPdpServerConfig() {
        return pdpServerConfig;
    }
}

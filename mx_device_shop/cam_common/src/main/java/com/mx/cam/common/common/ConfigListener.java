package com.mx.cam.common.common;

import com.mx.server.common.config.ConfigLoader;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 配置监听器,用于读取properties类型的配置文件
 * 
 * @author Chenzy
 * 
 */
public class ConfigListener {
	private static Log logger = LogFactory.getLog(ConfigListener.class);

	static private ProduceSysConfig produceSysConfig = null;

	public static ProduceSysConfig getProduceSysConfig() {
		if (produceSysConfig == null) {
			produceSysConfig = new ProduceSysConfig();
			InputStream is = ConfigListener.class.getResourceAsStream("/common.properties");
			Properties properties = new Properties();
			try {
				properties.load(is);
//				String shop_host = ConfigLoader.getProperty("mx_device_shop.product_list");
//				if(!shop_host.endsWith("/")){
//					shop_host = shop_host + "/";
//				}
//				produceSysConfig.setUrlProductList(shop_host + properties.get("url.productList").toString());
				produceSysConfig.setPassword(properties.get("user.password").toString());
				produceSysConfig.setOnOff(Boolean.parseBoolean(ConfigLoader.getProperty("mx_device_shop.proxy.onOff").toString()));
				
				//MQ 消息队列使用参数
				produceSysConfig.setAmqpAddr(ConfigLoader.getProperty("mx_device_shop.amqpAddr").toString());
				produceSysConfig.setAmqpPort(Integer.parseInt(ConfigLoader.getProperty("mx_device_shop.amqpPort")));
				produceSysConfig.setAmqpUser(ConfigLoader.getProperty("mx_device_shop.amqpUser").toString());
				produceSysConfig.setAmqpPwd(ConfigLoader.getProperty("mx_device_shop.amqpPwd").toString());
				produceSysConfig.setQueueName(ConfigLoader.getProperty("mx_device_shop.queueName").toString());
				produceSysConfig.setAmqpExchange(ConfigLoader.getProperty("mx_device_shop.amqpExchange").toString());

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
		return produceSysConfig;
	}

	public static void setProduceSysConfig(ProduceSysConfig produceSysConfig) {
		ConfigListener.produceSysConfig = produceSysConfig;
	}

}

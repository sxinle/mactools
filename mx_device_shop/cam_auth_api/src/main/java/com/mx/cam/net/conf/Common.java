package com.mx.cam.net.conf;

import org.aeonbits.owner.Config;
import org.aeonbits.owner.ConfigFactory;
import org.aeonbits.owner.Reloadable;

import java.util.concurrent.TimeUnit;

/**
 * Created by hsong on 16-1-6.
 */
@Config.HotReload(value = 30, unit = TimeUnit.SECONDS)
@Config.Sources({ "classpath:/forward/common.properties" })
public interface Common extends Config, Reloadable {

	Common CGI = ConfigFactory.create(Common.class);

	int timeout();

	String getProduct();

	String updateProduct();

    String getProductSeries();

    String getEncryption();

	String updateEncryption();

	String getDeviceInfo();

	String updateDeviceUserInfo();

	String getNdsDataActiveLog();

	String getNdsTopDataVer();

	String getNdsDataServiceAuth();

	String getAuthOrder();

	String getNdsDataSellActiveAuth();

	String getRegionsMinDataVer();

	String getPrefixInfo();
	
	String getTsp();
	
	String getTspAuth();
}

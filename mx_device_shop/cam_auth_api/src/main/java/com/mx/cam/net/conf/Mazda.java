package com.mx.cam.net.conf;

import org.aeonbits.owner.Config;
import org.aeonbits.owner.ConfigFactory;
import org.aeonbits.owner.Reloadable;

import java.util.concurrent.TimeUnit;

/**
 * Created by hsong on 16-1-6.
 */
@Config.HotReload(value = 30, unit = TimeUnit.SECONDS)
@Config.Sources({"classpath:/forward/mazda.properties"})
public interface Mazda extends Config, Reloadable {

    Mazda CGI = ConfigFactory.create(Mazda.class);

    int timeout();

    String checkHasActive();

    String saveActivate();

    String tspRenew();

    String getTspAuth();

    String upgradeCheckDeviceNo();

    String saveUpgradeExport();

    String retrieveActCode();
}


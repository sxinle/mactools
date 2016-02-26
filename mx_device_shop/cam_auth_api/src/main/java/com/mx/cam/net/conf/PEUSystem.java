package com.mx.cam.net.conf;

import org.aeonbits.owner.Config;
import org.aeonbits.owner.ConfigFactory;
import org.aeonbits.owner.Reloadable;

import java.util.concurrent.TimeUnit;

/**
 * Created by hsong on 16-1-6.
 */
@Config.HotReload(value = 30, unit = TimeUnit.SECONDS)
@Config.Sources({"classpath:/forward/PEUSystem.properties"})
public interface PEUSystem extends Config, Reloadable {

    PEUSystem CGI = ConfigFactory.create(PEUSystem.class);

    int timeout();

    String getCardPay();

    String getOrderState();

}


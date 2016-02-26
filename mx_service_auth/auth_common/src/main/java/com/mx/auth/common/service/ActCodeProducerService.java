package com.mx.auth.common.service;

import net.sf.json.JSONObject;

import com.mx.auth.common.common.ActiveCodeProducer;
import com.mx.auth.common.common.exception.LinkLibraryException;

public interface ActCodeProducerService {

    ActiveCodeProducer generateProducer(String productId, String softVer) throws LinkLibraryException;

    JSONObject doActivate(String deviceNo, String productId, String softVer, String dataVer, String areaCode) throws Exception;
}

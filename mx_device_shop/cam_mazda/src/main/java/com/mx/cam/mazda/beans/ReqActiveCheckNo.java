package com.mx.cam.mazda.beans;

import com.mx.cam.common.common.base.ReqBase;
import org.apache.commons.lang3.StringUtils;

/**
 * Created by hsong on 16-1-8.
 */
public class ReqActiveCheckNo extends ReqBase {

    @Override
    public boolean validate() {
        return StringUtils.isNotEmpty (product_id) && (StringUtils.isNotEmpty(device_no) || StringUtils.isNotEmpty(vin));
    }

    private String device_no;
    private String vin;
    private String product_id;

    public String getDevice_no() {
        return device_no;
    }

    public void setDevice_no(String device_no) {
        this.device_no = device_no;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }
}

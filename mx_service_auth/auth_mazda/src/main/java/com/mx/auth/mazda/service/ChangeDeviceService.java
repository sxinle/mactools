package com.mx.auth.mazda.service;


public interface ChangeDeviceService {

    // 更换导航机
    Object changeDevice(String product_id, String vin, String old_device_no, String new_device_no, String handlers) throws Exception;

    // 更换导航机
    Object getDeviceNoByCarNo(String product_id, String vin) throws Exception;
}

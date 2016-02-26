package com.mx.auth.common.service;

public interface AuthService {

    // 获取数据权限列表(Web接口用)
    Object getDataAuth(String product_id, String device_no, String region_ids, String encryption) throws Exception;

    // 数据激活(Web接口用)
    Object dataAuthActive(String product_id, String device_no, String region_ids, String data_versions, String soft_version, String encryption) throws Exception;

}

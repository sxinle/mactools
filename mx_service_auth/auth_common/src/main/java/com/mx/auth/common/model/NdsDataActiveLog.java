package com.mx.auth.common.model;

import com.mx.auth.common.common.SearchPageUtil;

/**
 * 服务鉴权数据激活log表实体类
 *
 * @author zhengy
 */
public class NdsDataActiveLog extends SearchPageUtil {
    private static final long serialVersionUID = 1L;

    private String id;                // ID
    private String product_id;        // 产品系列id(加密模型号)
    private String device_no;
    private String soft_ver;          // 软件版本
    private String data_ver;          // 数据版本
    private String region_code;       // 区域code
    private String active_time;       // 激活时间
    private String active_code;       // 激活码
    private String device_serial_num; // 车机uuid
    private String active_type;       // 激活类型（1：新装； 2数据升级 ;3：升级;）
    private String active_source;     // 数据来源（0：生产系统，2：网站，3：PC工具，4：其他）


    // 激活码找回用(DeviceInfo属性)
    private String vin;
    private String user_name;
    private String mobile_phone;

    @Override
    public String toString() {
        return "NdsDataActiveLog{" +
                "id='" + id + '\'' +
                ", product_id='" + product_id + '\'' +
                ", device_no='" + device_no + '\'' +
                ", soft_ver='" + soft_ver + '\'' +
                ", data_ver='" + data_ver + '\'' +
                ", region_code='" + region_code + '\'' +
                ", active_time='" + active_time + '\'' +
                ", active_code='" + active_code + '\'' +
                ", device_serial_num='" + device_serial_num + '\'' +
                ", active_type='" + active_type + '\'' +
                ", active_source='" + active_source + '\'' +
                '}';
    }

    public NdsDataActiveLog() {
    }

    public NdsDataActiveLog(String id, String product_id, String device_no, String soft_ver, String data_ver, String region_code, String active_time, String active_code, String device_serial_num, String active_type, String active_source) {
        this.id = id;
        this.product_id = product_id;
        this.device_no = device_no;
        this.soft_ver = soft_ver;
        this.data_ver = data_ver;
        this.region_code = region_code;
        this.active_time = active_time;
        this.active_code = active_code;
        this.device_serial_num = device_serial_num;
        this.active_type = active_type;
        this.active_source = active_source;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getSoft_ver() {
        return soft_ver;
    }

    public void setSoft_ver(String soft_ver) {
        this.soft_ver = soft_ver;
    }

    public String getData_ver() {
        return data_ver;
    }

    public void setData_ver(String data_ver) {
        this.data_ver = data_ver;
    }

    public String getRegion_code() {
        return region_code;
    }

    public void setRegion_code(String region_code) {
        this.region_code = region_code;
    }

    public String getDevice_serial_num() {
        return device_serial_num;
    }

    public void setDevice_serial_num(String device_serial_num) {
        this.device_serial_num = device_serial_num;
    }

    public String getActive_type() {
        return active_type;
    }

    public void setActive_type(String active_type) {
        this.active_type = active_type;
    }

    public String getDevice_no() {
        return device_no;
    }

    public void setDevice_no(String device_no) {
        this.device_no = device_no;
    }

    public String getActive_time() {
        return active_time;
    }

    public void setActive_time(String active_time) {
        this.active_time = active_time;
    }

    public String getActive_code() {
        return active_code;
    }

    public void setActive_code(String active_code) {
        this.active_code = active_code;
    }

    public String getActive_source() {
        return active_source;
    }

    public void setActive_source(String active_source) {
        this.active_source = active_source;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getMobile_phone() {
        return mobile_phone;
    }

    public void setMobile_phone(String mobile_phone) {
        this.mobile_phone = mobile_phone;
    }
    
}

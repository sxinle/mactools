package com.mx.cam.mazda.model;


import com.mx.cam.common.common.SearchPageUtil;

public class Activate extends SearchPageUtil {
    private static final long serialVersionUID = 1L;
    private String product_id;
    private String device_no;
    private String vin;
    private String soft_ver;
    private String data_version;

    private String user_name;
    private String card_no;
    private String mobile_phone;
    private String fixed_phone;
    private String gender;
    private String address;
    private String mail;
    private String soft_ver_id;
    private String data_version_id;
    private String creat_time;

    private String region_code;// 转发参数,非实体属性

    @Override
    public String[] getNotRequiredProps() {
        return new String[]{"card_no", "fixed_phone", "gender", "address", "mail", "creat_time"};
    }

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

    public String getData_version() {
        return data_version;
    }

    public void setData_version(String data_version) {
        this.data_version = data_version;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getCard_no() {
        return card_no;
    }

    public void setCard_no(String card_no) {
        this.card_no = card_no;
    }

    public String getMobile_phone() {
        return mobile_phone;
    }

    public void setMobile_phone(String mobile_phone) {
        this.mobile_phone = mobile_phone;
    }

    public String getFixed_phone() {
        return fixed_phone;
    }

    public void setFixed_phone(String fixed_phone) {
        this.fixed_phone = fixed_phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getSoft_ver_id() {
        return soft_ver_id;
    }

    public void setSoft_ver_id(String soft_ver_id) {
        this.soft_ver_id = soft_ver_id;
    }

    public String getData_version_id() {
        return data_version_id;
    }

    public void setData_version_id(String data_version_id) {
        this.data_version_id = data_version_id;
    }

    public String getCreat_time() {
        return creat_time;
    }

    public void setCreat_time(String creat_time) {
        this.creat_time = creat_time;
    }

    public String getSoft_ver() {
        return soft_ver;
    }

    public void setSoft_ver(String soft_ver) {
        this.soft_ver = soft_ver;
    }

    public String getRegion_code() {
        return region_code;
    }

    public void setRegion_code(String region_code) {
        this.region_code = region_code;
    }
}

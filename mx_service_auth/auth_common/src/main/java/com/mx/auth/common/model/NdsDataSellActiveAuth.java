package com.mx.auth.common.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.mx.auth.common.common.SearchPageUtil;

/**
 * Created by hsong on 16-1-5.
 */
public class NdsDataSellActiveAuth extends SearchPageUtil{
	
	private static final long serialVersionUID = 1L;

    private String sell_auth_id;
    private String auth_order_id;
    private String business_mode;
    private String nums;
    private String product_id;
    private String free_upg_duration;
    private String free_upg_times;
    private String region_code;
    private String data_ver;
    private String soft_ver;
    private String auth_rule;

    /* 临时属性，不对应表字段 */
    @JsonIgnore
    private String createTime;

    public NdsDataSellActiveAuth() {
    }

    public NdsDataSellActiveAuth(String sell_auth_id, String auth_order_id, String business_mode, String nums, String product_id, String free_upg_duration, String free_upg_times, String region_code, String data_ver, String soft_ver, String auth_rule) {
        this.sell_auth_id = sell_auth_id;
        this.auth_order_id = auth_order_id;
        this.business_mode = business_mode;
        this.nums = nums;
        this.product_id = product_id;
        this.free_upg_duration = free_upg_duration;
        this.free_upg_times = free_upg_times;
        this.region_code = region_code;
        this.data_ver = data_ver;
        this.soft_ver = soft_ver;
        this.auth_rule = auth_rule;
    }

    public String getSell_auth_id() {
        return sell_auth_id;
    }

    public void setSell_auth_id(String sell_auth_id) {
        this.sell_auth_id = sell_auth_id;
    }

    public String getAuth_order_id() {
        return auth_order_id;
    }

    public void setAuth_order_id(String auth_order_id) {
        this.auth_order_id = auth_order_id;
    }

    public String getBusiness_mode() {
        return business_mode;
    }

    public void setBusiness_mode(String business_mode) {
        this.business_mode = business_mode;
    }

    public String getNums() {
        return nums;
    }

    public void setNums(String nums) {
        this.nums = nums;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getFree_upg_duration() {
        return free_upg_duration;
    }

    public void setFree_upg_duration(String free_upg_duration) {
        this.free_upg_duration = free_upg_duration;
    }

    public String getFree_upg_times() {
        return free_upg_times;
    }

    public void setFree_upg_times(String free_upg_times) {
        this.free_upg_times = free_upg_times;
    }

    public String getRegion_code() {
        return region_code;
    }

    public void setRegion_code(String region_code) {
        this.region_code = region_code;
    }

    public String getData_ver() {
        return data_ver;
    }

    public void setData_ver(String data_ver) {
        this.data_ver = data_ver;
    }

    public String getSoft_ver() {
        return soft_ver;
    }

    public void setSoft_ver(String soft_ver) {
        this.soft_ver = soft_ver;
    }

    public String getAuth_rule() {
        return auth_rule;
    }

    public void setAuth_rule(String auth_rule) {
        this.auth_rule = auth_rule;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}

package com.mx.auth.common.model;

import com.mx.auth.common.common.SearchPageUtil;

/**
 * 数据鉴权数据版本表实体类
 *
 * @author zhengy
 */
public class NdsTopDataVer extends SearchPageUtil {
    private static final long serialVersionUID = 1L;

    private String device_no;   // 车机UUID
    private String product_id;  // 产品系列id(加密模型号)
    private String region_code; // 区域ID
    private String data_ver;    // 最高数据版本号

    private String soft_ver;    // 激活码需要softVer参数,字段当VO用了

    @Override
    public String toString() {
        return "NdsTopDataVer{" +
                "device_no='" + device_no + '\'' +
                ", product_id='" + product_id + '\'' +
                ", region_code='" + region_code + '\'' +
                ", data_ver='" + data_ver + '\'' +
                ", soft_ver='" + soft_ver + '\'' +
                '}';
    }

    public NdsTopDataVer() {

    }

    @Override
    public String[] getNotRequiredProps() {
        return new String[]{"region_code"};
    }

    public NdsTopDataVer(String device_no, String product_id, String region_code, String data_ver) {
        this.device_no = device_no;
        this.product_id = product_id;
        this.region_code = region_code;
        this.data_ver = data_ver;
    }

    public String getDevice_no() {
        return device_no;
    }

    public void setDevice_no(String device_no) {
        this.device_no = device_no;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
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

    public String getSoft_ver() {
        return soft_ver;
    }

    public void setSoft_ver(String soft_ver) {
        this.soft_ver = soft_ver;
    }
}

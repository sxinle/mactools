package com.mx.auth.common.model;

import com.mx.auth.common.common.SearchPageUtil;

import java.util.Arrays;

/**
 * 服务鉴权实体类
 *
 * @author zhengy mx_service_auth.te_nds_data_service_auth
 */
public class NdsDataServiceAuth extends SearchPageUtil {

	private static final long serialVersionUID = 1L;

    private String   auth_id;       // 权限ID
    private String   product_id;    // 产品系列id(加密模型号)
    private String   device_no;     // 车机UUID
    private String   auth_order_id; // 鉴权系统订单id
    private String   region_code;   // 区域ID
    private String   start_time;    // 开始时间
    private String   end_time;      // 结束时间
    private Integer  init_nums;     // 初始次数
    private Integer  nums;          // 剩余次数
    private String   years;         // 年限
    private String   data_ver;      // 数据版本
    private String   auth_type;     // 权限类型（1:免费权限 2:收费权限）
    private String   auth_rule;     // 限激活类型(1：按时间段，2：按次数，3：按版本，4：按时间+次数)
    private String   business_mode; // 业务模型(0：产线激活，1：销售激活（有号段），2：销售激活（无号段）3.购买)
    private String   device_type;   // 设备类型(1：车载，2：手持，3：DR芯片)
    private String[] region_ids;    // 区域code数组

    @Override
    public String toString() {
        return "NdsDataServiceAuth{" +
                "auth_id='" + auth_id + '\'' +
                ", product_id='" + product_id + '\'' +
                ", device_no='" + device_no + '\'' +
                ", auth_order_id='" + auth_order_id + '\'' +
                ", region_code='" + region_code + '\'' +
                ", start_time='" + start_time + '\'' +
                ", end_time='" + end_time + '\'' +
                ", init_nums=" + init_nums +
                ", nums=" + nums +
                ", years='" + years + '\'' +
                ", data_ver='" + data_ver + '\'' +
                ", auth_type='" + auth_type + '\'' +
                ", auth_rule='" + auth_rule + '\'' +
                ", business_mode='" + business_mode + '\'' +
                ", device_type='" + device_type + '\'' +
                ", region_ids=" + Arrays.toString(region_ids) +
                '}';
    }

    public NdsDataServiceAuth(String auth_id, String product_id, String device_no,
                              String auth_order_id, String region_code, String start_time,
                              String end_time, Integer init_nums, Integer nums, String years,
                              String data_ver, String auth_type, String auth_rule,
                              String business_mode) {
        this.auth_id = auth_id;
		this.product_id = product_id;
		this.device_no = device_no;
		this.auth_order_id = auth_order_id;
		this.region_code = region_code;
		this.start_time = start_time;
		this.end_time = end_time;
		this.init_nums = init_nums;
		this.nums = nums;
		this.years = years;
		this.data_ver = data_ver;
		this.auth_type = auth_type;
		this.auth_rule = auth_rule;
		this.business_mode = business_mode;
	}

	public NdsDataServiceAuth() {

	}

	public String getAuth_id() {
		return auth_id;
	}

	public void setAuth_id(String auth_id) {
		this.auth_id = auth_id;
	}

	public String getRegion_id() {
		return region_code;
	}

	public void setRegion_id(String region_id) {
		this.region_code = region_id;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getDevice_no() {
		return device_no;
	}

	public void setDevice_no(String device_no) {
		this.device_no = device_no;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public Integer getOld_nums() {
		return init_nums;
	}

	public void setOld_nums(Integer old_nums) {
		this.init_nums = old_nums;
	}

	public Integer getNums() {
		return nums;
	}

	public void setNums(Integer nums) {
		this.nums = nums;
	}

	public String getYears() {
		return years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	public String getData_ver() {
		return data_ver;
	}

	public void setData_ver(String data_ver) {
		this.data_ver = data_ver;
	}

	public String getAuth_type() {
		return auth_type;
	}

	public void setAuth_type(String auth_type) {
		this.auth_type = auth_type;
	}

	public String getAuth_order_id() {
		return auth_order_id;
	}

	public void setAuth_order_id(String auth_order_id) {
		this.auth_order_id = auth_order_id;
	}

	public String getRegion_code() {
		return region_code;
	}

	public void setRegion_code(String region_code) {
		this.region_code = region_code;
	}

	public Integer getInit_nums() {
		return init_nums;
	}

	public void setInit_nums(Integer init_nums) {
		this.init_nums = init_nums;
	}

	public String getAuth_rule() {
		return auth_rule;
	}

	public void setAuth_rule(String auth_rule) {
		this.auth_rule = auth_rule;
	}

	public String getBusiness_mode() {
		return business_mode;
	}

	public void setBusiness_mode(String business_mode) {
		this.business_mode = business_mode;
	}

	public String getDevice_type() {
		return device_type;
	}

	public void setDevice_type(String device_type) {
		this.device_type = device_type;
	}

	public String[] getRegion_ids() {
		return region_ids;
	}

	public void setRegion_ids(String[] region_ids) {
		this.region_ids = region_ids;
	}
	

}

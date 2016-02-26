package com.mx.cam.mazda.model;


import com.mx.cam.common.common.SearchPageUtil;

public class OrderItem extends SearchPageUtil {

	private static final long serialVersionUID = 1L;

	private String id;//订单详细ID
	
	private String order_id;//订单ID
	
	private String device_no;//车机号
	
	private String goods_id;//商品ID
	
	private String goods_name;//商品名称
	
	private String valid;//有效期
	
	private String nums;//次数
	
	private String region_name;//区域名称
	
	private String goods_price;//商品单价
	
	private String goods_num;//商品个数
	
	private String cash_fee;//支付金额
	
	private String product_id;//产品系列
	
	private String data_ver;//数据版本
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getDevice_no() {
		return device_no;
	}
	public void setDevice_no(String device_no) {
		this.device_no = device_no;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	public String getNums() {
		return nums;
	}
	public void setNums(String nums) {
		this.nums = nums;
	}
	public String getRegion_name() {
		return region_name;
	}
	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}
	public String getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(String goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}
	public String getCash_fee() {
		return cash_fee;
	}
	public void setCash_fee(String cash_fee) {
		this.cash_fee = cash_fee;
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
	
}

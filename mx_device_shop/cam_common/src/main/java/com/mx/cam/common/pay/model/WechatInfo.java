package com.mx.cam.common.pay.model;

import com.mx.cam.common.common.SearchPageUtil;

/**
 * 微信支付信息参数实体类
 * 
 * @author zhengy
 * 
 */
public class WechatInfo extends SearchPageUtil {

	private static final long serialVersionUID = 1L;

	private String product_id;
	private String appid = "";
	private String mch_id = "";
	private String device_info = "";
	private String attach = "";
	private String spbill_create_ip = "";
	private String goods_tag = "";
	private String notify_url = "";
	private String trade_type = "";
	private String sign_key = "";
	private String id;

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public String getMch_id() {
		return mch_id;
	}

	public void setMch_id(String mch_id) {
		this.mch_id = mch_id;
	}

	public String getDevice_info() {
		return device_info;
	}

	public void setDevice_info(String device_info) {
		this.device_info = device_info;
	}

	public String getAttach() {
		return attach;
	}

	public void setAttach(String attach) {
		this.attach = attach;
	}

	public String getSpbill_create_ip() {
		return spbill_create_ip;
	}

	public void setSpbill_create_ip(String spbill_create_ip) {
		this.spbill_create_ip = spbill_create_ip;
	}

	public String getGoods_tag() {
		return goods_tag;
	}

	public void setGoods_tag(String goods_tag) {
		this.goods_tag = goods_tag;
	}

	public String getNotify_url() {
		return notify_url;
	}

	public void setNotify_url(String notify_url) {
		this.notify_url = notify_url;
	}

	public String getTrade_type() {
		return trade_type;
	}

	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}

	public String getSign_key() {
		return sign_key;
	}

	public void setSign_key(String sign_key) {
		this.sign_key = sign_key;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}

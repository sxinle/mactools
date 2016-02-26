package com.mx.cam.common.pay.model;

import com.mx.cam.common.common.SearchPageUtil;

/**
 * 支付宝支付参数实体类
 * 
 * @author zhengy
 * 
 */
public class AlipayInfo extends SearchPageUtil {

	private static final long serialVersionUID = 1L;

	private String product_id;
	private String app_id="";
	private String alipay_public_key="";
	private String sign_charset="";
	private String charset="";
	private String sign_type="";
	private String partner="";
	private String private_key="";
	private String public_key="";
	private String alipay_gateway="";
	private String grant_type="";
	private String notify_url="";
	private String id;

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getApp_id() {
		return app_id;
	}

	public void setApp_id(String app_id) {
		this.app_id = app_id;
	}

	public String getAlipay_public_key() {
		return alipay_public_key;
	}

	public void setAlipay_public_key(String alipay_public_key) {
		this.alipay_public_key = alipay_public_key;
	}

	public String getSign_charset() {
		return sign_charset;
	}

	public void setSign_charset(String sign_charset) {
		this.sign_charset = sign_charset;
	}

	public String getCharset() {
		return charset;
	}

	public void setCharset(String charset) {
		this.charset = charset;
	}

	public String getSign_type() {
		return sign_type;
	}

	public void setSign_type(String sign_type) {
		this.sign_type = sign_type;
	}

	public String getPartner() {
		return partner;
	}

	public void setPartner(String partner) {
		this.partner = partner;
	}

	public String getPrivate_key() {
		return private_key;
	}

	public void setPrivate_key(String private_key) {
		this.private_key = private_key;
	}

	public String getPublic_key() {
		return public_key;
	}

	public void setPublic_key(String public_key) {
		this.public_key = public_key;
	}

	public String getAlipay_gateway() {
		return alipay_gateway;
	}

	public void setAlipay_gateway(String alipay_gateway) {
		this.alipay_gateway = alipay_gateway;
	}

	public String getGrant_type() {
		return grant_type;
	}

	public void setGrant_type(String grant_type) {
		this.grant_type = grant_type;
	}

	public String getNotify_url() {
		return notify_url;
	}

	public void setNotify_url(String notify_url) {
		this.notify_url = notify_url;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}

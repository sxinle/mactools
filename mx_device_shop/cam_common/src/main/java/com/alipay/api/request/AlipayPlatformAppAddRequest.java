package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayPlatformAppAddResponse;

/**
 * ALIPAY API: alipay.platform.app.add request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:02
 */
public class AlipayPlatformAppAddRequest implements AlipayRequest<AlipayPlatformAppAddResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* ISV支付宝ID
	 */
	private String alipayUserId;

	/** 
	* 应用接收回调的地址
	 */
	private String appCallbackUrl;

	/** 
	* 应用是否hosting
	 */
	private Boolean appIsHosting;

	/** 
	* 应用名称
	 */
	private String appName;

	/** 
	* 应用描述
	 */
	private String description;

	/** 
	* ISV的描述
	 */
	private String isvDescription;

	/** 
	* ISV邮箱
	 */
	private String isvEmail;

	/** 
	* ISV名称,服务商
	 */
	private String isvName;

	/** 
	* ISV所在平台账号
	 */
	private String isvNick;

	/** 
	* ISV手机号码
	 */
	private String isvPhone;

	/** 
	* 类型：1：个人；2：公司
	 */
	private Long isvType;

	/** 
	* ISV网站主页
	 */
	private String isvWebHost;

	/** 
	* LOGO链接。80*80
	 */
	private String logoUrl;

	/** 
	* 应用的客服支持Email
	 */
	private String supportEmail;

	/** 
	* 应用的客服电话号码
	 */
	private String supportPhoneNo;

	/** 
	* 应用的旺旺客服ID
	 */
	private String supportWangwangId;

	public void setAlipayUserId(String alipayUserId) {
		this.alipayUserId = alipayUserId;
	}
	public String getAlipayUserId() {
		return this.alipayUserId;
	}

	public void setAppCallbackUrl(String appCallbackUrl) {
		this.appCallbackUrl = appCallbackUrl;
	}
	public String getAppCallbackUrl() {
		return this.appCallbackUrl;
	}

	public void setAppIsHosting(Boolean appIsHosting) {
		this.appIsHosting = appIsHosting;
	}
	public Boolean getAppIsHosting() {
		return this.appIsHosting;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}
	public String getAppName() {
		return this.appName;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	public String getDescription() {
		return this.description;
	}

	public void setIsvDescription(String isvDescription) {
		this.isvDescription = isvDescription;
	}
	public String getIsvDescription() {
		return this.isvDescription;
	}

	public void setIsvEmail(String isvEmail) {
		this.isvEmail = isvEmail;
	}
	public String getIsvEmail() {
		return this.isvEmail;
	}

	public void setIsvName(String isvName) {
		this.isvName = isvName;
	}
	public String getIsvName() {
		return this.isvName;
	}

	public void setIsvNick(String isvNick) {
		this.isvNick = isvNick;
	}
	public String getIsvNick() {
		return this.isvNick;
	}

	public void setIsvPhone(String isvPhone) {
		this.isvPhone = isvPhone;
	}
	public String getIsvPhone() {
		return this.isvPhone;
	}

	public void setIsvType(Long isvType) {
		this.isvType = isvType;
	}
	public Long getIsvType() {
		return this.isvType;
	}

	public void setIsvWebHost(String isvWebHost) {
		this.isvWebHost = isvWebHost;
	}
	public String getIsvWebHost() {
		return this.isvWebHost;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}
	public String getLogoUrl() {
		return this.logoUrl;
	}

	public void setSupportEmail(String supportEmail) {
		this.supportEmail = supportEmail;
	}
	public String getSupportEmail() {
		return this.supportEmail;
	}

	public void setSupportPhoneNo(String supportPhoneNo) {
		this.supportPhoneNo = supportPhoneNo;
	}
	public String getSupportPhoneNo() {
		return this.supportPhoneNo;
	}

	public void setSupportWangwangId(String supportWangwangId) {
		this.supportWangwangId = supportWangwangId;
	}
	public String getSupportWangwangId() {
		return this.supportWangwangId;
	}
	private String terminalType;
	private String terminalInfo;	
	private String prodCode;
	private String notifyUrl;

	public String getNotifyUrl() {
		return this.notifyUrl;
	}

	public void setNotifyUrl(String notifyUrl) {
		this.notifyUrl = notifyUrl;
	}

	public String getApiVersion() {
		return this.apiVersion;
	}

	public void setApiVersion(String apiVersion) {
		this.apiVersion = apiVersion;
	}

	public void setTerminalType(String terminalType){
		this.terminalType=terminalType;
	}

    public String getTerminalType(){
    	return this.terminalType;
    }

    public void setTerminalInfo(String terminalInfo){
    	this.terminalInfo=terminalInfo;
    }

    public String getTerminalInfo(){
    	return this.terminalInfo;
    }	

	public void setProdCode(String prodCode) {
		this.prodCode=prodCode;
	}

	public String getProdCode() {
		return this.prodCode; 
	}

	public String getApiMethodName() {
		return "alipay.platform.app.add";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("alipay_user_id", this.alipayUserId);
		txtParams.put("app_callback_url", this.appCallbackUrl);
		txtParams.put("app_is_hosting", this.appIsHosting);
		txtParams.put("app_name", this.appName);
		txtParams.put("description", this.description);
		txtParams.put("isv_description", this.isvDescription);
		txtParams.put("isv_email", this.isvEmail);
		txtParams.put("isv_name", this.isvName);
		txtParams.put("isv_nick", this.isvNick);
		txtParams.put("isv_phone", this.isvPhone);
		txtParams.put("isv_type", this.isvType);
		txtParams.put("isv_web_host", this.isvWebHost);
		txtParams.put("logo_url", this.logoUrl);
		txtParams.put("support_email", this.supportEmail);
		txtParams.put("support_phone_no", this.supportPhoneNo);
		txtParams.put("support_wangwang_id", this.supportWangwangId);
		if(udfParams != null) {
			txtParams.putAll(this.udfParams);
		}
		return txtParams;
	}

	public void putOtherTextParam(String key, String value) {
		if(this.udfParams == null) {
			this.udfParams = new AlipayHashMap();
		}
		this.udfParams.put(key, value);
	}

	public Class<AlipayPlatformAppAddResponse> getResponseClass() {
		return AlipayPlatformAppAddResponse.class;
	}
}

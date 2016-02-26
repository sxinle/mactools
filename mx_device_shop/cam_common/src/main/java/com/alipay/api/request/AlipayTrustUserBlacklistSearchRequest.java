package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayTrustUserBlacklistSearchResponse;

/**
 * ALIPAY API: alipay.trust.user.blacklist.search request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:15:51
 */
public class AlipayTrustUserBlacklistSearchRequest implements AlipayRequest<AlipayTrustUserBlacklistSearchResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 是否已经取得了用户的授权许可
	 */
	private Boolean authorized;

	/** 
	* 用户完整身份证号
	 */
	private String idCard;

	/** 
	* 根据加*规则生成的加*后身份证号号
	 */
	private String maskIdCard;

	/** 
	* 根据加*规则生成的加*姓名
	 */
	private String maskName;

	/** 
	* 用户完整姓名
	 */
	private String name;

	public void setAuthorized(Boolean authorized) {
		this.authorized = authorized;
	}
	public Boolean getAuthorized() {
		return this.authorized;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getIdCard() {
		return this.idCard;
	}

	public void setMaskIdCard(String maskIdCard) {
		this.maskIdCard = maskIdCard;
	}
	public String getMaskIdCard() {
		return this.maskIdCard;
	}

	public void setMaskName(String maskName) {
		this.maskName = maskName;
	}
	public String getMaskName() {
		return this.maskName;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return this.name;
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
		return "alipay.trust.user.blacklist.search";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("authorized", this.authorized);
		txtParams.put("id_card", this.idCard);
		txtParams.put("mask_id_card", this.maskIdCard);
		txtParams.put("mask_name", this.maskName);
		txtParams.put("name", this.name);
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

	public Class<AlipayTrustUserBlacklistSearchResponse> getResponseClass() {
		return AlipayTrustUserBlacklistSearchResponse.class;
	}
}

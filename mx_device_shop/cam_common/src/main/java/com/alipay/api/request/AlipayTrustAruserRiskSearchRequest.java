package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayTrustAruserRiskSearchResponse;

/**
 * ALIPAY API: alipay.trust.aruser.risk.search request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:15:56
 */
public class AlipayTrustAruserRiskSearchRequest implements AlipayRequest<AlipayTrustAruserRiskSearchResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 是否已经取得了用户的授权许可
	 */
	private Boolean authorized;

	/** 
	* 完整身份证号
	 */
	private String idCard;

	/** 
	* 用户的完整姓名
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
		return "alipay.trust.aruser.risk.search";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("authorized", this.authorized);
		txtParams.put("id_card", this.idCard);
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

	public Class<AlipayTrustAruserRiskSearchResponse> getResponseClass() {
		return AlipayTrustAruserRiskSearchResponse.class;
	}
}

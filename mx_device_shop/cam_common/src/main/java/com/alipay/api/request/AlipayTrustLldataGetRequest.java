package com.alipay.api.request;

import java.util.Date;
import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayTrustLldataGetResponse;

/**
 * ALIPAY API: alipay.trust.lldata.get request
 * 
 * @author auto create
 * @since 1.0, 2014-10-30 23:12:18
 */
public class AlipayTrustLldataGetRequest implements AlipayRequest<AlipayTrustLldataGetResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 是否强制先从本地查询
	 */
	private Boolean local;

	/** 
	* 本地缓存数据有效时间。当所查询的数据在本地数据库中命中时，如果在有效期之内，则不再做远程查询。
	 */
	private Date qualifiedTime;

	/** 
	* 用户列表JSON串，至少1个，最多200个。其中certNo为身份证，name为姓名
	 */
	private String users;

	public void setLocal(Boolean local) {
		this.local = local;
	}
	public Boolean getLocal() {
		return this.local;
	}

	public void setQualifiedTime(Date qualifiedTime) {
		this.qualifiedTime = qualifiedTime;
	}
	public Date getQualifiedTime() {
		return this.qualifiedTime;
	}

	public void setUsers(String users) {
		this.users = users;
	}
	public String getUsers() {
		return this.users;
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
		return "alipay.trust.lldata.get";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("local", this.local);
		txtParams.put("qualified_time", this.qualifiedTime);
		txtParams.put("users", this.users);
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

	public Class<AlipayTrustLldataGetResponse> getResponseClass() {
		return AlipayTrustLldataGetResponse.class;
	}
}

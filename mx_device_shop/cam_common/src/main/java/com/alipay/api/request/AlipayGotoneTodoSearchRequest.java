package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayGotoneTodoSearchResponse;

/**
 * ALIPAY API: alipay.gotone.todo.search request
 * 
 * @author auto create
 * @since 1.0, 2015-05-28 17:56:02
 */
public class AlipayGotoneTodoSearchRequest implements AlipayRequest<AlipayGotoneTodoSearchResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 终端类型，如Android，iPhone，iPad.
	 */
	private String terminal;

	/** 
	* 要查询的支付宝账户id
	 */
	private String userId;

	public void setTerminal(String terminal) {
		this.terminal = terminal;
	}
	public String getTerminal() {
		return this.terminal;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserId() {
		return this.userId;
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
		return "alipay.gotone.todo.search";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("terminal", this.terminal);
		txtParams.put("user_id", this.userId);
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

	public Class<AlipayGotoneTodoSearchResponse> getResponseClass() {
		return AlipayGotoneTodoSearchResponse.class;
	}
}

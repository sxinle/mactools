package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayEvercallContractSignResponse;

/**
 * ALIPAY API: alipay.evercall.contract.sign request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:40
 */
public class AlipayEvercallContractSignRequest implements AlipayRequest<AlipayEvercallContractSignResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 预警阀值，单位是元。小数点保留两位，精确到分
	 */
	private String alertBalance;

	/** 
	* 签约手机号
	 */
	private String mobileNo;

	/** 
	* 充值金额，单位是元。小数点保留两位，精确到分
	 */
	private String rechargeAmount;

	/** 
	* 手机充值代扣确认
	 */
	private String rechargeConfirm;

	/** 
	* 签约渠道(SMS：短信方式 CLIENT：客户端 WAP：wap SITE：主站 OPENPLAT:开放平台 OTHER：其他)
	 */
	private String signChannel;

	/** 
	* 运营统计：taobao,alipay,telecom
	 */
	private String signFrom;

	/** 
	* 支付宝账户号
	 */
	private String userId;

	public void setAlertBalance(String alertBalance) {
		this.alertBalance = alertBalance;
	}
	public String getAlertBalance() {
		return this.alertBalance;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getMobileNo() {
		return this.mobileNo;
	}

	public void setRechargeAmount(String rechargeAmount) {
		this.rechargeAmount = rechargeAmount;
	}
	public String getRechargeAmount() {
		return this.rechargeAmount;
	}

	public void setRechargeConfirm(String rechargeConfirm) {
		this.rechargeConfirm = rechargeConfirm;
	}
	public String getRechargeConfirm() {
		return this.rechargeConfirm;
	}

	public void setSignChannel(String signChannel) {
		this.signChannel = signChannel;
	}
	public String getSignChannel() {
		return this.signChannel;
	}

	public void setSignFrom(String signFrom) {
		this.signFrom = signFrom;
	}
	public String getSignFrom() {
		return this.signFrom;
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
		return "alipay.evercall.contract.sign";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("alert_balance", this.alertBalance);
		txtParams.put("mobile_no", this.mobileNo);
		txtParams.put("recharge_amount", this.rechargeAmount);
		txtParams.put("recharge_confirm", this.rechargeConfirm);
		txtParams.put("sign_channel", this.signChannel);
		txtParams.put("sign_from", this.signFrom);
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

	public Class<AlipayEvercallContractSignResponse> getResponseClass() {
		return AlipayEvercallContractSignResponse.class;
	}
}

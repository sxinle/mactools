package com.alipay.api.request;

import java.util.Map;

import com.alipay.api.AlipayRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayTransferBankPayApplyResponse;

/**
 * ALIPAY API: alipay.transfer.bank.pay.apply request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:15:57
 */
public class AlipayTransferBankPayApplyRequest implements AlipayRequest<AlipayTransferBankPayApplyResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 支付宝账户类型对应的id。如email、手机等
	 */
	private String alipayAccountId;

	/** 
	* 支付宝账户类型
ALIPAY_LOGON_ID:支付宝账户登录名
ALIPAY_USER_ID:支付宝账户userId
	 */
	private String alipayAccountType;

	/** 
	* 金额（单位为分）
	 */
	private Long amount;

	/** 
	* 银行订单号
	 */
	private String bankOrderNo;

	/** 
	* 业务订单号
	 */
	private String bizOrderNo;

	/** 
	* 业务类型(DY：为本人充值，DO:为他人充值)
	 */
	private String bizType;

	/** 
	* 转账备注信息,暂不支持对外显示
	 */
	private String memo;

	/** 
	* 付款方卡账户类型
CP对公
PI:对私
	 */
	private String payerCardAccountType;

	/** 
	* 机构用户卡id标示，填写卡id类型对应的值。如email、手机等
	 */
	private String payerCardId;

	/** 
	* 付款方卡id标示类型
BANK_ID：银行用户uid
BANK_CARD_NO:银行卡号
	 */
	private String payerCardIdType;

	/** 
	* 付款方卡类型
DC:借记卡
CC:贷记卡
	 */
	private String payerCardType;

	/** 
	* 付款方机构编号，由支付宝定义
	 */
	private String payerInstId;

	public void setAlipayAccountId(String alipayAccountId) {
		this.alipayAccountId = alipayAccountId;
	}
	public String getAlipayAccountId() {
		return this.alipayAccountId;
	}

	public void setAlipayAccountType(String alipayAccountType) {
		this.alipayAccountType = alipayAccountType;
	}
	public String getAlipayAccountType() {
		return this.alipayAccountType;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public Long getAmount() {
		return this.amount;
	}

	public void setBankOrderNo(String bankOrderNo) {
		this.bankOrderNo = bankOrderNo;
	}
	public String getBankOrderNo() {
		return this.bankOrderNo;
	}

	public void setBizOrderNo(String bizOrderNo) {
		this.bizOrderNo = bizOrderNo;
	}
	public String getBizOrderNo() {
		return this.bizOrderNo;
	}

	public void setBizType(String bizType) {
		this.bizType = bizType;
	}
	public String getBizType() {
		return this.bizType;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getMemo() {
		return this.memo;
	}

	public void setPayerCardAccountType(String payerCardAccountType) {
		this.payerCardAccountType = payerCardAccountType;
	}
	public String getPayerCardAccountType() {
		return this.payerCardAccountType;
	}

	public void setPayerCardId(String payerCardId) {
		this.payerCardId = payerCardId;
	}
	public String getPayerCardId() {
		return this.payerCardId;
	}

	public void setPayerCardIdType(String payerCardIdType) {
		this.payerCardIdType = payerCardIdType;
	}
	public String getPayerCardIdType() {
		return this.payerCardIdType;
	}

	public void setPayerCardType(String payerCardType) {
		this.payerCardType = payerCardType;
	}
	public String getPayerCardType() {
		return this.payerCardType;
	}

	public void setPayerInstId(String payerInstId) {
		this.payerInstId = payerInstId;
	}
	public String getPayerInstId() {
		return this.payerInstId;
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
		return "alipay.transfer.bank.pay.apply";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("alipay_account_id", this.alipayAccountId);
		txtParams.put("alipay_account_type", this.alipayAccountType);
		txtParams.put("amount", this.amount);
		txtParams.put("bank_order_no", this.bankOrderNo);
		txtParams.put("biz_order_no", this.bizOrderNo);
		txtParams.put("biz_type", this.bizType);
		txtParams.put("memo", this.memo);
		txtParams.put("payer_card_account_type", this.payerCardAccountType);
		txtParams.put("payer_card_id", this.payerCardId);
		txtParams.put("payer_card_id_type", this.payerCardIdType);
		txtParams.put("payer_card_type", this.payerCardType);
		txtParams.put("payer_inst_id", this.payerInstId);
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

	public Class<AlipayTransferBankPayApplyResponse> getResponseClass() {
		return AlipayTransferBankPayApplyResponse.class;
	}
}

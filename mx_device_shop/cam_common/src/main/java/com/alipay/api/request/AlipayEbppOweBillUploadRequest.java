package com.alipay.api.request;

import java.util.HashMap;
import java.util.Map;

import com.alipay.api.FileItem;
import com.alipay.api.AlipayUploadRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayEbppOweBillUploadResponse;

/**
 * ALIPAY API: alipay.ebpp.owe.bill.upload request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:51
 */
public class AlipayEbppOweBillUploadRequest implements AlipayUploadRequest<AlipayEbppOweBillUploadResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 支付宝给每个出账机构指定了一个对应的英文短名称来唯一表示该收费单位。
	 */
	private String chargeInst;

	/** 
	* 销账机构
	 */
	private String chargeoffInst;

	/** 
	* 文件摘要，算法SHA
	 */
	private String digestOweBill;

	/** 
	* 支付宝订单类型。公共事业缴纳JF,信用卡还款HK
	 */
	private String orderType;

	/** 
	* 文件内容 
支持的文件类型：zip,rar,csv,doc,docx,xls,xlsx
	 */
	private FileItem oweBill;

	/** 
	* 子业务类型是业务类型的下一级概念，例如：WATER表示JF下面的水费，ELECTRIC表示JF下面的电费，GAS表示JF下面的燃气费。
	 */
	private String subOrderType;

	public void setChargeInst(String chargeInst) {
		this.chargeInst = chargeInst;
	}
	public String getChargeInst() {
		return this.chargeInst;
	}

	public void setChargeoffInst(String chargeoffInst) {
		this.chargeoffInst = chargeoffInst;
	}
	public String getChargeoffInst() {
		return this.chargeoffInst;
	}

	public void setDigestOweBill(String digestOweBill) {
		this.digestOweBill = digestOweBill;
	}
	public String getDigestOweBill() {
		return this.digestOweBill;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getOrderType() {
		return this.orderType;
	}

	public void setOweBill(FileItem oweBill) {
		this.oweBill = oweBill;
	}
	public FileItem getOweBill() {
		return this.oweBill;
	}

	public void setSubOrderType(String subOrderType) {
		this.subOrderType = subOrderType;
	}
	public String getSubOrderType() {
		return this.subOrderType;
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
	
	public String getProdCode() {
		return this.prodCode; 
	}
	
	public void setProdCode(String prodCode) {
		this.prodCode=prodCode;
	}
    
	public String getApiMethodName() {
		return "alipay.ebpp.owe.bill.upload";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("charge_inst", this.chargeInst);
		txtParams.put("chargeoff_inst", this.chargeoffInst);
		txtParams.put("digest_owe_bill", this.digestOweBill);
		txtParams.put("order_type", this.orderType);
		txtParams.put("sub_order_type", this.subOrderType);
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

	public Map<String, FileItem> getFileParams() {
		Map<String, FileItem> params = new HashMap<String, FileItem>();
		params.put("owe_bill", this.oweBill);
		return params;
	}

	public Class<AlipayEbppOweBillUploadResponse> getResponseClass() {
		return AlipayEbppOweBillUploadResponse.class;
	}
}

package com.alipay.api.request;

import java.util.HashMap;
import java.util.Map;

import com.alipay.api.FileItem;
import com.alipay.api.AlipayUploadRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayEbppSubscribeUploadResponse;

/**
 * ALIPAY API: alipay.ebpp.subscribe.upload request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:16:47
 */
public class AlipayEbppSubscribeUploadRequest implements AlipayUploadRequest<AlipayEbppSubscribeUploadResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 出账机构简称，例如杭州水务HZWATER
	 */
	private String chargeInst;

	/** 
	* 业务类型，例如缴费JF
	 */
	private String orderType;

	/** 
	* 子业务类型，例如电费ELECTRIC
	 */
	private String subOrderType;

	/** 
	* 回盘文件中的内容格式，例如9023|UN_SUBSCRIBE 为户号为9023，订阅状态为UN_SUBSCRIBE
	 */
	private FileItem subscribeDetail;

	public void setChargeInst(String chargeInst) {
		this.chargeInst = chargeInst;
	}
	public String getChargeInst() {
		return this.chargeInst;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getOrderType() {
		return this.orderType;
	}

	public void setSubOrderType(String subOrderType) {
		this.subOrderType = subOrderType;
	}
	public String getSubOrderType() {
		return this.subOrderType;
	}

	public void setSubscribeDetail(FileItem subscribeDetail) {
		this.subscribeDetail = subscribeDetail;
	}
	public FileItem getSubscribeDetail() {
		return this.subscribeDetail;
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
		return "alipay.ebpp.subscribe.upload";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("charge_inst", this.chargeInst);
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
		params.put("subscribe_detail", this.subscribeDetail);
		return params;
	}

	public Class<AlipayEbppSubscribeUploadResponse> getResponseClass() {
		return AlipayEbppSubscribeUploadResponse.class;
	}
}

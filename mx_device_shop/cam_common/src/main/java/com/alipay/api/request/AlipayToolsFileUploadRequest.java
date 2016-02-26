package com.alipay.api.request;

import java.util.HashMap;
import java.util.Map;

import com.alipay.api.FileItem;
import com.alipay.api.AlipayUploadRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayToolsFileUploadResponse;

/**
 * ALIPAY API: alipay.tools.file.upload request
 * 
 * @author auto create
 * @since 1.0, 2014-06-12 17:15:58
 */
public class AlipayToolsFileUploadRequest implements AlipayUploadRequest<AlipayToolsFileUploadResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 要上传的文件内容
	 */
	private FileItem file;

	public void setFile(FileItem file) {
		this.file = file;
	}
	public FileItem getFile() {
		return this.file;
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
		return "alipay.tools.file.upload";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
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
		params.put("file", this.file);
		return params;
	}

	public Class<AlipayToolsFileUploadResponse> getResponseClass() {
		return AlipayToolsFileUploadResponse.class;
	}
}

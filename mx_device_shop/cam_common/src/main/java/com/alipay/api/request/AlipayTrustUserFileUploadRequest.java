package com.alipay.api.request;

import java.util.HashMap;
import java.util.Map;

import com.alipay.api.FileItem;
import com.alipay.api.AlipayUploadRequest;
import com.alipay.api.internal.util.AlipayHashMap;
import com.alipay.api.response.AlipayTrustUserFileUploadResponse;

/**
 * ALIPAY API: alipay.trust.user.file.upload request
 * 
 * @author auto create
 * @since 1.0, 2015-02-06 13:11:57
 */
public class AlipayTrustUserFileUploadRequest implements AlipayUploadRequest<AlipayTrustUserFileUploadResponse> {

	private AlipayHashMap udfParams; // add user-defined text parameters
	private String apiVersion="1.0";

	/** 
	* 被上传的文件内容，大小不能超过5M
	 */
	private FileItem fileContent;

	/** 
	* 文件类型，可选类型为IDENTITY_CARD,DRIVING_LICENSE等，其他类型可与接口提供方联系
	 */
	private String fileType;

	public void setFileContent(FileItem fileContent) {
		this.fileContent = fileContent;
	}
	public FileItem getFileContent() {
		return this.fileContent;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileType() {
		return this.fileType;
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
		return "alipay.trust.user.file.upload";
	}

	public Map<String, String> getTextParams() {		
		AlipayHashMap txtParams = new AlipayHashMap();
		txtParams.put("file_type", this.fileType);
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
		params.put("file_content", this.fileContent);
		return params;
	}

	public Class<AlipayTrustUserFileUploadResponse> getResponseClass() {
		return AlipayTrustUserFileUploadResponse.class;
	}
}

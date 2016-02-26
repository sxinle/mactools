package com.alipay.api.response;

import com.alipay.api.internal.mapping.ApiField;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.trust.user.file.upload response.
 * 
 * @author auto create
 * @since 1.0, 2015-02-06 13:11:57
 */
public class AlipayTrustUserFileUploadResponse extends AlipayResponse {

	private static final long serialVersionUID = 8425899879447998482L;

	/** 
	 * 文件在服务器端的唯一标识
	 */
	@ApiField("file_identity")
	private String fileIdentity;

	public void setFileIdentity(String fileIdentity) {
		this.fileIdentity = fileIdentity;
	}
	public String getFileIdentity( ) {
		return this.fileIdentity;
	}

}

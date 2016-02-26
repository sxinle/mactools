package com.mx.auth.common.common;

/**
 * 读取配置文件内容实体类
 * 
 * @author xiaojian
 */
public class ProduceSysConfig {

	private boolean onOff;

	private String regionidsStr;

	private String urlNDSDataVersion;

	public String getRegionidsStr() {
		return regionidsStr;
	}

	public void setRegionidsStr(String regionidsStr) {
		this.regionidsStr = regionidsStr;
	}

	public String getUrlNDSDataVersion() {
		return urlNDSDataVersion;
	}

	public void setUrlNDSDataVersion(String urlNDSDataVersion) {
		this.urlNDSDataVersion = urlNDSDataVersion;
	}

	public boolean isOnOff() {
		return onOff;
	}

	public void setOnOff(boolean onOff) {
		this.onOff = onOff;
	}
}

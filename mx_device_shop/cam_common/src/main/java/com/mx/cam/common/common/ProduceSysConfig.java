package com.mx.cam.common.common;

/**
 * 读取配置文件内容实体类
 * 
 * @author xiaojian
 * 
 */
public class ProduceSysConfig {

	private String password;

	private boolean onOff;

	private String amqpAddr;
	private int amqpPort;
	private String amqpUser;
	private String amqpPwd;
	private String queueName;
	private String amqpExchange;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isOnOff() {
		return onOff;
	}

	public void setOnOff(boolean onOff) {
		this.onOff = onOff;
	}

	public String getAmqpAddr() {
		return amqpAddr;
	}

	public void setAmqpAddr(String amqpAddr) {
		this.amqpAddr = amqpAddr;
	}

	public int getAmqpPort() {
		return amqpPort;
	}

	public void setAmqpPort(int amqpPort) {
		this.amqpPort = amqpPort;
	}

	public String getAmqpUser() {
		return amqpUser;
	}

	public void setAmqpUser(String amqpUser) {
		this.amqpUser = amqpUser;
	}

	public String getAmqpPwd() {
		return amqpPwd;
	}

	public void setAmqpPwd(String amqpPwd) {
		this.amqpPwd = amqpPwd;
	}

	public String getQueueName() {
		return queueName;
	}

	public void setQueueName(String queueName) {
		this.queueName = queueName;
	}

	public String getAmqpExchange() {
		return amqpExchange;
	}

	public void setAmqpExchange(String amqpExchange) {
		this.amqpExchange = amqpExchange;
	}

}

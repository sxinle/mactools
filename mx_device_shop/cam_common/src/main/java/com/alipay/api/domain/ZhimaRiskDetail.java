package com.alipay.api.domain;

import com.alipay.api.AlipayObject;
import com.alipay.api.internal.mapping.ApiField;

/**
 * 芝麻信用风险名单标签详情
 *
 * @author auto create
 * @since 1.0, 2015-04-09 14:07:39
 */
public class ZhimaRiskDetail extends AlipayObject {

	private static final long serialVersionUID = 1727137776752574536L;

	/**
	 * 风险代码
	 */
	@ApiField("risk_code")
	private String riskCode;

	/**
	 * 风险类型
	 */
	@ApiField("risk_type")
	private String riskType;

	/**
	 * 当用户进行异议处理，并核查完毕之后，仍有异议时，给出声明。
	 */
	@ApiField("statement")
	private String statement;

	/**
	 * 当用户本人对该条负面记录有异议时，表示该异议处理流程的状态
	 */
	@ApiField("status")
	private String status;

	/**
	 * 名单类型
	 */
	@ApiField("type")
	private String type;

	public String getRiskCode() {
		return this.riskCode;
	}
	public void setRiskCode(String riskCode) {
		this.riskCode = riskCode;
	}

	public String getRiskType() {
		return this.riskType;
	}
	public void setRiskType(String riskType) {
		this.riskType = riskType;
	}

	public String getStatement() {
		return this.statement;
	}
	public void setStatement(String statement) {
		this.statement = statement;
	}

	public String getStatus() {
		return this.status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return this.type;
	}
	public void setType(String type) {
		this.type = type;
	}

}

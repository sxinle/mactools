package com.alipay.api.response;

import java.util.List;
import com.alipay.api.internal.mapping.ApiField;
import com.alipay.api.internal.mapping.ApiListField;
import com.alipay.api.domain.TodoRemind;

import com.alipay.api.AlipayResponse;

/**
 * ALIPAY API: alipay.gotone.todo.search response.
 * 
 * @author auto create
 * @since 1.0, 2015-05-28 17:56:02
 */
public class AlipayGotoneTodoSearchResponse extends AlipayResponse {

	private static final long serialVersionUID = 8496743972672819896L;

	/** 
	 * 返回查询到的待办事项
	 */
	@ApiListField("reminds")
	@ApiField("todo_remind")
	private List<TodoRemind> reminds;

	/** 
	 * 查询到的todo消息数量
	 */
	@ApiField("total_count")
	private String totalCount;

	public void setReminds(List<TodoRemind> reminds) {
		this.reminds = reminds;
	}
	public List<TodoRemind> getReminds( ) {
		return this.reminds;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	public String getTotalCount( ) {
		return this.totalCount;
	}

}

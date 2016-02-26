package com.mx.auth.common.model;

import java.io.Serializable;

/**
 * 更换车机参数实体类
 *
 * @author zhengy
 */
public class ChangeDevice implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;       // ID
    private String  product_id;    // 产品系列
    private String  old_device_no; // 原车机号
    private String  new_device_no; // 新车机号
    private String  handlers;      // 操作者


    public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getOld_device_no() {
        return old_device_no;
    }

    public void setOld_device_no(String old_device_no) {
        this.old_device_no = old_device_no;
    }

    public String getNew_device_no() {
        return new_device_no;
    }

    public void setNew_device_no(String new_device_no) {
        this.new_device_no = new_device_no;
    }

    public String getHandlers() {
        return handlers;
    }

    public void setHandlers(String handlers) {
        this.handlers = handlers;
    }

}

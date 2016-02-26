package com.mx.auth.common.common;

import com.mx.auth.common.common.base.ReqBaseParam;

import java.io.Serializable;

/**
 * @author xiaojian
 * @date 2015年6月16日 下午5:20:54 
 * @description 
 * 
 * 本类以及所有子类 为分页处理专用，不得用于其他查询操作。
 * 慎用！！！！！！！！！！！
 * 
 */
public class SearchPageUtil extends ReqBaseParam implements Serializable {

    private static final long serialVersionUID = 1L;
    /** page */
    private Integer page;
    /** rows */
    private Integer rows;
    private String  order;
    private String  sort;
    private Integer offset;
    private Integer total;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

}

package com.mx.auth.common.dao;


import java.util.List;

import com.mx.auth.common.model.AuthOrder;


/**
 * 鉴权订单Dao
 * 
 * @author zhengy
 * 
 */
public interface AuthOrderDao {

    List<AuthOrder> getAuthOrderManage(AuthOrder bean);
}

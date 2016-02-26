package com.mx.auth.common.dao;

import com.mx.auth.common.model.NdsDataSellActiveAuth;

import java.util.List;

/**
 * 销售激活订单管理Dao
 *
 * @author zhengy
 */
public interface NdsDataSellActiveAuthDao {

    void insert(NdsDataSellActiveAuth ndsDataSellActiveAuth);

    List<NdsDataSellActiveAuth> findByExample(NdsDataSellActiveAuth ndsDataSellActiveAuth);

    void update(NdsDataSellActiveAuth dataSellActiveAuth);
    
    List<NdsDataSellActiveAuth> getNdsDataSellActiveAuthManage(NdsDataSellActiveAuth ndsDataSellActiveAuth);

    List<NdsDataSellActiveAuth> findByProductId(String productId);
}

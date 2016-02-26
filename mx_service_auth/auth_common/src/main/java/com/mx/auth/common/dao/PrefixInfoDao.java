package com.mx.auth.common.dao;

import java.util.List;

import com.mx.auth.common.model.PrefixInfo;

/**
 * 刮刮卡类型
 * @author zhengy
 */

public interface PrefixInfoDao {

	// 查询刮刮卡类型
    List<PrefixInfo> getPrefixInfo(PrefixInfo bean);

}

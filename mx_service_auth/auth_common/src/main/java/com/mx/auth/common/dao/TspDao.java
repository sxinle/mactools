package com.mx.auth.common.dao;

import java.util.List;

import com.mx.auth.common.model.TspInfo;

public interface TspDao {

	List<TspInfo> getTsp(TspInfo bean);

}

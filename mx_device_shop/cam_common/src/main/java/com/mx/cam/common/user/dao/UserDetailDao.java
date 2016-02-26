package com.mx.cam.common.user.dao;


import com.mx.cam.common.user.model.User;

import java.util.Map;


public interface UserDetailDao {
	User selectUserByUserName(Map<String, String> um) throws Exception;
	
}

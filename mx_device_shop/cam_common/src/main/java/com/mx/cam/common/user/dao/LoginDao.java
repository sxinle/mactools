package com.mx.cam.common.user.dao;


import com.mx.cam.common.user.model.Menu;

import java.util.List;


public interface LoginDao {
	
	List<Menu> findMenusByRoleId(String[] ids);
	
	List<Menu> findAllMenus();
}

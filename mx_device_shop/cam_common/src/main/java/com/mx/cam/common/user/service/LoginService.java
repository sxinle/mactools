package com.mx.cam.common.user.service;

import java.util.List;

import com.mx.cam.common.user.model.Menu;
import com.mx.cam.common.user.model.User;


public interface LoginService {
	List<Menu> findMenus(User user);
}

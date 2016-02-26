package com.mx.cam.common.user.service.impl;

import java.util.List;
import java.util.Stack;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.user.dao.LoginDao;
import com.mx.cam.common.user.dao.UserRoleDao;
import com.mx.cam.common.user.model.Menu;
import com.mx.cam.common.user.model.Role;
import com.mx.cam.common.user.model.User;
import com.mx.cam.common.user.service.LoginService;


/**
 * @author xiaojian
 * @date 2015年6月19日 下午4:11:10 
 * @description 用户登录
 * 
 */
@Service("loginService")
@Transactional("shop")
public class LoginServiceImpl  implements LoginService {
	
	@Autowired
	private LoginDao loginDao; 
	@Autowired
	private UserRoleDao userRoleDao;
	
	@Override
	public List<Menu> findMenus(User user) {
		
		List<Menu> menus = null;
		List<Role> roleList = userRoleDao.selectUserRoles(user.getUser_id());

		boolean adminRoleFlag = false;
		String[] roles = new String[roleList.size()];
		for (int i = 0; i < roleList.size(); i++) {
			if("0".equals(roleList.get(i).getRole_id())){
				adminRoleFlag = true;
				break;
			}
			roles[i] = roleList.get(i).getRole_id();
		}
		
		if (adminRoleFlag) {
			menus = loginDao.findAllMenus();
		} else {
			menus = loginDao.findMenusByRoleId(roles);
		}
		
		
		Stack<Menu> stack = new Stack<Menu>();
		Menu root, menu;
		root = menu = new Menu();
		menu.setParentid("-1");
		menu.setId("0");
		stack.push(menu);
		while (!stack.isEmpty()) {
			Menu menuStack = stack.pop();
			for (int i = 0; i < menus.size(); i++) {
				menu = menus.get(i);
				if (menuStack.getId().equals(menu.getParentid())) {
					stack.push(menu);
					menuStack.getSubMenus().add(menu);
					menus.remove(i--);
				}
			}
		}
		return root.getSubMenus();
	}	
}

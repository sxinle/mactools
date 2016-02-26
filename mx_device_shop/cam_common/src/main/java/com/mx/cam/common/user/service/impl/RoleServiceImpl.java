package com.mx.cam.common.user.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.RandomGUID;
import com.mx.cam.common.user.dao.RoleDao;
import com.mx.cam.common.user.dao.RoleMenuDao;
import com.mx.cam.common.user.dao.UserRoleDao;
import com.mx.cam.common.user.model.Menu;
import com.mx.cam.common.user.model.Role;
import com.mx.cam.common.user.model.RoleMenu;
import com.mx.cam.common.user.service.RoleService;

/**
 * 角色管理Service
 * 
 * @author zhengy
 * 
 */
@Service("roleService")
@Transactional("shop")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;

	@Autowired
	private RoleMenuDao roleMenuDao;

	@Autowired
	private UserRoleDao userRoleDao;

	/**
	 * 查询角色列表
	 */
	@Override
	public List<Role> getRoleManage(Role bean) throws Exception {
		return roleDao.getRoleManage(bean);
	}

	/**
	 * 删除角色
	 */
	@Override
	public int deleteRoleManage(String ids) throws Exception {

		String[] idArray = ids.split(",");
		for (int i = 0; i < idArray.length; i++) {
			if(idArray[i].equals("0")){
				idArray[i] = "";
			}
		}
		// 删除角色菜单
		roleMenuDao.deleteRoleMenuByRole(idArray);
		// 删除角色
		roleDao.deleteRoleManage(idArray);
		return Constants.RESPCODE_SUCCESS;

	}

	/**
	 * 验证角色是否被用户使用
	 */
	@Override
	public List<String> checkUserRoleId(String ids) throws Exception {

		List<String> nameList = new ArrayList<String>();

		String[] idArray = ids.split(",");
		// 验证角色是否被用户使用
		List<Role> list = userRoleDao.checkUserRoleId(idArray);
		for (Role role : list) {
			nameList.add(role.getRole_name());
		}

		return nameList;
	}

	/**
	 * 验证角色名称是否重复
	 */
	@Override
	public String checkRoleName(Role bean) throws Exception {
		String str = "";
		// 验证角色名称是否重复
		int count = roleDao.checkRoleName(bean);
		if (count == 0) {
			// 不重复
			str = Constants.SUNCCESS;
		} else {
			// 重复
			str = Constants.FAILURE;
		}
		return str;
	}

	/**
	 * 保存角色
	 */
	@Override
	public int saveRoleManage(Role bean) throws Exception {
		// 添加角色
		if (bean.getRole_id() == null || "".equals(bean.getRole_id())) {
			// 取得随机角色ID
			RandomGUID rg = new RandomGUID(true);
			String id = rg.toString();
			bean.setRole_id(id);
			roleDao.saveRole(bean);
		} else {
			// 修改角色
			roleDao.updateRole(bean);
		}
		return Constants.RESPCODE_SUCCESS;
	}

	/**
	 * 取得角色的权限
	 */
	@Override
	public List<Menu> getMenuByRole(String id) throws Exception {
		// 取得角色的权限
		return roleMenuDao.getMenuByRole(id);
	}

	/**
	 * 保存角色菜单
	 */
	public int saveRoleMenu(String roleId, String menuIds) throws Exception {

		String idArray[] = { roleId };
		// 删除角色菜单
		roleMenuDao.deleteRoleMenuByRole(idArray);
		String[] menuIdList = menuIds.split(",");
		// 插入角色菜单
		for (int i = 0; i < menuIdList.length; i++) {
			RoleMenu bean = new RoleMenu();
			bean.setRole_id(roleId);
			bean.setMenu_id(menuIdList[i]);
			roleMenuDao.saveRoleMenu(bean);
		}
		return Constants.RESPCODE_SUCCESS;

	}
	
//	/**
//	 * 保存用户和角色关系
//	 * 
//	 * @param userID
//	 * @param roleIDs
//	 * @return
//	 * @throws Exception
//	 */
//	@Override
//	public String saveUserRole(String userID, String roleIDs) throws Exception {
//		String[] roleIDsArr = roleIDs.split(",");
//		userRoleDao.saveUserRole(userID, roleIDsArr);
//		return Constants.SUNCCESS;
//	}
	
}

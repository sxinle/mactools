package com.mx.cam.common.user.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.RandomGUID;
import com.mx.cam.common.user.dao.GroupDao;
import com.mx.cam.common.user.dao.GroupRoleDao;
import com.mx.cam.common.user.dao.UserGroupDao;
import com.mx.cam.common.user.model.Group;
import com.mx.cam.common.user.model.GroupRole;
import com.mx.cam.common.user.model.Menu;
import com.mx.cam.common.user.service.GroupService;

/**
 * 用户组管理Service
 * 
 * @author zhengy
 * 
 */
@Service("GroupService")
@Transactional("shop")
public class GroupServiceImpl implements GroupService {

	@Autowired
	private GroupDao groupDao;

	@Autowired
	private GroupRoleDao groupRoleDao;

	@Autowired
	private UserGroupDao userGroupDao;

	/**
	 * 查询用户组列表
	 */
	@Override
	public List<Group> getGroupManage(Group bean) throws Exception {
		// 查询用户组列表
		return groupDao.getGroupManage(bean);
	}

	/**
	 * 删除用户组
	 */
	@Override
	public int deleteGroupManage(String ids) throws Exception {

		String[] idArray = ids.split(",");
		// 删除用户组菜单
		groupRoleDao.deleteGroupRoleByGroup(idArray);
		// 删除用户组
		groupDao.deleteGroupManage(idArray);
		return Constants.RESPCODE_SUCCESS;

	}

	/**
	 * 验证用户组是否被用户使用
	 */
	@Override
	public List<String> checkUserGroupId(String ids) throws Exception {

		List<String> nameList = new ArrayList<String>();

		String[] idArray = ids.split(",");
		// 验证用户组是否被用户使用
		List<Group> list = userGroupDao.checkUserGroupId(idArray);
		for (Group group : list) {
			nameList.add(group.getGroup_name());
		}

		return nameList;
	}

	/**
	 * 验证用户组名称是否重复
	 */
	@Override
	public String checkGroupName(Group bean) throws Exception {
		String str = "";
		// 验证用户组名称是否重复
		int count = groupDao.checkGroupName(bean);
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
	 * 保存用户组
	 */
	@Override
	public int saveGroupManage(Group bean) throws Exception {
		// 添加用户组
		if (bean.getGroup_id() == null || "".equals(bean.getGroup_id())) {
			// 取得随机用户组ID
			RandomGUID rg = new RandomGUID(true);
			String id = rg.toString();
			bean.setGroup_id(id);
			groupDao.saveGroup(bean);
		} else {
			// 修改用户组
			groupDao.updateGroup(bean);
		}
		return Constants.RESPCODE_SUCCESS;
	}

	/**
	 * 取得用户组的权限
	 */
	@Override
	public List<Menu> getRoleByGroup(String id) throws Exception {
		// 取得用户组的权限
		return groupRoleDao.getRoleByGroup(id);
	}

	/**
	 * 保存用户组菜单
	 */
	@Override
	public int saveGroupRole(String groupId, String roleIds) throws Exception {
		String idArray[] = { groupId };
		// 删除用户组菜单
		groupRoleDao.deleteGroupRoleByGroup(idArray);
		String[] roleIdList = roleIds.split(",");
		// 插入用户组菜单
		for (int i = 0; i < roleIdList.length; i++) {
			GroupRole bean = new GroupRole();
			bean.setGroup_id(groupId);
			bean.setRole_id(roleIdList[i]);
			groupRoleDao.saveGroupRole(bean);
		}
		return Constants.RESPCODE_SUCCESS;

	}
}

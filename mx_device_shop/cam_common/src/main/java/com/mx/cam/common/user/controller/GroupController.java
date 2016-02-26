package com.mx.cam.common.user.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.cam.common.common.base.BaseController;
import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.MustLogin;
import com.mx.cam.common.user.model.Group;
import com.mx.cam.common.user.service.GroupService;
@Controller
@RequestMapping("/group")
@MustLogin
public class GroupController extends BaseController {
	private static Log log = LogFactory.getLog(RoleController.class);

	@Autowired
	private GroupService groupService;

	/**
	 * 取得角色管理的数据
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getGroupManage")
	public @ResponseBody Object getGroupManage(Group bean) throws Exception {
		log.info("getGroupManage");
		List<Group> rows = groupService.getGroupManage(bean);
		return respPageBody(Constants.RESPCODE_SUCCESS, rows, bean.getTotal());
	}
	
	/** 
	 * 删除用户组
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteGroupManage")
	public @ResponseBody Object deleteGroupManage(String ids) throws Exception {
		log.info("deleteGroupManage");
		List<String> list = groupService.checkUserGroupId(ids);
		if(list == null || list.size() == 0){
			return respBody(groupService.deleteGroupManage(ids),null);
		}else{
			return respBody(Constants.RESPCODE_ERR_USED, list);
		}
	}
	

	/**
	 * 保存用户组
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveGroupManage")
	public @ResponseBody Object saveGroupManage(Group bean) throws Exception {
		log.info("saveGroupManage");
		String str = groupService.checkGroupName(bean);
		if(Constants.SUNCCESS.equals(str)){
			return respBody(groupService.saveGroupManage(bean), null);
		}else{
			return respBody(Constants.RESPCODE_ERR_USED, null);
		}
	}
	
	/**
	 * 取得用户组组的角色
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getRoleByGroup")
	public @ResponseBody Object getRoleByGroup(String groupId) throws Exception {
		log.info("getRoleByGroup");
		return  respBody(Constants.RESPCODE_SUCCESS, groupService.getRoleByGroup(groupId));
	}

	/** 
	 * 取得角色管理下拉列表
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getGroupCombobox")
	public @ResponseBody Object getGroupCombobox(String buildin) throws Exception {
		log.info("getGroupCombobox");
		Group bean = new Group();
		bean.setBuildin(buildin);
		return respBody(Constants.RESPCODE_SUCCESS, groupService.getGroupManage(bean));
	}
	
	/**
	 * 保存用户组菜单
	 * @param roleId
	 * @param menuIds
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveGroupRole")
	public @ResponseBody Object saveGroupRole(String groupId, String roleIds) throws Exception {
		log.info("saveGroupRole");
		return respBody(groupService.saveGroupRole(groupId, roleIds), null);
	}
}

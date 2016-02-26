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
import com.mx.cam.common.user.model.Role;
import com.mx.cam.common.user.service.RoleService;

/**
 * 角色管理Controller
 * 
 * @author zhengy
 * 
 */
@Controller
@RequestMapping("/role")
@MustLogin
public class RoleController extends BaseController {
	private static Log log = LogFactory.getLog(RoleController.class);

	@Autowired
	private RoleService roleService;

	/**sunc
	 * 查询角色
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getRoleManage")
	public @ResponseBody Object getRoleManage(Role bean) throws Exception {
		log.info("getRoleManage");
		return respPageBody(Constants.RESPCODE_SUCCESS, roleService.getRoleManage(bean), bean.getTotal());
	}

	/** 
	 * 取得角色管理下拉列表
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getRoleCombobox")
	public @ResponseBody Object getRoleCombobox(String buildin) throws Exception {
		log.info("getRoleCombobox");
		Role bean = new Role();
		bean.setBuildin(buildin);
		return respBody(Constants.RESPCODE_SUCCESS, roleService.getRoleManage(bean));
	}

	/** sunc
	 * 删除角色
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteRoleManage")
	public @ResponseBody Object deleteRoleManage(String ids) throws Exception {
		log.info("deleteRoleManage");
		List<String> list =  roleService.checkUserRoleId(ids);
		if(list == null || list.size() == 0){
			return respBody(roleService.deleteRoleManage(ids), null);
		}else{
			return respBody(Constants.RESPCODE_ERR_USED, list);
		}
	}

	/**sunc
	 * 保存角色
	 * 
	 * @param bean
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveRoleManage")
	public @ResponseBody Object saveRoleManage(Role bean) throws Exception {
		log.info("saveRoleManage");
		String str = roleService.checkRoleName(bean);
		if(Constants.SUNCCESS.equals(str)){
			return respBody(roleService.saveRoleManage(bean), null);
		}else{
			return respBody(Constants.RESPCODE_ERR_USED, null);
		}
		
	}

	/**sunc
	 * 取得菜单管理树形数据
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getMenuByRole")
	public @ResponseBody Object getMenuByRole(String roleId) throws Exception {
		log.info("getMenuByRole");
		return  respBody(Constants.RESPCODE_SUCCESS, roleService.getMenuByRole(roleId));
	}

	/**
	 * 保存较色菜单
	 * @param roleId
	 * @param menuIds
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveRoleMenu")
	public @ResponseBody Object saveRoleMenu(String roleId, String menuIds) throws Exception {
		log.info("saveRoleMenu");
		return respBody(roleService.saveRoleMenu(roleId, menuIds), null);
	}
}
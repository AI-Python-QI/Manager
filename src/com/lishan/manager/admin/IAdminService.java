package com.lishan.manager.admin;

import java.util.List;

public interface IAdminService {

	//登录用户验证
	Admin queryAdminByusernamePwd(String username, String password);
	//查询管理员列表
	List<Admin> queryAdminlist();

}

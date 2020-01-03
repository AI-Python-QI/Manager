package com.lishan.manager.admin;




public interface IAdminService {

	//登录用户验证
	Admin queryAdminByusernamePwd(String username, String password);

}

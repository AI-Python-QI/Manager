package com.lishan.manager.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IAdminMapper {

	//登录验证用户
	Admin queryAdminByunamePwd(@Param("username")String username,@Param("password") String password);
	//管理员列表
	List<Admin> queryAdminlist();

}

package com.lishan.manager.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("aService")
public class AdminServiceImpl implements IAdminService {

	//调用mapper
	@Autowired
	private IAdminMapper adminMapper;
	
	//用户登录判断
	
	public Admin queryAdminByusernamePwd(String username, String password) {
		Admin admin = adminMapper.queryAdminByunamePwd(username,password);
		return admin;
	}

	//管理员列表
	public List<Admin> queryAdminlist() {
		List<Admin> lists = adminMapper.queryAdminlist();
		return lists;
	}

}

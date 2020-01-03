package com.lishan.manager.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.lishan.manager.admin.Admin;
import com.lishan.manager.admin.IAdminService;

@Controller
@RequestMapping(value="/admin",produces="text/html;charset=utf-8")
public class AdminDataController {
	
	//数据接口
	@Autowired
	@Qualifier("aService")
	private IAdminService adminService;
	
	
	//管理员登录验证
	@RequestMapping(value="/mlogin.action",produces="text/html;charset=utf-8")
	@ResponseBody
	public String mlogin(@RequestParam("username")String username, @RequestParam("password")String password,HttpServletRequest request)throws Exception{
		System.out.println("username"+username);
		System.out.println("pwd"+password);
		JSONObject json = new JSONObject();
		HttpSession session = request.getSession();
		//调用service查询数据库
		Admin  result = adminService.queryAdminByusernamePwd(username,password);
		System.out.println(result);
		if(result!=null) {
			session.setAttribute("user", result);
			json.put("error_code", "24");
			json.put("error_msg", "login ok");
		}else {
			json.put("error_code", "404");
			json.put("error_msg", "login error");
		}
		
		return json.toJSONString();
		
	}
	
	
}

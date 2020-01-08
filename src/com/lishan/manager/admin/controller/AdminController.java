package com.lishan.manager.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin",produces="text/html;charset=utf-8")
public class AdminController {

	//HTML页面
	@RequestMapping(value="/mlogin.html")
	public String loginPage()throws Exception{
		return "mlogin";
	}
	
	//HTML首页
	@RequestMapping(value="/mindex.html",produces="text/html;charset=utf-8")
	public String indexPage()throws Exception{
		return "mindex";
	}
	
	@RequestMapping(value="/member-list.html",produces="text/html;charset=utf-8")
	public String memberlistPage()throws  Exception {
		return "member-list";
	}
	
	@RequestMapping(value="/member-list1.html",produces="text/html;charset=utf-8")
	public String memberlistPage1()throws Exception{
		return "member-list1";
	}
	//会员删除
	@RequestMapping(value="member-del.html",produces="text/html;charset=utf-8")
	public String memberdelPage()throws Exception{
		return "member-del";
	}
	//欢迎页面
	@RequestMapping(value="/welcome.html",produces="text/html;charset=utf-8")
	public String welcome()throws Exception{
		return "welcome";
	}
	
	//订单列表
	@RequestMapping(value="/order-list.html",produces="text/html;charset=utf-8")
	public String orderlist()throws Exception{
		return "order-list";
	}
	//动态订单信息列表
	@RequestMapping(value="/order-list1.html",produces="text/html;charset=utf-8")
	public String orderlist1()throws Exception{
		return "order-list1";
	}
	
	//三级联动
	@RequestMapping(value="/city.html",produces="text/html;charset=utf-8")
	public String city()throws Exception{
		return "city";
	}
	//管理员列表
	@RequestMapping(value="/admin-list.html",produces="text/html;charset=utf-8")
	public String adminlist()throws Exception{
		return "admin-list";
	}
	
	//管理员简单列表
	@RequestMapping(value="/admin-list-simple.html",produces="text/html;charset=utf-8")
	public String adminlistsimple()throws Exception{
		return "admin-list-simple";
	}
	
	//角色管理
	@RequestMapping(value="/admin-role.html",produces="text/html;charset=utf-8")
	public String adminrole()throws Exception{
		return "admin-role";
	}
	
	//权限分类
	@RequestMapping(value="/admin-cate.html",produces="text/html;charset=utf-8")
	public String admincate()throws Exception{
		return "admin-cate";
	}
	//权限管理
	@RequestMapping(value="/admin-rule.html",produces="text/html;charset=utf-8")
	public String adminrule()throws Exception{
		return "admin-rule";
	}
	//订单发货
	@RequestMapping(value="/order-add.html",produces="text/html;charset=utf-8")
	public String orderadd()throws Exception{
		return "order-add";
	}
	
	//上架商品
	@RequestMapping(value="order-addgoods",produces="text/html;charset=utf-8")
	public String orderaddgoods()throws Exception{
		return "order-addgoods";
	}
	//添加管理员
	@RequestMapping(value="/admin-add.html",produces="text/html;charset=utf-8")
	public String adminadd()throws Exception{
		return "admin-add";
	}
	
	//添加role
	@RequestMapping(value="/role-add.html",produces="text/html;charset=utf-8")
	public String roleadd()throws Exception{
		return "role-add";
	}
}

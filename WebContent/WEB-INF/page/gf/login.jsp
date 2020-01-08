<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="${root }/admincss/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="${root }/admincss/style.css" rel='stylesheet' type='text/css' />
<link href="${root }/admincss/font-awesome.css" rel="stylesheet"> 
<script src="${root }/adminjs/jquery.min.js"></script>
<script src="${root }/adminjs/bootstrap.min.js"></script>
</head>
<body id="login" style="color: white; background:url(${root }/adminimages/bg.jpg);">
  <div class="login-logo">
    <a href="index.html"><img src="${root }/adminimages/logo.png" alt=""/></a>
  </div>
  <h2 class="form-heading">login</h2>
  <div class="app-cam">
	 <form action="${root }/admin/data/login" method="post" onsubmit="return loginCheck()">
		<input type="text" name="username" value="${cookie.userName.value}" class="text">
		<input type="password" name="password" >
		<div class="submit">
		<input type="checkbox"
		id="isRememberUsername" name="saveUserName"
		value="1" ${cookie.temp.value==1?"checkd":"" } /><font style="color: black;">记住用户名</font>
		<input type="submit" value="Login">
		
		</div>
	</form>
  </div>
   <div class="copy_layout login">
      <p>Copyright © 2015 Modern. All Rights Reserved | Design by <a href="http://h2design.taobao.com/" target="_blank">氢设计</a> </p>
   </div>
   <script type="text/javascript" src="${root }/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		function loginCheck(){
			var username = $("input[name='username']").val();
			var password = $("input[name='password']").val();
			if(username==""){
				alert("请输入用户名");
				return false;
			}
			if(password==""){
				alert("请输入密码");
				return false;
			}
		}
	
	</script>
</body>
</html>
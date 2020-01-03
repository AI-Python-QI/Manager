<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>登录(Login)</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="${root}/css/reset.css">
        <link rel="stylesheet" href="${root}/css/supersized.css">
        <link rel="stylesheet" href="${root}/css/style.css">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="assets/js/html5.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="page-container">
            <h1>欢迎登录Estore管理平台</h1>
            <form action="" method="post">
                <input type="text" name="username" id="uname" class="username" placeholder="请输入您的用户名！">
                <input type="password" name="password" id="password" class="password" placeholder="请输入您的用户密码！">
               <!--  <input type="Captcha" class="Captcha" name="Captcha" placeholder="请输入验证码！"> -->
                <button type="button" id="btn" onclick="login()" class="submit_button">登录</button>
                <div class="error"><span>+</span></div>
            </form>
            <div class="connect">
                <!-- <p>快捷</p> -->
               <!--  <p>
                    <a class="facebook" href=""></a>
                    <a class="twitter" href=""></a>
                </p> -->
            </div>
        </div>
		
        <!-- Javascript -->
        <script src="${root}/js/jquery-1.8.2.min.js" ></script>
        <script src="${root}/js/supersized.3.2.7.min.js" ></script>
        <script src="${root}/js/supersized-init.js" ></script>
        <script src="${root}/js/scripts.js" ></script>
        <script type="text/javascript">
        	//登录功能
        	
        	function login(){
        		var username = $("input[name='username']").val();
        		var password = $("input[name='password']").val();
        		sendData={"username":username,
        					"password":password};
        		$.ajax({
        			url:"${root}/admin/mlogin.action",
        			data:sendData,
        			dataType:"json",
        			Type:"post",
        			success:function(result){
        				if(result.error_code =="24"){
        					alert("登录成功！");
            				location.href="${root}/admin/mindex.html";
        				}else{
        					alert("登录失败");
        					return false;
        				}
        				
        			}
        		})
        		
        	}
        
        
        
        
        
        </script>

    </body>
<div style="text-align:center;">
</div>
</html>


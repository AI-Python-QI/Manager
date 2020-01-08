<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
	.th{
		padding: 150px 100px 50px 450px;
	}
</style>
</head>
<body>
<div id="wrapper">
   
        <div id="page-wrapper" class="th">
       		<span>&emsp;&emsp;&emsp;欢迎您${admin.username }</span> <br/>
       		<span>祝您工作顺利!生意多多!哈哈哈!</span> <br/>
       		<span>&emsp;&emsp;&emsp;休息一会!<a href="">退出</a></span> <br/>
       </div>
   </div>
    
</body>
</html>
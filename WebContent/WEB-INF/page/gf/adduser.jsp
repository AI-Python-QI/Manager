<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卖家中心</title>

<style type="text/css">
	.th{
		padding: 150px 100px 50px 450px;
	}
	.div{
		margin: 0px 0px 0px 250px;
		padding: 50px 0px 0px 500px;
		background: white;
	}
</style>
</head>
<body>
<div id="wrapper">
    <%-- <jsp:include page="./com/left.jsp" /> --%>
        <div id="page-wrapper" class="th">
       		<form action="${root }/admin/data/adduser" method="post">
       			用户名:<input type="text" name="username"  placeholder="请输入用户名"/><br/><br/>
       			密&emsp;码:<input type="text" name="password"  placeholder="请输入密码"/><br/><br/>
       			<select style="width: 235px" name="role">
       				<option  value="0">选择功能模块</option>
	       			<c:forEach items="${role }" var="ro">
	       				<option value="${ro.id }">${ro.name }</option>
	       			</c:forEach>
       			</select>
       			<br/><br/>
       			<input type="submit" value="提交" style="width: 235px"/>
       		</form>
       </div>
       <div  class="div">
       
       </div>
</div>
    <script src="${root }/js/jquery-1.8.2.min.js"></script> 
    <script type="text/javascript">
    	/* function check(){
    		var username=$("input[name='username']").val();
    		var password=$("input[name='password']").val();
    		var role=$("select[name='role']").val();
    		if(username==""){
    			alert("请输入账户名");
    			return false;
    		}
    		if(password==""){
    			alert("请输入账户密码");
    			return false;
    		}
    		if(role==0){
    			alert("请选择功能模块");
    			return false;
    		}
    	} */
    </script>
</body>
</html>
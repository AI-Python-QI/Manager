<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卖家中心</title>

<style type="text/css">
	#showOrder td{
		padding: 0px  0px 0px 10px;
		border: 2px solid;
		width: 150px;
		height: 100px;
		font-weight: bold;
	}
	#show th{
		padding: 0px  0px 0px 10px;
		border: 2px solid;
		width: 150px;
	}
	#wrapper{
		background: black;
	
	}
	#quantity{
		width: 60px;
	}
	.th{
		padding: 0px 50px 50px 50px;
	}
	font{
		font-weight: bold;
	}
	#s{
	 margin:0px 0px 0px 30px ;
	 width: 180px;
	}
	#cc{
	 margin:0px 0px 0px 70px ;
	}
</style>
</head>
<body>
<div id="wrapper">
   <%--  <jsp:include page="./com/left.jsp" /> --%>
    <div id="page-wrapper" class="th">
    	<h3 id="cc">个人信息</h3><hr>
    	<img src="${root }/${admin.photo}" />
    	<font size="3px">用&emsp;户名:&emsp;${admin.username }</font><br/>
    	<font size="3px">创建时间:&emsp;<fmt:formatDate value='${admin.createtime }' pattern='yyyy-MM-dd'/></font><br/>
    	<font size="3px">账户状态:&emsp;${admin.state==1?"可用":"不可用" }</font><br/>
    	<font size="3px">账户角色:&emsp;<c:forEach items="${role }" var="r">
	       		<c:if test="${r.id==admin.rid }">
	       			${r.name }
	       		</c:if>
	       	   </c:forEach></font>
	    <hr>
	    <form action="${root }/admin/data/updatePassword" method="post">
		  <font size="3px" id="cc">修改密码</font><br/><br/>
		  <font size="3px"> 新&emsp;密码:</font> <input type="password" name="password" /><br/><br/>
		  <font size="3px"> 确认密码:</font><input type="password" name="repassword"/><br/><br/>
		  <input type="submit" id="s"  value="提交"/>
	   	</form>
	   	<form action="${root }/admin/data/updatePhoto" method="post" enctype="multipart/form-data">
        		 <font size="3px" id="cc">修改头像</font><br/><br/>
        		图片描述:<img src="/upload/images/${admin.photo}" /><input type="file" name="file">
        		<input type="submit" value="提交修改" style="width: 240px"/>
        </form>
		<div id="div"></div>
    </div>
</div>
    <script src="${root }/adminjs/bootstrap.min.js"></script>
    <script type="text/javascript">
		function toc(){
			var password=$("input[name='password']").val();
			var repassword=$("input[name='repassword']").val();
			if(repassword!=password){
				alert("两次密码不一致");
				return false;
			}
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卖家中心</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="${root }/admincss/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="${root }/admincss/style.css" rel='stylesheet' type='text/css' />
<link href="${root }/admincss/lines.css" rel='stylesheet' type='text/css' />
<link href="${root }/admincss/font-awesome.css" rel="stylesheet"> 
<script src="${root }/adminjs/jquery.min.js"></script>
<link href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
<link href="${root }/admincss/custom.css" rel="stylesheet">
<script src="${root }/adminjs/metisMenu.min.js"></script>
<script src="${root }/adminjs/custom.js"></script>
<script src="${root }/adminjs/d3.v3.js"></script>
<script src="${root }/adminjs/rickshaw.js"></script>
<style type="text/css">
	.th{
		padding: 150px 150px 50px 200px;
	}
	.table tr{
		background:black ;
		border: 1px solid;
		color: white;
		font-weight: bold; 
	}
	.table th{
		border: 1px solid; 
	}
	.table td{
		border: 1px solid; 
	}
</style>
</head>
<body>
<div id="wrapper">
    <%-- <jsp:include page="./com/left.jsp" /> --%>
        <div id="page-wrapper" class="th">
       		<table class="table">
       			<tbody class="table">
       				<tr>
	       				<th>编号</th>
	       				<th>角色名</th>
	       				<th>现有人数</th>
	       				<th>状态</th>
	       				<th>操作</th>
       				</tr>
       			 <c:forEach items="${role }" var="roles">
       				<tr>
	       				<td>${roles.id }</td>
	       				<td>${roles.name }</td>
	       				<td>${roles.num }</td>
	       				<td>${roles.stat==1?"可用":"不可用" }</td>
	       				<c:if test="${roles.id==1 }">
	       					<td></td>
	       				</c:if>
	       				<c:if test="${roles.id!=1&&admin.rid==1 }">
	       					<td><a href="${root }/admin/data/deleteRole?id=${roles.id}">删除</a></td>
	       				</c:if>
       				</tr>
       			</c:forEach>
       			</tbody>
       		</table>
       		<strong>添加新角色</strong><br/><br/>
       		<input name="name" type="text" value="角色名"/><br/><br/>
       		<button style="width: 200px" onclick="toAddRole">提交</button>
       </div>
</div>
    <script src="${root }/adminjs/bootstrap.min.js"></script>
    <script type="text/javascript">
    	function toAddRole(){
    		var name=$("input[name='name']").val();
    		$.ajax({
    			url:"${root}/admin/data/addRole/"+name+"",
    			type:"post",
    			dataType:"json",
    			success:function(reslut){
    				if(reslut.error_code==1){
    					if(confirm("是否立即配置权限")){
    						loction.href="${root}/adm/power.html";
    					}else{
    						loction.href="${root}/adm/roles.html";
    					}
    				}
    			}
    		})
    	}
    </script>
</body>
</html>
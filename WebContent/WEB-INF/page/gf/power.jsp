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
		padding: 50px 0 0 50px;
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
        权限管理:<br/><hr/>
        请选择设置的角色:
       		<select style="width: 235px" name="role" onblur="blur()">
       		<option value="0">选择</option>
	       		<c:forEach items="${role }" var="r">
	       		<option value="${r.id }">${r.name }</option>
	       		</c:forEach>
       		</select>
       		<br/><hr/>
       		<c:forEach items="${power }" var="po">
	            <c:if test="${po.power.parentid==0 }">
	            <h4><input type="checkbox" name="pid" value="${po.power.id }"/><strong>${po.power.menu }</strong></h4>
	             <c:forEach items="${power }" var="p">
			        <c:if test="${p.power.parentid==po.power.id }">
			         <input type="checkbox" name="pid" parentid="${po.power.id }" value="${p.power.id }"/>${p.power.menu }  
			        </c:if> 
	             </c:forEach>
	             <hr/> 
	             </c:if>          
	       </c:forEach>
	       <button style="width: 100px" onclick="toTiJiao()">提交</button>
       </div>
       <div  class="div">
        <p style="padding: 40px 0 0 0">Copyright &copy; 2015 氢设计</p>
       </div> 
</div>
    <script src="${root }/adminjs/bootstrap.min.js"></script>
    <script type="text/javascript">
    	function toTiJiao(){
    		var id=$("select[name=role]").val();
    		var ids = [];
    		var obj=$("input[name=pid]");
    		for(i in obj){
				if(obj[i].checked){
					ids.push(obj[i].value);
				}
			}
    		$.ajax({
    			url:"${root}/admin/data/updatePower/"+ids+"/"+id+"",
    			type:"post",
    			dataType:"json",
    			success:function(reslut){
    				
    			}
    		}) 
    	}
    	
    	function blur(){
    		var id=$("select[name=role]").val();
    		alert(id);
    		var obj=$("input[name=pid]");
    		for(i in obj){
				if(obj[i].value==id){
					obj[i].checked;
				}
			}
    	}
    </script>
</body>
</html>
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
		padding: 50px 0px 0px 300px;
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
      		<strong>发布商品</strong><br/><br/>
        	<form action="${root }/admin/data/insertItems" method="post" enctype="multipart/form-data">
        		商品名称:<input type="text" name="name"/><br/><br/>
        		市场价格:<input type="text" name="markprice"><br/><br/>
        		售卖价格:<input type="text" name="estoreprice"/><br/><br/>
        		选择类别:<select style="width: 90px" id="bigCate" name="bigCate" onblur="getSamllCate(this)">
	       				<option value="0">大类别</option>
	       		</select>
	       		 <select style="width: 90px" id="smallCate" name="scate">
	       				<option value="0">小类别</option>
       			</select><br/><br/> 
       			库&emsp;&emsp;存:<input type="text" name="num"/><br/><br/>
        		<input type="text" style="height: 60px;width: 250px" placeholder="给商品写一段描述" name="description"/><br/><br/>
        		生产日期:<input type="date" name="productDate"/><br/><br/>
        		保质日期:<input type="date" name="expiryDate"/><br/><br/>
        		图片描述:<input type="file" name="file">
        		<input type="submit" value="提交修改" style="width: 240px"/>
        	</form>
       </div>
       <div  class="div">
       		
       </div>
</div>
    <script src="${root }/adminjs/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var pid=0;
			$.ajax({
				url:"${root}/admin/data/showCate/"+pid+"",
				type:"post",
				dataType:"json",
				success:function(result){
					if(result.error_code=='1'){
						var list=result.error_msg;
						for(i=0;i<list.length;i++){
							$("#bigCate").append($("<option value='"+list[i].id+"'>"+list[i].type+"</option>"));
						}
					}
				}
			})
		})
		function getSamllCate(obj){
			var pid=obj.value;
			$.ajax({
				url:"${root}/admin/data/showCate/"+pid+"",
				type:"post",
				dataType:"json",
				success:function(result){
					if(result.error_code=='1'){
						var list=result.error_msg;
						for(i=0;i<list.length;i++){
							$("#smallCate").append($("<option value='"+list[i].id+"'>"+list[i].type+"</option>"));
						}
					}
				}
			})
		}
	
	</script>
</body>
</html>
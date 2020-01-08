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
<link href="${root }/css/common.css" rel="stylesheet" type="text/css">
<link href="${root }/css/cart.css" rel="stylesheet" type="text/css">
<link href="${root }/css/product.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
	.th{
		padding: 50px 0px 0px 300px;
	}
	#wrapper{
		background: black;
	
	}
	#div{
		padding: 0 450px 0 0;
		size: 10px;
	}
</style>
</head>
<body>
<div id="wrapper">

   <%--  <jsp:include page="./com/left.jsp" /> --%>
    <div id="page-wrapper" class="th">
    	<form action="${root }/admin/data/updateItems" method="post" enctype="multipart/form-data">
        		商品名称:<input type="text" name="name" value="${item.name }"/><br/><br/>
        		市场价格:<input type="text" name="markprice" value="${item.marketprice }"><br/><br/>
        		售卖价格:<input type="text" name="estoreprice" value="${item.estoreprice }"/><br/><br/>
        	<!-- 	选择类别:<select style="width: 90px" id="bigCate" name="bigCate" onblur="getSamllCate(this)">
	       				<option value="0">大类别</option>
	       		</select>
	       		 <select style="width: 90px" id="smallCate" name="scate">
	       				<option value="0">小类别</option>
       			</select><br/><br/> -->
       			<input type="hidden" name="id" value="${item.id }"/>
       			库&emsp;&emsp;存:<input type="text" name="num" value="${item.num }"/><br/><br/>
        		<input type="text" style="height: 60px;width: 250px" placeholder="给商品写一段描述" name="description" value="${item.description }"/><br/><br/>
        		生产日期:<input type="date" name="productDate" value="<fmt:formatDate value='${item.production_date }' pattern='yyyy-MM-dd'/>"/><br/><br/><%-- ${item.production_date } ${item.expiry_date }--%>
        		保质日期:<input type="date" name="expiryDate" value="<fmt:formatDate value='${item.expiry_date }' pattern='yyyy-MM-dd'/>"/><br/><br/>
        		图片描述:<img name="pic" src="/upload/image/${item.titleimage } " /><input type="file" name="file">
        		<input type="submit" value="修改" style="width: 240px"/>
        	</form>
	<div id="div"></div>
    </div>
</div>
    <script src="${root }/adminjs/bootstrap.min.js"></script>
  	<script type="text/javascript">
  		
  	</script>
</body>
</html>
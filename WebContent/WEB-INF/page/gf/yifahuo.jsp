<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卖家中心</title>
<%-- <meta name="viewport" content="width=device-width, initial-scale=1">
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
<link href="${root }/css/product.css" rel="stylesheet" type="text/css"/> --%>
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
</style>
</head>
<body>
<div id="wrapper">
   <%--  <jsp:include page="./com/left.jsp" /> --%>
   <!--  <div id="page-wrapper" class="th"> -->
    <strong><h3>已发货订单</h3><span id="numt"></span></strong>
   	 开始日期:<input type="date" name="beginTime" style="height: 20px;"/>
   	 结束日期:<input type="date" name="endTime" style="height: 20px;"/>
   	 <button onclick="showChaXun()">查询</button>
       	<table id="showOrder">
			<tbody>
			  <tr id="show">
				<th>订单编号</th>
				<th>收件人</th>
				<th>收货地址</th>
				<th>收货电话</th>
				<th>订单时间</th>
				<th>订单状态</th>
				<th>发货状态</th>
				<th>操作</th>
			  </tr>
			</tbody>
		</table>
		<div id="div"></div>
    </div>
</div>
    <script src="${root }/adminjs/bootstrap.min.js"></script>
    <script type="text/javascript">
	Date.prototype.format = function(format) {  
	    var o = {  
	        "M+" : this.getMonth() + 1, // month  
	        "d+" : this.getDate(), // day  
	        "h+" : this.getHours(), // hour  
	        "m+" : this.getMinutes(), // minute  
	        "s+" : this.getSeconds(), // second  
	        "q+" : Math.floor((this.getMonth() + 3) / 3), /// quarter  
	        "S" : this.getMilliseconds()  
	    // millisecond  
	    }  
	  
	    if (/(y+)/.test(format)) {  
	        format = format.replace(RegExp.$1, (this.getFullYear() + "")  
	                .substr(4 - RegExp.$1.length));  
	    }  
	  
	    for ( var k in o) {  
	        if (new RegExp("(" + k + ")").test(format)) {  
	            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]  
	                    : ("00" + o[k]).substr(("" + o[k]).length));  
	        }  
	    }  
	    return format;  
	}
	    var o;
		$(function(){
			toShowOne(1)
		})
		 
		function toShowOne(pageNo) {
			var bTime=$("input[name=beginTime]").val();
			var endTime=$("input[name=endTime]").val();
			var temp=2; //	已发货
			$.ajax({
				url:"${root}/admin/data/showOrder/"+pageNo+"/"+temp+"",
				type:"post",
				dataType:"json",
				success:function(reslut){
					var orders=reslut.error_msg.list;
					var paged=reslut.error_msg.pages;
					$("tr[named=hehe]").remove();	   
					$("div[named=hehe]").remove();
					$.each(orders, function (index, order) {
						var dateStr=new Date(order.createtime);
				    	var dateTemp=dateStr.format("yyyy-MM-dd hh:mm:ss");
				    	$("#showOrder")
                             .append($("<tr></tr>").attr("named", "hehe")
                                 .append($("<td></td>").attr("class","table").html(order.id))
                                 .append($("<td class='table'></td>").attr("width", "60").html(order.receivename))
                                 .append($("<td class='table'></td>").attr("width", "60").html(order.address))
                                 .append($("<td class='table'></td>").attr("width", "60").html(order.phone))
                                 .append($("<td class='table'></td>").html(dateTemp))
                                 .append($("<td class='table'></td>").html("已支付")) // <input id='add' type='button' value='+'>
                                 .append($("<td class='table'></td>").html("已发货"))  
                                 .append($("<td class='table'></td>").attr("width", "90").html("<a href='${root}/adm/orderInfo.html/"+order.id+"'>查看</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='${root}/admin/data/deleteOrderById/"+order.id+"' >删除<a/>"))
                                
                             );
                     });
				 	/* $("#numt").html(orders.length);  */
					o=orders;
					toShow(paged,pageNo);
				}
			})	
		}
		function toShipped(id){
			$.ajax({
				url:"",
				type:"post",
				dataType:"json",
				
				
			})
		}
		function toShow(paged,pageNo){
			var div = $("<div></div>").attr("named","hehe").append(function(){
				var $div = $("<div></div>").attr("class","pagination");
				//第一页
				$("<span class='firstPage'></span>").html("&nbsp;").click(function(){
					toShowOne(1); 
				}).appendTo($div);
						  
				//上一页
				$("<span class='previousPage'></span>").html("&nbsp;").click(function(){
					if(pageNo!=1){
						toShowOne(pageNo-1);
					} else{
						toShowOne(1); 
					}
				}).appendTo($div);
					//每一页
				var changed = parseInt(pageNo/10)*10 ;
				var begin = (changed==0?1:changed)-1;
				if(begin<1){
					begin=1;
				}
				var end = begin+11;	  
				if(end>paged){
					end=paged;
				}
				for(var i=begin;i<=end;i++){
					if(pageNo==i){
								//当前页
						$("<span class='currentPage'>"+i+"</span>").click(function(){toShowOne($(this).text())}).appendTo($div);
					}else{
						$("<a>"+i+"</a>").click(function(){toShowOne($(this).text())}).appendTo($div);
					}		  
				}
						  //下一页
				$("<span class='nextPage'></span>").html("&nbsp;").click(function(){
					if(pageNo<paged){
						toShowOne(pageNo+1);
					}else{
						toShowOne(paged);
					}
				}).appendTo($div);
						  //最后一页
					$("<span class='lastPage'></span>").html("&nbsp;").click(function(){
						toShowOne(paged);
					}).appendTo($div);
						  
					return $div;
				}).appendTo($("#div"));
		}
		function showChaXun(){
			var beginTime=$("input[name=beginTime]").val();
			var endTime=$("input[name=endTime]").val();
			
			location.href="${root}/adm/ordertime.html/"+beginTime+"/"+endTime+"";
			
		}
	</script>
</body>
</html>
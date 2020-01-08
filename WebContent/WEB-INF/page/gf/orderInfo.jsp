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
<link href="${root }/css/common.css" rel="stylesheet" type="text/css">
<link href="${root }/css/cart.css" rel="stylesheet" type="text/css">
<link href="${root }/css/product.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
	#showOrderItem td{
		padding: 10px  0px 0px 10px;
		border: 1px solid;
		width: 400px;
		height: 50px;
		font-weight: bold;
	}
	#show th{
		padding: 10px  0px 0px 10px;
		border: 1px solid;
		width: 150px;
		height: 50px;
	}
	#wrapper{
		background: black;
	
	}
	#div{
		padding: 0 450px 0 0;
		size: 10px;
	}
	p{
	 font-weight: bold;
	 font-size: 15px;
	}
	
</style>
</head>
<body>
<div id="wrapper">
    <%-- <jsp:include page="./com/left.jsp" /> --%>
    <div id="page-wrapper" class="th">
			<table id="showitems">
				<strong><h3>订单详情</h3></strong>
				<tbody>
					<tr>
						<td>
							<strong style="size: 15px">订单编号:<p id="oid">${order.id}</p></strong>
						</td>
					</tr>
					<tr>
						<td>
							<table cellspacing="1" class="carttable" id="showOrderItem">
								<tr>
									<td width="10%">序号</td>
									<td width="40%">商品名称</td>
									<td width="10%">价格(元)</td>
									<td width="10%">数量(件)</td>
									<td width="10%">小计</td>
								</tr>
							</table>
							<table cellspacing="1" class="carttable">
								<tr>
									<td style="text-align: right; padding-right: 40px; size: 15px"><strong>合计：<font
										style="color: #FF0000" id="price">&nbsp;&nbsp;${order.money}</font>元</strong>
									</td>
								</tr>
							</table>
							<p>
							订单编号:<font id="orderid">${order.receiverAddress }&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
							收货地址：<font id="addrr">${order.receiverAddress }&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
							收货人：<font id="name">&nbsp;&nbsp;&nbsp;&nbsp;${order.receiverName }&nbsp;&nbsp;&nbsp;&nbsp;</font><br />
							联系方式：<font id="phone">${order.receiverPhone }&nbsp;&nbsp;&nbsp;&nbsp;</font>
							</p>
						<hr>
						</td>
						
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
	    /* 展示详细信息 */
		$(function(){
			$.ajax({
				url:"${root}/order/data/orderInfo/${id}",
				type:"post",
				dataType:"json",
				success:function(result){
					var order=result.error_msg;
					var sum;
					var s=0;
					$.each(order.orderItems, function (index, orderI) {
						var dateStr=new Date(order.createtime);
				    	var dateTemp=dateStr.format("yyyy-MM-dd hh:mm:ss");
                         $("#showOrderItem")
                             .append($("<tr></tr>").attr("named", "hehe"+index)
                                 .append($("<td></td>").html(index+1))
                                 .append($("<td></td>").attr("width", "60").html(orderI.item.name))
                                 .append($("<td></td>").html(orderI.item.estoreprice+"元"))
                                 .append($("<td></td>").html(orderI.buyNum)) // <input id='add' type='button' value='+'>
                                 .append($("<td ></td>").attr("width", "90").html(orderI.item.estoreprice*orderI.buyNum))
                             );
                         sum=orderI.item.estoreprice*orderI.buyNum;
                         s=sum+Number(s);
                     });
					$("#oid").html(order.id);
					$("#orderid").html(order.id);
					$("#price").html(s);
					$("#addrr").html(order.address);
					$("#name").html(order.receivename);
					$("#phone").html(order.phone);
				}
			})
			
		})
	    
    </script>
</body>
</html>
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
	#showitems td{
		padding: 10px  0px 0px 10px;
		border: 1px solid;
		width: 400px;
		height: 100px;
	}
	#show th{
		padding: 10px  0px 0px 10px;
		border: 1px solid;
		width: 150px;
	}
	#wrapper{
		background: black;
	
	}
	#quantity{
		width: 60px;
	}
	
</style>
</head>
<body>
<div id="wrapper">
  <%--   <jsp:include page="./com/left.jsp" /> --%>
    <div id="page-wrapper" class="th">
       	<table id="showitems">
       	  <strong><h3>商品信息:</h3></strong>
			<tbody>
			  <tr id="show">
				<!-- <th><input type="checkbox" name="checks" id="checkAll" onclick="run()"></th> -->
				<th>图片</th>
				<th>名称</th>
				<th>描述</th>
				<th>价格</th>
				<th>库存</th>
				<th>操作</th>
			  </tr>
			</tbody>
		</table>
		<div id="div"></div>
    </div>
</div>
    <script src="${root }/adminjs/bootstrap.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		loadData();
    		pageChange(1);
    		seeSome(1);
    	})
    	var pageed;
    	var tempList;
    	function loadData() {
          $.ajax({
              url:"${root}/admin/data/stored",
              type:"post",
              dataType:"json",
              async:false,// 表示数据同步
              success:function(result){
                  if(result.error_code=='-1'){
                      alert(result.error_msg);
                      return false;
                  }else if(result.error_code=='1') {
                      var lists = result.error_msg;
					   if(lists.length==0){
						   $("div[named=hehe]").remove();
					   }
                      //var lists = $.parseJSON(data);
                      $.each(lists, function (index, item) {
                    	  if(item.stat==0){
	                          $("#showitems")
	                          //append是内部追加  html是内部替换  attr是仅用于设置属性
	                              .append($("<tr></tr>").attr("named", "hehe"+index)
	                                 /*  .append($("<td></td>").html("<input type='checkbox' class='cid' name='cid' value='" + item.id + "'>")) */
	                                  .append($("<td></td>").attr("width", "30").html("<img style='width:60px' src='${root}/image/" + item.titleimage + "'>"))
	                                  .append($("<td></td>").html( item.name ))
	                                  .append($("<td></td>").html( item.description ))
	                                  .append($("<td></td>").html("<span>￥</span><input type='text'id='quantity' name='price' value='" + item.estoreprice + "'/>")) // <input id='add' type='button' value='+'>
	                                  .append($("<td></td>").attr("width", "60").html("<input id='quantity' name='quantity' value='"+item.num+"' maxlength='4'onpaste='return false;' type='text' onkeyup='judge(this)'>"))
	                                  .append($("<td></td>").attr("width", "140").html("<button value='"+item.id+"' temp='0' onclick='updateStat(this)'>上架</button>")) //"+cart.id+"   &emsp;|&emsp;<a href='${root}/admin/data/showItems?id="+item.id+"'>查看</a>
	                              );
	                          pageed=Math.ceil((index+1)/10);
	                          tempList=lists;
                    	  }
                      });
                  }
			  }
		  })
	  }
    function updateStat(_this){
    	var id=$(_this).val();
    	var temp=$(_this).attr("temp");
    	$.ajax({
    		url:"${root}/admin/data/updateStat/"+id+"/"+temp+"",
    		dataType:"json",
    		type:"json",
    		success:function(reslut){
    			if(reslut.error_code==1){
    				location.href="${root}/adm/lower.html";
    			}
    		}
    	})
    }
    /* function toShowInfo(_this){
    	var id=$(_this).val();
    	location.href="${root}/adm/itemsInfo.html/"+id+"";
    	/* $.ajax({
    		url:"${root}/adm/itemsInfo.html/"+id+"",
    		dataType:"json",
    		type:"json",
    		success:function(reslut){
    			
    		}
    	})
    }  */
    function pageChange(pageNo) {
       	  if(tempList.length==0){
       		  alert("空空如也");
       		  return false;
       	  }
             var div = $("<div></div>").attr("named","hehe").append(function(){
                 var $div = $("<div></div>").attr("class","pagination");
                 //第一页
                 $("<span class='firstPage'></span>").html("&nbsp;").click(function(){
                     seeSome(1);
                 }).appendTo($div);

                 //上一页
                 $("<span class='previousPage'></span>").html("&nbsp;").click(function(){
                     if(pageNo!=1){
                         seeSome(pageNo-1);
                     } else{
                         seeSome(1);
                     }
                 }).appendTo($div);
                 //每一页
                 var changed = parseInt(pageNo/5)*5 ;
                 var begin = (changed==0?1:changed)-1;
                 if(begin<1){
                     begin=1;
                 }
                 var end = begin+5;
                 if(end>pageed){
                     end=pageed;
                 }
                 for(var i=begin;i<=end;i++){
                     if(pageNo==i){
                         //当前页
                         $("<span class='currentPage'>"+i+"</span>").click(function(){seeSome($(this).text())}).appendTo($div);
                     }else{
                         $("<a>"+i+"</a>").click(function(){seeSome($(this).text())}).appendTo($div);
                     }

                 }
                 //下一页
                 $("<span class='nextPage'></span>").html("&nbsp;").click(function(){
                     if(pageNo<pageed){
                         seeSome(pageNo+1);
                     }else{
                         seeSome(pageed);
                     }
                 }).appendTo($div);
                 //最后一页
                 $("<span class='lastPage'></span>").html("&nbsp;").click(function(){
                     seeSome(pageed);
                 }).appendTo($div);

                 return $div;
             }).appendTo($("#div"));
            
         }
        function seeSome(pageNo) {
             //选取ul标签下的所有可见元素改为不可见 visibility:hidden隐藏  但是 占空间  display:none隐藏  不占空间
             $("#showitems tr").attr("style","display:none");
             $("#show").attr("style","visibility:visible");
             for(var i=(pageNo-1)*10;i<pageNo*10;i++){
                // $("#item"+i).attr("style","visibility:visible");
                 $("tr[named=hehe"+i+"]").attr("style","visibility:visible");
             }
         } 
        function quan() {
			//全选：是为了获得所有的ID标签，并将循环将标签的属性设置为选择
			var a = document.getElementsByName("cid");
				for (var i = 0; i < a.length; i++) {
					//获取每一个对象
					var temp = a[i];
					temp.checked = true;
				}
	  }
	  function no() {
			//全不选：获得所有的name 标签，他是数组，将所有的标签属性设置为false
			var no = document.getElementsByName("cid");
			for (var i = 0; i < no.length; i++) {
			   //获得每一个标签
				var temp = no[i];
				temp.checked = false;
			}
		}
			//全选 全不选
	    var flag=0;
	    function run() {
		//获得所有的标签
			var a = document.getElementById("checkAll");
			if (a.checked == true) {
				flag=1;
				quan();
			} else {
				flag=0;
				no();
			}
	    }
	    
    </script>
</body>
</html>
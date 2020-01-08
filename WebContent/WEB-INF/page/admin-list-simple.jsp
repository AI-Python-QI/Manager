<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
       <meta charset="UTF-8">
       <title>welcome to controller</title>
       <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="${root }/css/font.css">
        <link rel="stylesheet" href="${root }/css/xadmin.css">
        <script src="${root }/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${root }/js/xadmin.js"></script>
     
</head>
<body>
	 <div class="layui-card-body ">
                            <table id="theone" class="layui-table layui-form">
                              <thead>
                                <tr>
                                  <th>
                                    <input type="checkbox" name=""  lay-skin="primary">
                                  </th>
                                   <th>权限ID</th> 
                                  <th>登录名</th>
                                  <th>手机</th>
                                  <th>邮箱</th>
                                  <th>角色</th>
                                  <!-- <th>加入时间</th> -->
                                  <th>状态</th>
                                  <th>操作</th>
                              </thead>
                              
                            </table>
                        </div>
	<script type="text/javascript" src="${root }/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$.ajax({
				url:"${root}/admin/allmanager",
				dataType:"json",
				Type:"post",
				success:function(result){
					if(result.error_code=="24"){
						var lists = result.error_msg;
						console.log(lists);
						$.each(lists, function(index,manager){
							//alert("manager.id:"+manager.id);
							console.log(manager.username)
							$("#theone").append(
								$("<tbody></tbody>")
										.append($("<tr></tr>")
												.append($("<td></td>").html("<input type='checkbox' name='' lay-skin='primary'"))
												.append($("<td></td>").append("<span>"+manager.rid+"</span>"))
												.append($("<td></td>").append("<span>"+manager.username+"</span>"))
												.append($("<td></td>").append("<span>"+manager.phone+"</span>"))
												.append($("<td></td>").append("<span>"+manager.email+"</span>"))
												.append($("<td></td>").append("<span>"+manager.state+"</span>"))
												.append($("<td></td>").append("<span>"+manager.username+"</span>"))
												/* .append($("<td></td>").attr("class","td-status").append("<span class='>ok</span>")) */
												.append($("<td></td>").attr("class","td-manage").html("<a title='编辑'>编辑</a>&nbsp;/&nbsp;"+"<a>删除</a>"+""))											
										)					
							)
								
						});
						
					}else{
						alert("error");
						
					}
					
				}
			})
			
		})
	
	
	
	
	
	</script>
</body>
</html>
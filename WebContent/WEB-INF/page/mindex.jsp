<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="root" />
<!doctype html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>Estore商城后台管理</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="${root }/css/font.css">
        <link rel="stylesheet" href="${root }/css/xadmin.css">
        <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
        <script src="${root }/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${root }/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>
            // 是否开启刷新记忆tab功能
            // var is_remember = false;
        </script>
    </head>
    <body class="index">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="./mindex.html">Estore商城后台管理中心</a></div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
           
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">欢迎您登录:&emsp;<font color="orange">${user.username }</font>&emsp;</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a onclick="xadmin.open('个人信息','#')">个人信息</a></dd>
                        <dd>
                            <a onclick="xadmin.open('切换帐号','mlogin.html')">切换帐号</a></dd>
                        <dd>
                            <a href="mlogin.html">退出</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="商品管理">&#xe723;</i>
                            <cite>商品管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">  
                        	<li>
                                <a onclick="xadmin.add_tab('订单列表','order-list.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>发布商品</cite></a>
                            </li>
                            
                              <li>
                                <a onclick="xadmin.add_tab('商品操作','member-list1.html',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>商品操作</cite></a>
                            </li>
                            
                              <li>
                                <a onclick="xadmin.add_tab('下架商品','member-list1.html',true)">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>下架商品</cite></a>
                            </li>
                            
                            <li>
                                <a onclick="xadmin.add_tab('已下架商品','member-del.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>已下架商品</cite></a>
                            </li>          
                            </li>
                        </ul>
                  
                   
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="订单管理">&#xe723;</i>
                            <cite>订单管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                               <!--  <a onclick="xadmin.add_tab('订单列表','order-list.html')"> -->
                                <a onclick="xadmin.add_tab('订单列表','order-list.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>待支付订单</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('订单列表1','order-list1.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>已支付订单</cite></a>
                            </li>
                            
                             <li>
                                <a onclick="xadmin.add_tab('订单列表2','order-list1.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>已发货订单</cite></a>
                            </li>
                            
                             <li>
                                <a onclick="xadmin.add_tab('订单列表2','order-list1.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>已完成订单</cite></a>
                            </li>
                            
                             <li>
                                <a onclick="xadmin.add_tab('订单列表2','order-list1.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>已取消订单</cite></a>
                            </li>
                        </ul>
                    </li>
                  
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="城市联动">&#xe723;</i>
                            <cite>城市联动</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('三级地区联动','city.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>三级地区联动</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="管理员管理">&#xe726;</i>
                            <cite>管理员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('管理员列表','admin-list-simple.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>管理员列表</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('角色管理','admin-role.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>角色管理</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('权限分类','admin-cate.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>权限分类</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('权限管理','admin-rule.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>权限管理</cite></a>
                            </li>
                        </ul>
                    </li>
                   
                </ul>
            </div>
        </div>
        <!-- <div class="x-slide_left"></div> -->
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home">
                        <i class="layui-icon">&#xe68e;</i>我的桌面</li></ul>
                <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd></dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src='welcome.html' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
      
    </body>

</html>
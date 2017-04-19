<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8" />
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>首页</title>
 <!-- Bootstrap -->
<link href="static/backweb/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="static/backweb/css/global.css">
<link href="static/backweb/css/layout.css" rel="stylesheet">
<link href="static/backweb/css/fonticon.css" rel="stylesheet">

</head>
<body  class="navbady">
   <div class="container_min">
     <div class="demonav">
        <ul class=" clearboth">
           <li class="pull-left">
              <a href="pages/backweb/user_list.jsp">
                 <i class="icon-iconfont-yonghu"></i>
                 <p>用户管理 </p>
              </a>
           </li>
           <li class="pull-left">
              <a href="pages/backweb/member_list.jsp">
                 <i class="icon-iconfont-huiyuan"></i>
                 <p>会员管理</p>
              </a>
           </li>
           <li class="pull-left">
              <a href="pages/backweb/template_list.jsp">
                 <i class="icon-iconfont-moban"></i>
                 <p>模板管理</p>
              </a>
           </li>
           <li class="pull-left">
              <a href="pages/backweb/style_list.jsp">
                 <i class="icon-iconfont-yangshiku"></i>
                 <p>样式管理</p>
              </a>
           </li>
        </ul>
     </div>
     <div class="demonews">
        <div class="demonews_title">系统公告</div>
        <div class="demonews_list">
           <ul>
              <li class="clearboth">
                 <div class="pull-left">
                   <i class=" red icon-iconfont-xiaoxi"></i>
                   <a href="">后台管理系统版本升级</a>
                 </div>
                 <div class="pull-right cor-gray">2016-05-01</div>
              </li>
              <li class="clearboth">
                 <div class="pull-left">
                   <i class=" red icon-iconfont-xiaoxi"></i>
                   <a href="">后台管理系统版本升级</a>
                 </div>
                 <div class="pull-right cor-gray">2016-05-01</div>
              </li>
              <li class="clearboth">
                 <div class="pull-left">
                   <i class=" red icon-iconfont-xiaoxi"></i>
                   <a href="">后台管理系统版本升级</a>
                 </div>
                 <div class="pull-right cor-gray">2016-05-01</div>
              </li>
              <li class="clearboth">
                 <div class="pull-left">
                   <i class=" red icon-iconfont-xiaoxi"></i>
                   <a href="">后台管理系统版本升级</a>
                 </div>
                 <div class="pull-right cor-gray">2016-05-01</div>
              </li>
              <li class="clearboth">
                 <div class="pull-left">
                   <i class=" red icon-iconfont-xiaoxi"></i>
                   <a href="">后台管理系统版本升级</a>
                 </div>
                 <div class="pull-right cor-gray">2016-05-01</div>
              </li>
           </ul>
        </div>
     </div>
   </div>
</body>
</html>

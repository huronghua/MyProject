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
<base href="<%=basePath%>">
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>首页</title>
 <!-- Bootstrap -->
<link href="static/backweb/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="static/backweb/css/global.css">
<link href="static/backweb/css/layout.css" rel="stylesheet">

</head>
<body marginheight="0" marginwidth="0">
<div class="header clearboth">
   <div class="pull-left logo">
      <a href="pages/backweb/index.jsp" target="_top"> <img src="static/backweb/images/logo.png"  height="60"><span>管理系统</span></a>
   </div>
   <div class=" pull-right comrin"><span>欢迎您：<b>${creatuser}</b> </span><span><a href="">消息( 5 )</a></span>|<span><a href="pages/backweb/login.jsp" target="_top">退出</a></span></div>
</div>
</body>
</html>

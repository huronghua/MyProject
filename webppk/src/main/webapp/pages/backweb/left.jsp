<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>首页</title>
<link rel="stylesheet" href="../../static/backweb/css/global.css">
<link href="../../static/backweb/css/layout.css" rel="stylesheet">
<link href="../../static/backweb/css/fonticon.css" rel="stylesheet">

</head>
<body class="navleft">
   <div class="navleft_grep">
      <div>基本设置</div>
      <ul>
         <li class="clearboth">
            <a href="user_list.jsp" class="clearboth" target="navpang" >
                <i class="pull-left icon-iconfont-yonghu"></i>
                <span class="pull-left">管理员管理</span>
             </a>
         </li>
         <li class="clearboth">
            <a href="role_list.jsp" class="clearboth" target="navpang">
                <i class="pull-left icon-iconfont-logo14"></i>
                <span class="pull-left">权限管理</span>
             </a>
         </li>
         <li class="clearboth">
            <a href="journal_list.jsp" class="clearboth" target="navpang">
                <i class="pull-left icon-iconfont-rizhi"></i>
                <span class="pull-left">日志管理</span>
             </a>
         </li>
         <li class="clearboth">
            <a href="mail_list.html" class="clearboth" target="navpang">
                <i class="pull-left icon-iconfont-xiaoxi"></i>
                <span class="pull-left">消息管理</span>
             </a>
         </li>
         <li class="clearboth">
            <a href="member_list.jsp" class="clearboth" target="navpang">
                <i class="pull-left icon-iconfont-huiyuan"></i>
                <span class="pull-left ">会员管理</span>
             </a>
         </li>
         <li class="clearboth">
            <a href="ad_list.jsp" class="clearboth" target="navpang">
                <i class="pull-left icon-iconfont-guanggao"></i>
                <span class="pull-left">广告管理</span>
             </a>
         </li>
      </ul>
   </div>
   <div class="navleft_grep">
      <div>内容管理</div>
      <ul>
         <li class="clearboth">
            <a href="template_list.jsp" class="clearboth" target="navpang">
                <i class="pull-left icon-iconfont-moban"></i>
                <span class="pull-left">模板管理</span>
             </a>
         </li>
         <li class="clearboth">
            <a href="style_list.jsp" class="clearboth" target="navpang">
                <i class="pull-left icon-iconfont-yangshiku"></i>
                <span class="pull-left">样式管理</span>
             </a>
         </li>
         <li class="clearboth">
            <a href="dynamic_list.jsp" class="clearboth" target="navpang">
                <i class="pull-left icon-iconfont-yangshiku"></i>
                <span class="pull-left">动态管理</span>
             </a>
         </li>
      </ul>
   </div>
</body>
</html>

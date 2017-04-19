
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
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>用户登录</title>

<script src="../../ppk/static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="../../ppk/static/js/jquery.tips.js"></script>
<script type="text/javascript" src="../../ppk/static/js/jquery.cookie.js"></script>
<script src="../../ppk/static/login/js/jquery.easing.1.3.js"></script>
<script src="../../ppk/static/login/js/jquery.mobile.customized.min.js"></script>

<link rel="stylesheet" href="static/preweb/css/global.css">
<link href="static/preweb/css/login.css" rel="stylesheet">

  <!--[if lt IE 9]>
  <script src="js/html5shiv.min.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
  
  <script type="text/javascript">
        //服务器校验
		function severCheck(){
		
		  if(check()){
		    var loginname = $("#loginname").val();
			var password = $("#password").val();
			var code = "loginname="+loginname+"&password="+password;

		    var json = { "loginname" : loginname, "password" : password};
			$.ajax({
					type: "POST",
					url: 'login_login',
 					data : 
					{
 						'loginname':loginname,
 						'password':password,
				    },
 					dataType : 'json',
					cache: false,
					error : function(XMLHttpRequest, textStatus, errorThrown) {   
	                    alert(XMLHttpRequest.status);  
	                },  
					success: function(data){
						if("failed" == data){
							$("#loginname").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 15
							});
							$("#loginname").focus();
						}
						
						if("success" == data){
							window.location.href="pages/preweb/register.html";
						}
					}
				});
		  }
		  return false;
		}
		
		//客户端校验
		function check() {
		
		    if ($("#loginname").val() == "") {
				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}
			
			if ($("#password").val() == "") {

				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#password").focus();
				return false;
			}
			return true;
		}
  </script>
</head>

<body class="loginbody">
<header class="loginhead">
   <div class=" text-center"><img src="static/preweb/images/login_logo.png" width="154" height="53"></div>
</header>
<section class="loginwrap  ">
   <div class="loginin clearboth">
      <div class="pull-left bna_baner"><img src="static/preweb/images/bna_baner.jpg"></div>
     <div class="pull-right login_ftom">
          <form name="form1" method="post" action="">
            <div class="loginfron_ico"></div>
             <div class="loginfron_irem  clearboth">
               <div class="pull-left from_intico from_nameico"></div>
               <div class="pull-left from_inp">
                  <label for="loginname"></label>
                  <input type="text" name="loginname" id="loginname" class="from_bonw"  placeholder="请输入用户名">
               </div>
             </div>
            <div class="loginfron_irem  clearboth">
               <div class="pull-left from_intico from_passwordico"></div>
               <div class="pull-left from_inp">
                  <label for="password"></label>
                  <input type="text" name="password" id="password" class="from_bonw"  placeholder="请输入密码">
               </div>
             </div>
             <div class="loginfron_irem clearboth loginfron_button">
                  <input type="submit" onclick="return severCheck();" name="button" id="button" value="立即登录" class="loginfron_btm">
             </div>
             <div class="clearboth">
               <a href="" class="pull-left blue">忘记密码？</a><a href="pages/preweb/register.jsp" class="pull-right red">新用户注册</a>
             </div>
          </form>
     </div>
   </div>
</section>
<footer class="text-center loginbottom">Copyright©2004-2016  eihoo.cn 版权所有 <br>
技术支持上海爱护我信息技术有限公司   	沪ICP备12018714号-17 </footer>
</body>
</html>

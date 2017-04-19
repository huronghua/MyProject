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
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>首页</title>
<!-- Bootstrap -->
<script src="static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<link href="static/backweb/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="static/backweb/css/global.css">
<link href="static/backweb/css/layout.css" rel="stylesheet">

<!--[if lt IE 9]>
  <script src="js/html5shiv.min.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
<script type="text/javascript">
	//服务器校验
	function severCheck() {

		if (check()) {
			var loginname = $("#loginname").val();
			var password = $("#password").val();
			var code = "loginname=" + loginname + "&password=" + password;

			var json = {
				"loginname" : loginname,
				"password" : password
			};
			$.ajax({
				type : "POST",
				url : 'login_backlogin',
				data : {
					'loginname' : loginname,
					'password' : password,
				},
				dataType : 'json',
				cache : false,
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
				},
				success : function(data) {
					if ("failed" == data) {
						$("#loginname").tips({
							side : 1,
							msg : "用户名或密码有误",
							bg : '#FF5080',
							time : 15
						});
						$("#loginname").focus();
					}

					if ("success" == data) {
						window.location.href = "pages/backweb/index.jsp";
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
<body class="loginbady">
	<div class="logintop">
		<div class="logintoptitle text-center">
			<div class="logintoplogo">
				<img src="static/backweb/images/logo.png">
			</div>
			<div class="logintopt">管理系统</div>
		</div>
	</div>
	<div class="loginmin">
		<div class="login_ftom">
			<form name="form1" method="post" action="">
				<div class="loginfron_irem  clearboth">
					<div class="pull-left from_intico from_nameico"></div>
					<div class="pull-left from_inp">
						<label for="loginname">
						 <input type="text" name="loginname" id="loginname" class="from_bonw" placeholder="请输入用户名">
						</label>
					</div>
				</div>
				<div class="loginfron_irem  clearboth">
					<div class="pull-left from_intico from_passwordico"></div>
					<div class="pull-left from_inp">
						<label for="password"> <input type="password" name="password"
							id="password" class="from_bonw" placeholder="请输入密码">
						</label>
					</div>
				</div>
				<div class="loginfron_irem clearboth loginfron_button">
					<input type="submit" onclick="return severCheck();" name="button" id="button" value="立即登录"
						class="loginfron_btm">
				</div>
				<strong></strong>
			</form>
		</div>
	</div>
	<div class="login_cpy">
		<p>Copyright©2004-2016 eihoo.cn 版权所有</p>
		<p>技术支持上海爱护网信息科技发展股份有限公司 沪ICP备12018714号-17</p>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   <!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>用户注册</title>
<script src="../static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="../static/js/jquery.tips.js"></script>
<script type="text/javascript" src="../static/js/jquery.cookie.js"></script>
<script src="../static/login/js/jquery.easing.1.3.js"></script>
<script src="../static/login/js/jquery.mobile.customized.min.js"></script>
  <!--[if lt IE 9]>
  <script src="js/html5shiv.min.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
<link rel="stylesheet" href="../static/preweb/css/global.css">
<link href="../static/preweb/css/login.css" rel="stylesheet">
<script type="text/javascript">

	//服务器校验
	function severCheck() {

		if (check()) {
		    var loginname = $("#loginname").val();
			var password = $("#password").val();
			var repassword = $("#repassword").val();
			var company = $("#company").val();
			var name = $("#name").val();
			var mobile = $("#mobile").val();
			var telphone = $("#telphone").val();
			var email = $("#email").val();

			$.ajax({
				type: "POST",
				url: '../../user_register',
				data : 
				{
						'loginname':loginname,
						'password':password,
						'company':company,
						'name':name,
						'mobile':mobile,
						'telphone':telphone,
						'email':email
			    },
				dataType : 'json',
				cache: false,
				error : function(XMLHttpRequest, textStatus, errorThrown) {   
                    alert(XMLHttpRequest.status);  
                },  
				success: function(data){
					alert("11223344")
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
		//登录名判断
		if ($("#loginname").val() == "") {
			$("#loginname").tips({
				side : 2,
				msg : '登录名不得为空',
				bg : '#AE81FF',
				time : 3
			});
			$("#loginname").focus();
			return false;
		} else {
			$("#loginname").val(jQuery.trim($('#loginname').val()));
		}

		//密码判断
		if ($("#password").val() == "") {
			$("#password").tips({
				side : 2,
				msg : '密码不得为空',
				bg : '#AE81FF',
				time : 3
			});

			$("#password").focus();
			return false;
		} else {
			$("#password").val(jQuery.trim($('#password').val()));
		}

		//密码确认判断
		if ($("#repassword").val() == "") {
			$("#repassword").tips({
				side : 2,
				msg : '密码确认不得为空',
				bg : '#AE81FF',
				time : 3
			});

			$("#repassword").focus();
			return false;
		} else {
			$("#repassword").val(jQuery.trim($('#repassword').val()));
		}

		//密码确认判断
		if ($("#repassword").val() != $("#password").val()) {
			$("#repassword").tips({
				side : 2,
				msg : '密码不一致',
				bg : '#AE81FF',
				time : 3
			});

			$("#repassword").focus();
			return false;
		} else {
			$("#repassword").val(jQuery.trim($('#repassword').val()));
		}
		
		//公司名称判断
		if ($("#company").val() == "") {
			$("#company").tips({
				side : 2,
				msg : '公司名不得为空',
				bg : '#AE81FF',
				time : 3
			});

			$("#company").focus();
			return false;
		} else {
			$("#company").val(jQuery.trim($('#company').val()));
		}

		//姓名
		if ($("#name").val() == "") {
			$("#name").tips({
				side : 2,
				msg : '姓名不得为空',
				bg : '#AE81FF',
				time : 3
			});

			$("#name").focus();
			return false;
		} else {
			$("#name").val(jQuery.trim($('#name').val()));
		}

		//联系手机
		if ($("#mobile").val() == "") {
			$("#mobile").tips({
				side : 2,
				msg : '联系手机不得为空',
				bg : '#AE81FF',
				time : 3
			});

			$("#mobile").focus();
			return false;
		} else {
			$("#mobile").val(jQuery.trim($('#mobile').val()));
		}

		//固定电话
		if ($("#telphone").val() == "") {
			$("#telphone").tips({
				side : 2,
				msg : '固定电话不得为空',
				bg : '#AE81FF',
				time : 3
			});

			$("#telphone").focus();
			return false;
		} else {
			$("#telphone").val(jQuery.trim($('#telphone').val()));
		}

		//E-mail
		if ($("#email").val() == "") {
			$("#email").tips({
				side : 2,
				msg : '用户名不得为空',
				bg : '#AE81FF',
				time : 3
			});

			$("#email").focus();
			return false;
		} else {
			$("#email").val(jQuery.trim($('#email').val()));
		}
		return true;
	}
</script>
</head>
<body class="loginbody">
<header class="loginhead">
   <div class=" text-center"><img src="images/login_logo.png" width="154" height="53"></div>
</header>
<section class="loginwrap clearboth">
   <div class="register_min clearboth">
       <div class=" pull-left register_left">
         <div class="register_title">创建您的PPK账户</div>
          <div class="register_from">
            <form name="form1" method="post" action="">
               <!--------------------from-item--------------------->
              <div class="register_item clearboth">
                  <div class=" pull-left register_from_n text-right"><span>*</span>用户名 ：</div>
                  <div class=" pull-left puregister_from_ipt">
                      <label for="loginname"></label>
                      <input type="text" name="loginname" id="loginname" class="from_ein"  placeholder="请输入用户名">
                  </div>
               </div>
               <!--------------------from-item--------------------->
              <div class="register_item clearboth">
                  <div class=" pull-left register_from_n text-right"><span>*</span>密码  ：</div>
                  <div class=" pull-left puregister_from_ipt">
                      <label for="password"></label>
                      <input type="text" name="password" id="password" class="from_ein"  placeholder="请输入密码">
                  </div>
               </div>
               <!--------------------from-item--------------------->
               <div class="register_item clearboth">
                  <div class=" pull-left register_from_n text-right"><span>*</span>确认密码  ：</div>
                  <div class=" pull-left puregister_from_ipt">
                      <label for="repassword"></label>
                    <input type="text" name="repassword" id="repassword" class="from_ein"  placeholder="请输入确认密码">
                  </div>
               </div>
               <!--------------------from-item--------------------->
               <div class="register_item clearboth">
                  <div class=" pull-left register_from_n text-right"><span>*</span>公司名称 ：</div>
                  <div class=" pull-left puregister_from_ipt">
                      <label for="company"></label>
                    <input type="text" name="company" id="company" class="from_ein"  placeholder="请输入公司名称">
                  </div>
               </div>
               <!--------------------from-item--------------------->
               <div class="register_item clearboth">
                  <div class=" pull-left register_from_n text-right"><span>*</span>您的姓名 ：</div>
                  <div class=" pull-left puregister_from_ipt">
                      <label for="name"></label>
                    <input type="text" name="name" id="name" class="from_ein"  placeholder="请输入您的姓名">
                  </div>
               </div>
               <!--------------------from-item--------------------->
               <div class="register_item clearboth">
                  <div class=" pull-left register_from_n text-right"><span>*</span>联系手机 ：</div>
                  <div class=" pull-left puregister_from_ipt">
                      <label for="mobile"></label>
                    <input type="text" name="mobile" id="mobile" class="from_ein"  placeholder="请输入联系手机">
                  </div>
               </div>
               <!--------------------from-item--------------------->
               <div class="register_item clearboth">
                  <div class=" pull-left register_from_n text-right"><span>*</span>固定电话 ：</div>
                  <div class=" pull-left puregister_from_ipt">
                      <label for="telphone"></label>
                    <input type="text" name="telphone" id="telphone" class="from_ein"  placeholder="请输入固定电话 ">
                  </div>
               </div>
               <!--------------------from-item--------------------->
               <div class="register_item clearboth">
                  <div class=" pull-left register_from_n text-right"><span>*</span>E-mail ：</div>
                  <div class=" pull-left puregister_from_ipt">
                      <label for="email"></label>
                    <input type="text" name="email" id="email" class="from_ein"  placeholder="请输入E-mail">
                  </div>
               </div>
               <!--------------------from-item--------------------->
               <div class="register_item clearboth">
                  <div class=" pull-left register_from_n text-right"><span>&nbsp;</span></div>
                  <div class=" pull-left puregister_from_ipt">
                      <label for="textname">
                         <input name="" type="checkbox" value=""> 同意“<a href="" class="blue">服务条款</a>”并完全接受服务协议。 
                      </label>
                  </div>
               </div>
               <div class="registerbutton ">
                    <input type="submit" onclick="return severCheck();" name="button" id="button"  class="register_brm" value="免费注册并使用" >
               </div>
               
            </form>
            
         </div>
      </div>
       <div class=" pull-right register_right">
          <div class="register_right_man">注册PPK，您可享受：快速开通，即刻拥有属于自己的网站；<br>
    在线管理您的网站；<br>
    支持在线支付–网银、支付宝、快钱；<br>
    抛弃繁琐、快速建站；<br>
    完善的7*24小时不间断技术支持；<br>
    首创金牌服务，让您省
          </div>
          <div class="register_right_user">
             <p>如已是PPK会员请点击下方链接</p>
             <a href="login.html">用户登录</a>
          </div>
      </div>
   </div>
</section>
<footer class="text-center loginbottom">Copyright©2004-2016  eihoo.cn 版权所有 <br>
技术支持上海爱护我信息技术有限公司   	沪ICP备12018714号-17 </footer>
</body>
</html>

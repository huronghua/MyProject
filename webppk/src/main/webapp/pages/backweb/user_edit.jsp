<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>用户管理</title>
 <!-- Bootstrap -->
<link href="static/backweb/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="static/backweb/css/global.css">
<link href="static/backweb/css/layout.css" rel="stylesheet">
<link href="static/backweb/css/fonticon.css" rel="stylesheet">
<script src="static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    if (getUrlParam('userid') != null)
    {
        $.ajax({
            type: "GET",
            url: 'user_detail',
            dataType: 'json',
            data: {
                'ID': getUrlParam('userid'),
            },
            cache: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
            },
            success: function (data) {
            	$("#username").val(data.username);
            	$("#password").val(data.password);
            	$("#txtname").val(data.name);
            	$("#txtmobile").val(data.mobile);
            	$("#txtemail").val(data.email);
            	$("#selectstatus").val(data.status);
            	$("#selectrole").val(data.roletype);
            }
        });
    }
});

//获取url中的参数
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg); //匹配目标参数
    if (r != null)
        return unescape(r[2]);
    return null; //返回参数值
}

//服务器校验
function severCheck() {
	if (check()) {
		username = $("#username").val();
		password = $("#password").val();
		txtname = $("#txtname").val();
		txtmobile = $("#txtmobile").val();
		txtemail = $("#txtemail").val();
		selectstatus = $("#selectstatus").attr("value");
		roletype = $("#selectrole").attr("value");
		if (getUrlParam('userid') == null)
		{
	        $.ajax({
	            type: "POST",
	            url: 'user_add',
	            data:
	            {
	            	'username': username,
	            	'password': password,
	                'txtname': txtname,
	                'txtmobile': txtmobile,
	                'txtemail': txtemail,
	                'selectstatus': selectstatus,
	                'roletype':roletype
	            },
	            dataType: 'json',
	            cache: false,
	            error: function (XMLHttpRequest, textStatus, errorThrown) {
	                alert(XMLHttpRequest.status);
	            },
	            success: function (data) {
	                if ("success" == data) {
	                    window.location.href = "pages/backweb/user_list.jsp";
	                }
	                else{
	                	$("#username").tips({
	                        side: 2,
	                        msg: '用户已存在',
	                        bg: '#AE81FF',
	                        time: 3
	                    });
	                    $("#username").focus();
	                    return false;
	                }
	            }
	        });
		}
		else
		{
	        $.ajax({
	            type: "POST",
	            url: 'user_save',
	            data:
	            {
	            	'id': getUrlParam('userid'),
	            	'username': username,
	            	'password': password,
	                'txtname': txtname,
	                'txtmobile': txtmobile,
	                'txtemail': txtemail,
	                'selectstatus': selectstatus,
	                'roletype':roletype
	            },
	            dataType: 'json',
	            cache: false,
	            error: function (XMLHttpRequest, textStatus, errorThrown) {
	                alert(XMLHttpRequest.status);
	            },
	            success: function (data) {
	                if ("success" == data) {
	                    window.location.href = "pages/backweb/user_list.jsp";
	                }
	            }
	        });			
		}



	}
	return false;
} 
//客户端校验
function check() {
    if ($("#username").val() == "") {
        $("#username").tips({
            side: 2,
            msg: '用户名不得为空',
            bg: '#AE81FF',
            time: 3
        });
        $("#username").focus();
        return false;
    } else {
        $("#username").val(jQuery.trim($('#username').val()));
    }
    if (!$("#username").val().match(/^[a-zA-Z0-9_]{3,16}$/)) {
        $("#username").tips({
            side: 2,
            msg: '请输入正确的用户名',
            bg: '#AE81FF',
            time: 3
        });
        $("#username").focus();
        return false;
    } else {
        $("#username").val(jQuery.trim($('#username').val()));
    }
    if (!$("#password").val().match(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,12}$/)) {
        $("#password").tips({
            side: 2,
            msg: '请输入数字及大小写字母组合的8-12位密码',
            bg: '#AE81FF',
            time: 3
        });
        $("#password").focus();
        return false;
    } else {
        $("#password").val(jQuery.trim($('#password').val()));
    }
    
    if ($("#txtname").val() == "") {
        $("#txtname").tips({
            side: 2,
            msg: '姓名不得为空',
            bg: '#AE81FF',
            time: 3
        });
        $("#txtname").focus();
        return false;
    } else {
        $("#txtname").val(jQuery.trim($('#txtname').val()));
    }
    
    if ($("#txtmobile").val() == "") {
        $("#txtmobile").tips({
            side: 2,
            msg: '手机号不得为空',
            bg: '#AE81FF',
            time: 3
        });
        $("#txtmobile").focus();
        return false;
    } else {
        $("#txtmobile").val(jQuery.trim($('#txtmobile').val()));
    }
    
    if (!$("#txtmobile").val().match(/^1[3|4|5|8]\d{9}$/)) {
        $("#txtmobile").tips({
            side: 2,
            msg: '请输入正确的手机号码格式',
            bg: '#AE81FF',
            time: 3
        });
        $("#txtmobile").focus();
        return false;
    } else {
        $("#txtmobile").val(jQuery.trim($('#txtmobile').val()));
    }
    
    if ($("#txtemail").val() == "") {
        $("#txtemail").tips({
            side: 2,
            msg: '邮件不得为空',
            bg: '#AE81FF',
            time: 3
        });
        $("#txtemail").focus();
        return false;
    } else {
        $("#txtemail").val(jQuery.trim($('#txtemail').val()));
    }
    
    if ($("#txtemail").val().length < 5) {
        $("#txtemail").tips({
            side: 2,
            msg: '邮件格式不得低于5位',
            bg: '#AE81FF',
            time: 3
        });
        $("#txtemail").focus();
        return false;
    } else {
        $("#txtemail").val(jQuery.trim($('#txtemail').val()));
    }
    
    if (!$("#txtemail").val().match(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/)) {
        $("#txtemail").tips({
            side: 2,
            msg: '请输入邮件格式',
            bg: '#AE81FF',
            time: 3
        });
        $("#txtemail").focus();
        return false;
    } else {
        $("#txtemail").val(jQuery.trim($('#txtemail').val()));
    }
    return true;
}
</script>
</head>
<body class="navbady">
   <div class="current">
      <i class="icon-iconfont-shouye"></i>
      <span>管理首页</span><span>基本设置</span><span>管理员管理</span>><span>编辑</span>
   </div>
   <div class="container_min">
      <div class="container_edit_title">编辑内容</div>
      <div class="container_edit_contaer">
         <div class="form-group">
            <form action="/ppk/addOrUpdateUser.action" method="post" name="input">
            	<input name="flag" value="${flag}" type="hidden">
            	<input name="id" value="${user.id}" type="hidden">
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>用户名：</div>
                  <div class="pull-left">
                     <label for="textfield">
                     <input type="text" id="username" name="username" value="${user.username}" class="form-control_a form-border form-contro_w_3 editformv_control" maxlength="10">
                     </label>
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>密码：</div>
                  <div class="pull-left">
                     <label for="password">
                     <input type="text" id="password" name="password" value="${user.password}" class="form-control_a form-border form-contro_w_3 editformv_control" maxlength="10">
                     </label>
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>姓名：</div>
                  <div class="pull-left">
                     <label for="textfield">
                     <input type="text" id="txtname" name="txtname" value="${user.name}" class="form-control_a form-border form-contro_w_2 editformv_control" maxlength="30">
                     </label>
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>手机号码：</div>
                  <div class="pull-left">
                     <label for="txtmobile">
                     <input type="text" name="txtmobile" id="txtmobile" value="${user.mobile}" class="form-control_a form-border form-contro_w_e editformv_control">
                     </label>
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>邮箱：</div>
                  <div class="pull-left">
                     <label for="txtemail">
                     <input type="text" name="txtemail" id="txtemail" value="${user.email}" class="form-control_a form-border form-contro_w_e editformv_control" maxlength=30>
                     </label>
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>用户状态：</div>
                 <div class="pull-left">
                   <label for="selectstatus">
                     <select name="selectstatus" id="selectstatus" class="form-control form-border form-contro_w_e" >
                       <option value="1">正常</option>
                       <option value="0">禁用</option>
                     </select>
                     </label>
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"><b class="red">*</b>角色类型：</div>
                  <div class="pull-left">
                   <label for="select">
                     <select name="selectrole" id="selectrole" class="form-control form-border form-contro_w_e" >
                       <option value="0">超级管理员</option>
                       <option value="1">系统管理员</option>
                       <option value="2">内容管理员</option>
                       <option value="3">广告管理员</option>
                     </select>
                     </label>
                  </div>
               </div>
               <div class="form_btn">
                    <input type="submit" onclick="return severCheck();" name="btnsave" id="btnsave" value="提交"  class="btn form-contro_w_b btn-primary" />
                    <input type="reset" name="button" id="button" value="重 置" class="btn form-contro_w_b  btn-reset" />
               </div>
            </form>
         </div>
         
      </div>
   </div>
</body>
</html>

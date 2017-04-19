<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>用户管理</title>
 <!-- Bootstrap -->
<link href="static/backweb/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="static/backweb/css/global.css">
<link href="static/backweb/css/layout.css" rel="stylesheet">
<link href="static/backweb/css/fonticon.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="static/jquery-easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="static/jquery-easyui/themes/icon.css">
<script src="static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<!-- <script type="text/javascript" src="static/jquery-easyui/jquery.min.js"></script>
<script type="text/javascript" src="static/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/jquery-easyui/jquery.easyui.mobile.js"></script> -->
<script type="text/javascript">
$(document).ready(function () {
    if (getUrlParam('memberid') != null)
    {
        $.ajax({
            type: "GET",
            url: 'member_detail',
            dataType: 'json',
            data: {
                'ID': getUrlParam('memberid'),
            },
            cache: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
            },
            success: function (data) {
            	$("#logname").val(data.logname);
            	$("#password").val(data.password);
            	$("#registrationtime").val(data.registrationtime);
            	$("#lastlogintime").val(data.lastlogintime);
            	$("#lastloginip").val(data.lastloginip);
            	$("#type").val(data.contacts);
            	$("#contacts").val(data.contacts);
            	$("#telphone").val(data.telphone);
            	$("#email").val(data.email);
            	if (data.type == "1")
                {
            		$("input[type='radio'][name='type'][value='1']").attr("checked", "checked");
                } else
                {
                	$("input[type='radio'][name='type'][value='2']").attr("checked", "checked");
                }
            }
        });
    }
    $("#btnsubmit").click(function(){
    	if(check()){
		logname = $("#logname").val();
		password = $("#password").val();
		contacts = $("#contacts").val();
		telphone = $("#telphone").val();
		email = $("#email").val();
		type = $('input[type="radio"][name="type"]:checked').val();
	        $.ajax({
	            type: "POST",
	            url: 'member_save',
	            data:
	            {
	            	'id': getUrlParam('memberid'),
	            	'logname': logname,
	            	'password': password,
	                'contacts': contacts,
	                'telphone': telphone,
	                'email': email,
	                'type': type,
	            },
	            dataType: 'json',
	            cache: false,
	            error: function (XMLHttpRequest, textStatus, errorThrown) {
	                alert(XMLHttpRequest.status);
	            },
	            success: function (data) {
	                if ("success" == data) {
	                    window.location.href = "pages/backweb/member_list.jsp";
	                }
	            }
	        })
    	}	
    });
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
		logname = $("#logname").val();
		password = $("#password").val();
		contacts = $("#contacts").val();
		telphone = $("#telphone").val();
		email = $("#email").val();
		type = $("#type").attr("value");
	        $.ajax({
	            type: "POST",
	            url: 'member_save',
	            data:
	            {
	            	'id': getUrlParam('memberid'),
	            	'logname': logname,
	            	'password': password,
	                'contacts': contacts,
	                'telphone': telphone,
	                'email': email,
	                'type': type,
	            },
	            dataType: 'json',
	            cache: false,
	            error: function (XMLHttpRequest, textStatus, errorThrown) {
	                alert(XMLHttpRequest.status);
	            },
	            success: function (data) {
	                if ("success" == data) {
	                    window.location.href = "pages/backweb/member_list.jsp";
	                }
	            }
	        });			
		}
	return true;
}

//客户端校验
function check() {
    if ($("#logname").val() == "") {
        $("#logname").tips({
            side: 2,
            msg: '登录名不得为空',
            bg: '#AE81FF',
            time: 3
        });
        $("#logname").focus();
        return false;
    } else {
        $("#logname").val(jQuery.trim($('#logname').val()));
    }
    if (!$("#logname").val().match(/^[a-zA-Z0-9_]{3,16}$/)) {
        $("#logname").tips({
            side: 2,
            msg: '请输入数字及大小写字母组合的3-16位用户名',
            bg: '#AE81FF',
            time: 3
        });
        $("#logname").focus();
        return false;
    } else {
        $("#logname").val(jQuery.trim($('#logname').val()));
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
        
    if ($("#telphone").val() == "") {
        $("#telphone").tips({
            side: 2,
            msg: '手机号不得为空',
            bg: '#AE81FF',
            time: 3
        });
        $("#telphone").focus();
        return false;
    } else {
        $("#telphone").val(jQuery.trim($('#telphone').val()));
    }
    
    if (!$("#telphone").val().match(/^1[3|4|5|8]\d{9}$/)) {
        $("#telphone").tips({
            side: 2,
            msg: '请输入手机号码格式',
            bg: '#AE81FF',
            time: 3
        });
        $("#telphone").focus();
        return false;
    } else {
        $("#telphone").val(jQuery.trim($('#telphone').val()));
    }
    
    if ($("#email").val() == "") {
        $("#email").tips({
            side: 2,
            msg: '邮件不得为空',
            bg: '#AE81FF',
            time: 3
        });
        $("#email").focus();
        return false;
    } else {
        $("#email").val(jQuery.trim($('#email').val()));
    }
    
    if ($("#email").val().length < 5) {
        $("#email").tips({
            side: 2,
            msg: '邮件格式不得低于5位',
            bg: '#AE81FF',
            time: 3
        });
        $("#email").focus();
        return false;
    } else {
        $("#email").val(jQuery.trim($('#email').val()));
    }
    
    if (!$("#email").val().match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)) {
        $("#email").tips({
            side: 2,
            msg: '请输入邮件格式',
            bg: '#AE81FF',
            time: 3
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
<body class="navbady">
   <div class="current">
      <i class="icon-iconfont-shouye"></i>
      <span>管理首页</span>><span>基本设置</span>><span>会员管理</span>><span>编辑</span>
   </div>
   <div class="container_min">
      <div class="container_edit_title">编辑内容</div>
      <div class="container_edit_contaer">
         <div class="form-group">
            <form action="" method="get">
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"><b class="red">*</b>用户名：</div>
                  <div class="pull-left">
                     <label for="textfield"></label>
                     <input type="text" name="logname" class="form-control form-border form-contro_w_e editformv_control" id="logname" value="${member.logname}">
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"><b class="red">*</b>密码：</div>
                  <div class="pull-left">
                     <label for="textfield"></label>
                     <input type="text" name="password" class="form-control form-border form-contro_w_e editformv_control" id="password" value="${member.password}">
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"><b class="red"></b>注册时间 ：</div>
                  <div class="pull-left" >
                  <label for="textfield"></label>
                     <input type="text" name="registrationtime" class="form-control form-border form-contro_w_e editformv_control" id="registrationtime" value="${member.registrationtime}" disabled>
                  </div>
               </div>
				<div class="from_item clearboth">
                  <div class=" pull-left editform_t"><b class="red"></b>最后登录时间：</div>
                  <div class="pull-left">
                     <label for="textfield"></label>
                     <input type="text" name="lastlogintime" class="form-control form-border form-contro_w_e editformv_control" id="lastlogintime" value="${member.lastlogintime}" disabled>
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"><b class="red"></b>最后登录IP：</div>
                  <div class="pull-left">
                     <label for="textfield"></label>
                     <input type="text" name="lastloginip" class="form-control form-border form-contro_w_e editformv_control" id="lastloginip" value="${member.lastloginip}" disabled>
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"><b class="red">*</b>会员类型：</div>
                  <div class="pull-left">
                     <div class="fmtu distable">
                         <div class="distablediv">
                          <ul class="clearboth jurisdiction_footem">
			                  <li class="pull-left">
			                      <input type="radio" name="type" id="type1" value="1" class="form_checkbox">
			                      <label for="radio1">企业</label>
			                  </li>
			                  <li class="pull-left">
			                      <input type="radio" name="type" id="type2" value="2" class="form_checkbox">
			                      <label for="radio2">个人</label>
			                  </li>
                           </ul>
                          </div>
                      </div> 
                  </div>
               </div>
<!--                <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>公司名字：</div>
                  <div class="pull-left">
                     <label for="textfield"></label>
                     <input type="text" name="textfield" class="form-control form-border form-contro_w_e editformv_control" id="textfield">
                  </div>
               </div> -->
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>联系人：</div>
                  <div class="pull-left">
                     <label for="textfield"></label>
                     <input type="text" name="contacts" class="form-control form-border form-contro_w_e editformv_control" id="contacts" value="${member.contacts}">
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>联系电话：</div>
                  <div class="pull-left">
                     <label for="textfield"></label>
                     <input type="text" name="telphone" class="form-control form-border form-contro_w_e editformv_control" id="telphone" value="${member.telphone}">
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>电子邮箱：</div>
                  <div class="pull-left">
                     <label for="textfield"></label>
                     <input type="email" name="email" class="form-control form-border form-contro_w_e editformv_control" id="email" value="${member.email}">
                  </div>
               </div>
               <div class="form_btn">
                    <input type="button" name="btnsubmit" id="btnsubmit" value="提交" class="btn form-contro_w_b btn-primary" />
                    <input type="reset" name="button" id="button" value="重 置" class="btn form-contro_w_b  btn-reset" />
               </div>
            </form>
         </div>
         
      </div>
   </div>
</body>
</html>
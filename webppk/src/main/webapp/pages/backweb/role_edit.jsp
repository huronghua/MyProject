<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<base href="<%=basePath%>">
<html lang="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>权限管理</title>
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
	if (getUrlParam('roleid') != null)
	{
        $.ajax({
            type: "GET",
            url: 'role_detail',
            dataType: 'json',
            data: {
                'ID': getUrlParam('roleid'),
            },
            cache: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
            },
            success: function (data) {
            	$("#selectstatus").val(data.status);
            	$("#selectrole").val(data.roletype);
            	//系统前台
            	if (data.systemconfigure.substr(0,1)=="1")
                {
                    $("#checkbox_1").prop('checked', true);
                }
            	
            	if (data.systemconfigure.substr(2,1)=="1")
                {
                    $("#checkbox_2").prop('checked', true);
                }
            	
            	if (data.systemconfigure.substr(4,1)=="1")
                {
                    $("#checkbox_3").prop('checked', true);
                }
            	
            	if (data.systemconfigure.substr(6,1)=="1")
                {
                    $("#checkbox_4").prop('checked', true);
                }
            	
            	//基础管理
            	if (data.basicconfigure.substr(0,1)=="1")
                {
                    $("#checkbox_5").prop('checked', true);
                }
            	
            	if (data.basicconfigure.substr(2,1)=="1")
                {
                    $("#checkbox_6").prop('checked', true);
                }
            	
            	if (data.basicconfigure.substr(4,1)=="1")
                {
                    $("#checkbox_7").prop('checked', true);
                }
            	
            	if (data.basicconfigure.substr(6,1)=="1")
                {
                    $("#checkbox_8").prop('checked', true);
                }
            	
            	if (data.basicconfigure.substr(8,1)=="1")
                {
                    $("#checkbox_9").prop('checked', true);
                }
            	
            	if (data.basicconfigure.substr(10,1)=="1")
                {
                    $("#checkbox_10").prop('checked', true);
                }
            	
            	if (data.basicconfigure.substr(12,1)=="1")
                {
                    $("#checkbox_11").prop('checked', true);
                }
            	
            	//权限设置
            	if (data.authorityconfigure.substr(0,1)=="1")
                {
                    $("#checkbox_12").prop('checked', true);
                }
            	
            	if (data.authorityconfigure.substr(2,1)=="1")
                {
                    $("#checkbox_13").prop('checked', true);
                }
            }
        });
	}
	
	$("#btnsubmit").click(function(){
		var status = $("#selectstatus").val();
		var roletype = $("#selectrole").val();
		var rolename = $("#selectrole").find("option:selected").text();
		var systemconfigure = "";
		
		if (!$("#checkbox_1").is(':checked'))
		{
			systemconfigure = "0,";
		}
		else
		{
			systemconfigure = "1,"
		}
		
		if (!$("#checkbox_2").is(':checked'))
		{
			systemconfigure += "0,";
		}
		else
		{
			systemconfigure += "1,";
		}
		
		if (!$("#checkbox_3").is(':checked'))
		{
			systemconfigure += "0,";
		}
		else
		{
			systemconfigure += "1,";
		}
		
		if (!$("#checkbox_4").is(':checked'))
		{
			systemconfigure += "0";
		}
		else
		{
			systemconfigure += "1";
		}
		
		var basicconfigure = "";
		if (!$("#checkbox_5").is(':checked'))
		{
			basicconfigure = "0,";
		}
		else
		{
			basicconfigure = "1,"
		}
		
		if (!$("#checkbox_6").is(':checked'))
		{
			basicconfigure += "0,";
		}
		else
		{
			basicconfigure += "1,";
		}
		
		if (!$("#checkbox_7").is(':checked'))
		{
			basicconfigure += "0,";
		}
		else
		{
			basicconfigure += "1,";
		}
		
		if (!$("#checkbox_8").is(':checked'))
		{
			basicconfigure += "0,";
		}
		else
		{
			basicconfigure += "1,";
		}
		
		if (!$("#checkbox_9").is(':checked'))
		{
			basicconfigure += "0,";
		}
		else
		{
			basicconfigure += "1,";
		}
		
		if (!$("#checkbox_10").is(':checked'))
		{
			basicconfigure += "0,";
		}
		else
		{
			basicconfigure += "1,";
		}
		
		if (!$("#checkbox_11").is(':checked'))
		{
			basicconfigure += "0";
		}
		else
		{
			basicconfigure += "1";
		}
		
		//权限管理
		var authorityconfigure = "";
		if (!$("#checkbox_12").is(':checked'))
		{
			authorityconfigure += "0,";
		}
		else
		{
			authorityconfigure += "1,";
		}
		
		if (!$("#checkbox_13").is(':checked'))
		{
			authorityconfigure += "0";
		}
		else
		{
			authorityconfigure += "1";
		}
		
		if (getUrlParam('roleid') == null)
		{
	        $.ajax({
	            type: "POST",
	            url: 'add_role',
	            data:
	                    {
	                        'status': status,
	                        'roletype': roletype,
	                        'rolename': rolename,
	                        'systemconfigure': systemconfigure,
	                        'basicconfigure': basicconfigure,
	                        'authorityconfigure': authorityconfigure,
	                    },
	            dataType: 'json',
	            cache: false,
	            error: function (XMLHttpRequest, textStatus, errorThrown) {
	                alert(XMLHttpRequest.status);
	            },
	            success: function (data) {
	                if ("success" == data) {
	                    window.location.href = "pages/backweb/role_list.jsp";
	                }
	            }
	        });
		}
		else
		{
	        $.ajax({
	            type: "POST",
	            url: 'save_role',
	            data:{
	            	     'id': getUrlParam('roleid'),
	            	     'status': status,
	                     'roletype': roletype,
	                     'rolename': rolename,
	                     'systemconfigure': systemconfigure,
	                     'basicconfigure': basicconfigure,
	                     'authorityconfigure': authorityconfigure,
	                  },
	            dataType: 'json',
	            cache: false,
	            error: function (XMLHttpRequest, textStatus, errorThrown) {
	                alert(XMLHttpRequest.status);
	            },
	            success: function (data) {
	                if ("success" == data) {
	                    window.location.href = "pages/backweb/role_list.jsp";
	                }
	            }
	        });
		}

		return true;
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

//客户端校验
function check() {
	//系统前台
	if (!$("#checkbox_1").is(':checked')
            && !$("#checkbox_2").is(':checked')
            && !$("#checkbox_3").is(':checked')
            && !$("#checkbox_4").is(':checked')) {
        $("#checkbox_4").tips({
            side: 2,
            msg: '系统前台不得为空',
            bg: '#AE81FF',
            time: 3
        });
        $("#checkbox_1").focus();
        return false;
	}
	
	//系统前台
	if (!$("#checkbox_1").is(':checked')
            && !$("#checkbox_2").is(':checked')
            && !$("#checkbox_3").is(':checked')
            && !$("#checkbox_4").is(':checked')) {
        $("#checkbox_4").tips({
            side: 2,
            msg: '系统前台不得为空',
            bg: '#AE81FF',
            time: 3
        });
        $("#checkbox_1").focus();
        return false;
	}
	
	return true;
}
</script>
</head>
<body class="navbady">
   <div class="current">
      <i class="icon-iconfont-shouye"></i>
      <span>管理首页</span>><span>基本设置</span>><span>权限管理</span>><span>编辑</span>
   </div>
   <div class="container_min">
      <div class="container_edit_title">编辑内容</div>
      <div class="container_edit_contaer">
         <div class="form-group">
            <form action="" method="get">
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"><b class="red">*</b>状态：</div>
                  <div class="pull-left">
                   <label for="select">
                     <select name="selectstatus" id="selectstatus" class="form-control form-border form-contro_w_e" >
                       <option value="0">正常</option>
                       <option value="1">禁用</option>
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
               <div class="from_item_fom">
                  <div class="from_item clearboth ">
                     <div class=" editform_t tomrnw"><strong>权限设置：</strong></div>
                  </div>
                 <div class="from_item clearboth ">
                    <div class=" pull-left editform_t"><b class="red"></b>系统前台：</div>
                    <div class=" pull-left">
                        <ul class="clearboth jurisdiction_footem">
                           <li class="pull-left">
                             <input type="checkbox" name="checkbox_1" id="checkbox_1" class="form_checkbox">
                             <label for="checkbox_a">图册模块</label>
                           </li>
                           <li class="pull-left">
                             <input type="checkbox" name="checkbox_2" id="checkbox_2"  class="form_checkbox">
                             <label for="checkbox_2">文字模块</label>
                           </li>
                           <li class="pull-left">
                             <input type="checkbox" name="checkbox_3" id="checkbox_3" class="form_checkbox">
                             <label for="checkbox_3">交互模块</label>
                           </li>
                           <li class="pull-left">
                             <input type="checkbox" name="checkbox_4" id="checkbox_4" class="form_checkbox">
                             <label for="checkbox_4">高级模块</label>
                           </li>
                        </ul>
                    </div>
                 </div>
                 <div class="from_item clearboth ">
                    <div class=" pull-left editform_t"><b class="red"></b>基础管理：</div>
                    <div class=" pull-left">
                        <ul class="clearboth jurisdiction_footem">
                           <li class="pull-left">
                             <input type="checkbox" name="checkbox_5" id="checkbox_5" class="form_checkbox">
                             <label for="checkbox_a">用户管理</label>
                           </li>
                           <li class="pull-left">
                             <input type="checkbox" name="checkbox_6" id="checkbox_6"  class="form_checkbox">
                             <label for="checkbox_2">角色管理</label>
                           </li>
                           <li class="pull-left">
                             <input type="checkbox" name="checkbox_7" id="checkbox_7" class="form_checkbox">
                             <label for="checkbox_3">权限管理</label>
                           </li>
                           <li class="pull-left">
                             <input type="checkbox" name="checkbox_8" id="checkbox_8" class="form_checkbox">
                             <label for="checkbox_4">日志管理</label>
                           </li>
                           <li class="pull-left">
                             <input type="checkbox" name="checkbox_9" id="checkbox_9" class="form_checkbox">
                             <label for="checkbox_4">消息管理</label>
                           </li>
                           <li class="pull-left">
                             <input type="checkbox" name="checkbox_10" id="checkbox_10" class="form_checkbox">
                             <label for="checkbox_4">会员管理</label>
                           </li>
                           <li class="pull-left">
                             <input type="checkbox" name="checkbox_11" id="checkbox_11" class="form_checkbox">
                             <label for="checkbox_4">广告管理</label>
                           </li>
                        </ul>
                    </div>
                 </div>
                 <div class="from_item clearboth ">
                    <div class=" pull-left editform_t"2><b class="red"></b>权限设置：</div>
                    <div class=" pull-left">
                        <ul class="clearboth jurisdiction_footem">
                           <li class="pull-left">
                             <input type="checkbox" name="checkbox_12" id="checkbox_12" class="form_checkbox">
                             <label for="checkbox_a">模板管理</label>
                           </li>
                           <li class="pull-left">
                             <input type="checkbox" name="checkbox_13" id="checkbox_13"  class="form_checkbox">
                             <label for="checkbox_2">样式管理</label>
                           </li>
                        </ul>
                    </div>
                 </div>
               </div>
               <div class="form_btn">
                    <input type="button" name="btnsubmit" id="btnsubmit" value="提交"  class="btn form-contro_w_b btn-primary" />
                    <input type="reset" name="button" id="button" value="重 置" class="btn form-contro_w_b  btn-reset" />
               </div>
            </form>
         </div>
         
      </div>
   </div>
</body>
</html>

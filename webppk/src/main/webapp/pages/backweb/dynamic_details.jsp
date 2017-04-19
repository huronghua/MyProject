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
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>用户管理</title>
 <!-- Bootstrap -->
<link href="static/backweb/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="static/backweb/css/global.css">
<link href="static/backweb/css/layout.css" rel="stylesheet">
<link href="static/backweb/css/fonticon.css" rel="stylesheet">
<script src="static/preweb/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script type="text/javascript">
$(document).ready(function ($) {
	if (getUrlParam('id') != null)
	{
		$.ajax({
            type: "GET",
            url: 'dynamic_detail',
            dataType: 'json',
            data: {
                'ID': getUrlParam('id'),
            },
            cache: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
            },
            success: function (data) {
            	$("#dynamicname").val(data.dynamicname);
            	var dynamictype = data.dynamictype.split(',',2);
            	if (dynamictype[0]=='1')
            		$("#checkbox_a").prop('checked', true);
            	
            	if (dynamictype[1]=='1')
            		$("#checkbox_b").prop('checked', true);
            	
            	$("#uploadimg").attr('src',data.dynamicimage);
            	$("#dynamicdescribe").val(data.dynamicdescribe);
            }
        });
	}
	
	$('#btnsave').click(function () {
		severCheck();
	});		
});

function previewImage(file)
{
    var MAXWIDTH = 100;
    var MAXHEIGHT = 100;
    var div = document.getElementById('preview');
    if (file.files && file.files[0])
    {
        div.innerHTML = '<img id=imghead>';
        var img = document.getElementById('imghead');
        img.onload = function () {
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width = 100;
            img.height = 100;
//         img.style.marginLeft = rect.left+'px';
            img.style.marginTop = rect.top + 'px';
        }
        var reader = new FileReader();
        reader.onload = function (evt) {
            img.src = evt.target.result;
        }
        reader.readAsDataURL(file.files[0]);
    } else //兼容IE
    {
        var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
        file.select();
        var src = document.selection.createRange().text;
        div.innerHTML = '<img id=imghead>';
        var img = document.getElementById('imghead');
        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
        div.innerHTML = "<div id=divhead style='width:100px;height:100px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
    }
    
    $.ajax({
        type: "POST",
        url: 'dynamic_img',
        enctype: 'multipart/form-data',
        data: new FormData(document.getElementById("fileForm")),
        processData: false,
        contentType: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.status);
        },
        success: function (data) {
            $("#hiddynamicimg").val(data);
        }
    });
}

function clacImgZoomParam(maxWidth, maxHeight, width, height) {
    var param = {top: 0, left: 0, width: width, height: height};
    if (width > maxWidth || height > maxHeight)
    {
        rateWidth = width / maxWidth;
        rateHeight = height / maxHeight;

        if (rateWidth > rateHeight)
        {
            param.width = maxWidth;
            param.height = Math.round(height / rateWidth);
        } else
        {
            param.width = Math.round(width / rateHeight);
            param.height = maxHeight;
        }
    }

    param.left = Math.round((maxWidth - param.width) / 2);
    param.top = Math.round((maxHeight - param.height) / 2);
    return param;
}

//服务器校验
function severCheck() {
	if (check()) {
		var dynamicname = $("#dynamicname").val();
		var dynamictype = "";
		if ($("#checkbox_a").prop("checked"))
		{
			dynamictype += "1";
		}
		else
		{
			dynamictype += "0";
		}
		
		if ($("#checkbox_b").prop("checked"))
		{
			dynamictype += ",1";
		}
		else
		{
			dynamictype += ",0";
		}
		
		var imagepath = $("#hiddynamicimg").val();
		var dynamicdescribe = $("#dynamicdescribe").val();
		
		if (getUrlParam('id') == null)
		{
            $.ajax({
                type: "POST",
                url: 'dynamic_add',
                data: {
                        'dynamicname': dynamicname,
                        'dynamictype': dynamictype,
                        'imagepath': imagepath,
                        'dynamicdescribe': dynamicdescribe
                      },
                dataType: 'json',
                cache: false,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                },
                success: function (data) {
                	if ("sessiontimeout" == data)
                	{
                		top.location.href = "pages/backweb/login.jsp";
                	}
                	
                    if ("success" == data) {
                        window.location.href = "pages/backweb/dynamic_list.jsp";
                    }
                }
            });
		}
		else
		{
            $.ajax({
                type: "POST",
                url: 'dynamic_save',
                data: {
                	    'id': getUrlParam('id'),
                        'dynamicname': dynamicname,
                        'dynamictype': dynamictype,
                        'imagepath': imagepath,
                        'dynamicdescribe': dynamicdescribe
                      },
                dataType: 'json',
                cache: false,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                },
                success: function (data) {
                	if ("sessiontimeout" == data)
                	{
                		top.location.href = "pages/backweb/login.jsp";
                	}
                	
                    if ("success" == data) {
                        window.location.href = "pages/backweb/dynamic_list.jsp";
                    }
                }
            });			
		}
	}
}

//启用状态编辑
function editUse(index) {
    var row = $('#roletable').datagrid('getRows');
    $.ajax({
        type: "POST",
        url: 'role_use',
        data: {
            'ID': row[index].ID,
            'USE': row[index].Status1,
        },
        dataType: 'json',
        cache: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.status);
        },
        success: function (data) {
            if ("success" == data) {
                $('#roletable').datagrid('reload');
            }
        }
    });
}

//客户端校验
function check() {
    if ($("#dynamicname").val() == "") {
        $("#dynamicname").tips({
            side: 2,
            msg: '编号不得为空',
            bg: '#AE81FF',
            time: 3
        });
        $("#dynamicname").focus();
        return false;
    } else {
    	
        $("#dynamicname").val(jQuery.trim($('#dynamicname').val()));
    }
    
    if ($("#checkbox_a").prop("checked")==false
       && $("#checkbox_b").prop("checked")==false) {
        $("#checkbox_b").tips({
            side: 2,
            msg: '适用类型必选',
            bg: '#AE81FF',
            time: 3
        });
        $("#checkbox_b").focus();
        return false;
    }
    
    return true;
}

//获取url中的参数
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg); //匹配目标参数
    if (r != null)
        return unescape(r[2]);
    return null; //返回参数值
}
</script>
</head>
<body class="navbady">
   <div class="current">
      <i class="icon-iconfont-shouye"></i>
      <span>管理首页</span>><span>基本设置</span>><span>动态管理</span>><span>编辑</span>
   </div>
   <div class="container_min">
      <div class="container_edit_title">编辑内容</div>
     <form id="fileForm" action="" method="get" enctype="multipart/form-data">
       <div class="maildetails_contarl form-group">
         <div class="maildetails_colt">
            <div class="from_item clearboth ">
               <div class=" pull-left mail_edit_title">动态名称：</div>
               <div class=" pull-left mail_edit_inp">
                  <label for="dynamicname"></label>
                     <input type="text" name="dynamicname" id="dynamicname" class="form-control form-border editformv_control col-w-12">
               </div>
            </div>
            <div class="from_item clearboth">
               <div class=" pull-left mail_edit_title">适用类型：</div>
               <div class=" pull-left mail_edit_inp distable styleassembly_li">
                         <div class="distablediv">
                          <ul class="clearboth jurisdiction_footem">
                           <li class="pull-left">
                             <input type="checkbox" name="checkbox_a" id="checkbox_a" class="form_checkbox">
                             <label for="checkbox_a">载入效果</label>
                           </li>
                           <li class="pull-left">
                             <input type="checkbox" name="checkbox_b" id="checkbox_b"  class="form_checkbox">
                             <label for="checkbox_2">悬停效果</label>
                           </li>
                        </ul>
                          </div>
               </div>
            </div>
            <div class="from_item clearboth ">
               <div class=" pull-left mail_edit_title">预览图：</div>
               <div class="p_dynamicimg "><div id="preview"><img width=100 height=100 id="uploadimg" src="static/backweb/images/tep_img2.jpg"></div></div>
               <div class=" pull-left dynamicdetails_sming">
                  <div class=" pull-left smouimg"></div>
                  <div class="pull-left">
                       <div class="dynamicdupload">
                         上传图片
                         <input type="file" id="selectfile" name="selectfile" onchange="previewImage(this)" class="dynamicdupload_u">
                       </div>
                       <div class=".cor-gray">支持的图片格式：jpg、jpeg、gif和png</div>
                  </div>
               </div>
         </div>
         </div> 
         <div class="maildetails_mou">
             <textarea id='dynamicdescribe' name="dynamicdescribe" class="maildetails_rinw"></textarea>
          </div>
          </div>
          <div class="form_btn text-center">
                    <input type="button" name="btnsave" id="btnsave" value="提交"  class="btn form-contro_w_b btn-primary" />
                    <input type="reset" name="button" id="button" value="重 置" class="btn form-contro_w_b  btn-reset" />
                    <input type="hidden" name="hiddynamicimg" id="hiddynamicimg" />
               </div>
          </form>
   </div>
</body>
</html>

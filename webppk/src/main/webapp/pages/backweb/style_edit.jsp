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
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                if (getUrlParam('styleid') != null)
                {
                    $.ajax({
                        type: "POST",
                        url: 'style_detail',
                        dataType: 'json',
                        data: {
                            'ID': getUrlParam('styleid'),
                        },
                        cache: false,
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status);
                        },
                        success: function (data) {
                            $("#stylename").val(data.stylename);
                            $("#select").val(data.stylemode);
                            $("#hidstyleimg").val(data.styleimg);

                            if (data.applycontrol.indexOf("Label") != -1)
                            {
                                $("#checkbox_1").prop('checked', true);
                            }

                            if (data.applycontrol.indexOf("TextBox") != -1)
                            {
                                $("#checkbox_2").prop('checked', true);
                            }

                            if (data.applycontrol.indexOf("Bose") != -1)
                            {
                                $("#checkbox_3").prop('checked', true);
                            }

                            if (data.applycontrol.indexOf("Text") != -1)
                            {
                                $("#checkbox_4").prop('checked', true);
                            }

                            if (data.applycontrol.indexOf("Font") != -1)
                            {
                                $("#checkbox_5").prop('checked', true);
                            }
                            $("#detail").val(data.cssstyle);
                            $("#uploadimg").attr('src',data.styleimg);
                        }
                    });
                }
                
                $("#btnsubmit").click(function(){
                	severCheck();
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
                    var stylename = $("#stylename").val();
                    var imagepath = $("#hidstyleimg").val();
                    
                    var controls = "";

                    if ($("#checkbox_1").is(':checked'))
                    {
                        controls += "Label,";
                    }

                    if ($("#checkbox_2").is(':checked')) {
                        controls += "TextBox,";
                    }

                    if ($("#checkbox_3").is(':checked')) {
                        controls += "Bose,";
                    }

                    if ($("#checkbox_4").is(':checked')) {
                        controls += "Text,";
                    }

                    if ($("#checkbox_5").is(':checked')) {
                        controls += "Font,";
                    }

                    var detail = $("#detail").val();
                    var stylemode = $("#select").val();
                    $.ajax({
                        type: "POST",
                        url: 'style_img',
                        enctype: 'multipart/form-data',
                        data: new FormData(document.getElementById("fileForm")),
                        processData: false,
                        contentType: false,
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status);
                        },
                        success: function (data) {
                            $("#hidstyleimg").val(data);
                        }
                    });
                    
                    if (getUrlParam('styleid') == null)
                    {
                        $.ajax({
                            type: "POST",
                            url: 'style_add',
                            data:
                            {
                                'stylename': stylename,
                                'stylemode': stylemode,
                                'controls': controls,
                                'detail': detail,
                                'imagepath':imagepath,
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
                                    window.location.href = "pages/backweb/style_list.jsp";
                                }
                            }
                        });
                    }
                    else
                    {
                        $.ajax({
                            type: "POST",
                            url: 'style_edit',
                            data:
                            {
                            	'id': getUrlParam('styleid'),
                                'stylename': stylename,
                                'stylemode': stylemode,
                                'controls': controls,
                                'detail': detail,
                                'imagepath':imagepath,
                            },
                            dataType: 'json',
                            cache: false,
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                alert(XMLHttpRequest.status);
                            },
                            success: function (data) {
                                if ("failed" == data) {
                                    $("#loginname").tips({
                                        side: 1,
                                        msg: "用户名或密码有误",
                                        bg: '#FF5080',
                                        time: 15
                                    });
                                    $("#loginname").focus();
                                }

                                if ("success" == data) {
                                    window.location.href = "pages/backweb/style_list.jsp";
                                }
                            }
                        });
                    }
                }
                return true;
            }

            //客户端校验
            function check() {
                if ($("#stylename").val() == "") {
                    $("#stylename").tips({
                        side: 2,
                        msg: '样式名称不得为空',
                        bg: '#AE81FF',
                        time: 3
                    });
                    $("#stylename").focus();
                    return false;
                } else {
                    $("#stylename").val(jQuery.trim($('#stylename').val()));
                }
                
                if (!$("#stylename").val().match(/^[a-zA-Z\d]\w{3,11}[a-zA-Z\d]$/)) {
                    $("#stylename").tips({
                        side: 2,
                        msg: '请输入4-12位字母数字下划线组合的样式名',
                        bg: '#AE81FF',
                        time: 3
                    });
                    $("#stylename").focus();
                    return false;
                } else {
                    $("#stylename").val(jQuery.trim($('#stylename').val()));
                }

                if (!$("#checkbox_1").is(':checked')
                        && !$("#checkbox_2").is(':checked')
                        && !$("#checkbox_3").is(':checked')
                        && !$("#checkbox_4").is(':checked')
                        && !$("#checkbox_5").is(':checked')) {

                    $("#checkbox_5").tips({
                        side: 2,
                        msg: '适用组件不得为空',
                        bg: '#AE81FF',
                        time: 3
                    });
                    $("#checkbox_1").focus();
                    return false;
                }

                if ($("#detail").val() == "")
                {
                    $("#detail").tips({
                        side: 2,
                        msg: '样式内容不得为空',
                        bg: '#AE81FF',
                        time: 3
                    });
                    $("#detail").focus();
                    return false;
                } else {
                    $("#detail").val(jQuery.trim($('#detail').val()));
                }

                return true;
            }
            
            //图片预览
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
//                     img.style.marginLeft = rect.left+'px';
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
                    url: 'style_img',
                    enctype: 'multipart/form-data',
                    data: new FormData(document.getElementById("fileForm")),
                    processData: false,
                    contentType: false,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status);
                    },
                    success: function (data) {
                        $("#hidstyleimg").val(data);
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
        </script>
    </head>
    <body class="navbady">
        <div class="current">
            <i class="icon-iconfont-shouye"></i>
            <span>管理首页</span>><span>基本设置</span>><span>样式管理</span>><span>编辑</span>
        </div>
        <div class="container_min">
            <div class="container_edit_title">编辑内容</div>
                 <form id="fileForm" action="" method="get" enctype="multipart/form-data">
                <div class="maildetails_contarl  form-group">
                    <div class="maildetails_colt">
                        <div class="from_item clearboth ">
                            <div class=" pull-left mail_edit_title">样式名称：</div>
                            <div class=" pull-left mail_edit_inp">
                                <input type="text" id="stylename" name="stylename" class="form-control form-border editformv_control col-w-12" maxlength=255>
                            </div>
                        </div>

                        <div class="from_item clearboth ">
                            <div class=" pull-left mail_edit_title">使用样式：</div>
                            <div class=" pull-left mail_edit_inp">
                                <select name="select" id="select" class="form-control form-border form-contro_w_b form-controlselect" >
                                    <option value="0">Lobal</option>
                                    <option value="1">企业</option>
                                    <option value="2">个人</option>
                                </select>
                            </div>
                        </div>
                        <div class="from_item clearboth ">
                            <div class=" pull-left mail_edit_title">样式图片：</div>
                            <div class=" pull-left mail_edit_inp">
                            <div class="p_dynamicimg "><div id="preview"><img width=100 height=100 id="uploadimg" src=""></div></div>
                                <input id="selectfile" name="selectfile" type='file' onchange="previewImage(this)" accept="支持的图片格式：jpg、jpeg、gif和png" width=200></input>
                            </div>
                        </div>
                        <div class="from_item clearboth">
                            <div class=" pull-left mail_edit_title">适用组件：</div>
                            <div class=" pull-left mail_edit_inp distable ">
                                <div class="distablediv">
                                    <ul class="clearboth jurisdiction_footem">
                                        <li class="pull-left">
                                            <input type="checkbox" name="checkbox_1" id="checkbox_1" class="form_checkbox">
                                            <label for="checkbox_1">Label</label>
                                        </li>
                                        <li class="pull-left">
                                            <input type="checkbox" name="checkbox_2" id="checkbox_2"  class="form_checkbox">
                                            <label for="checkbox_2">TextBox</label>
                                        </li>
                                        <li class="pull-left">
                                            <input type="checkbox" name="checkbox_3" id="checkbox_3"  class="form_checkbox">
                                            <label for="checkbox_3">Bose</label>
                                        </li>
                                        <li class="pull-left">
                                            <input type="checkbox" name="checkbox_4" id="checkbox_4"  class="form_checkbox">
                                            <label for="checkbox_4">Text</label>
                                        </li>
                                        <li class="pull-left">
                                            <input type="checkbox" name="checkbox_5" id="checkbox_5"  class="form_checkbox">
                                            <label for="checkbox_5">Font</label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div> 
                    <div class="maildetails_mou">
                        <textarea id="detail" name="detail" cols="" rows="" class="maildetails_rinw" maxlength=10000></textarea>
                    </div>
                </div>
                <div class="form_btn text-center">
                    <input type="button" name="btnsubmit" id="btnsubmit" value="提交"  class="btn form-contro_w_b btn-primary" />
                    <input type="reset" name="button" id="button" value="重 置" class="btn form-contro_w_b  btn-reset" />
                    <input type="hidden" name="hidstyleimg" id="hidstyleimg" />
                </div>
            </form>
        </div>
    </body>
</html>

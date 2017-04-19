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
        <script src="static/preweb/js/jquery-1.7.2.min.js"></script>
        <!-- Bootstrap -->
        <link href="static/backweb/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="static/backweb/css/global.css">
        <link href="static/backweb/css/layout.css" rel="stylesheet">
        <link href="static/backweb/css/fonticon.css" rel="stylesheet">
        
        <script type="text/javascript" src="static/js/jquery.tips.js"></script>
        <script type="text/javascript" src="static/js/jquery.cookie.js"></script>

        <script type="text/javascript">
        $(document).ready(function ($) {
        	
            $('#btnsave').click(function () {
            	severCheck();
            });
        });
        
        //图片上传预览    IE是用了滤镜。
            function previewImage(file)
            {
                var MAXWIDTH = 260;
                var MAXHEIGHT = 180;
                var div = document.getElementById('preview');
                if (file.files && file.files[0])
                {
                    div.innerHTML = '<img id=imghead>';
                    var img = document.getElementById('imghead');
                    img.onload = function () {
                        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                        img.width = rect.width;
                        img.height = rect.height;
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
                    div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
                }

                if (getUrlParam('id') != "")
                {
                    //删除
                    $.ajax({
                        type: "POST",
                        url: 'template_img_delete',
                        data:
                                {
                                    'imgpath': $("#hidtemplateimgold").val(),
                                },
                        dataType: 'json',
                        cache: false,
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status);
                        },
                        success: function (data) {
  
                        }
                    });
                }
                
                $.ajax({
                    type: "POST",
                    url: 'template_img',
                    enctype: 'multipart/form-data',
                    data: new FormData(document.getElementById("fileForm")),
                    processData: false,
                    contentType: false,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status);
                    },
                    success: function (data) {
                        $("#hidtemplateimg").val(data);
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
                    var id = $("#textid").val();
                    var use = "";
                    var status = $("input[name='raduse']:checked").val();
                    var type = $("input[name='radtype']:checked").val();

                    if ($("#checkbox_1").is(':checked'))
                    {
                        use += "1,";
                    } else
                    {
                        use += "0,";
                    }

                    if ($("#checkbox_2").is(':checked'))
                    {
                        use += "1,";
                    } else
                    {
                        use += "0,";
                    }

                    if ($("#checkbox_3").is(':checked'))
                    {
                        use += "1,";
                    } else
                    {
                        use += "0,";
                    }

                    if ($("#checkbox_4").is(':checked'))
                    {
                        use += "1,";
                    } else
                    {
                        use += "0,";
                    }

                    if ($("#checkbox_5").is(':checked'))
                    {
                        use += "1,";
                    } else
                    {
                        use += "0,";
                    }

                    if ($("#checkbox_6").is(':checked'))
                    {
                        use += "1";
                    } else
                    {
                        use += "0";
                    }

                    var hot = $("#texthot").val();
                    var imagepath = $("#hidtemplateimg").val();
                    var filepath = $("#hidtemplate").val();
                    var name = $("#textname").val();
                    if (getUrlParam('id') == null)
                    {
                        $.ajax({
                            type: "POST",
                            url: 'template_add',
                            data:
                                    {
                                        'id': id,
                                        'use': use,
                                        'status': status,
                                        'type': type,
                                        'hot': hot,
                                        'imagepath': imagepath,
                                        'filepath': filepath,
                                        'name': name,
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

                            	if ("sessiontimeout" == data)
                            	{
                            		top.location.href = "pages/backweb/login.jsp";
                            	}
                                
                                if ("success" == data) {
                                    window.location.href = "pages/backweb/template_list.jsp";
                                }
                            }
                        });
                    }
                    else
                    {
                        $.ajax({
                            type: "POST",
                            url: 'template_save',
                            data:
                                    {
                                        'id': getUrlParam('id'),
                                        'numberid': id,
                                        'use': use,
                                        'status': status,
                                        'type': type,
                                        'hot': hot,
                                        'imagepath': imagepath,
                                        'filepath': filepath,
                                        'name': name,
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
                                    window.location.href = "pages/backweb/template_list.jsp";
                                }
                            }
                        });
                    }
                }
                return false;
            }

        //客户端校验
            function check() {
            	
                if ($("#textid").val() == "") {
                    $("#textid").tips({
                        side: 2,
                        msg: '编号不得为空',
                        bg: '#AE81FF',
                        time: 3
                    });
                    $("#textid").focus();
                    return false;
                } else {
                	
                    $("#textid").val(jQuery.trim($('#textid').val()));
                }
                
                var numcheck= /^[0-9]*$/;
                if (!numcheck.test($("#textid").val())) {
                    $("#textid").tips({
                        side: 2,
                        msg: '编号只能是数字',
                        bg: '#AE81FF',
                        time: 3
                    });
                    $("#textid").focus();
                    return false;
                } else {
                	
                    $("#textid").val(jQuery.trim($('#textid').val()));
                }
                
                if (!$("#checkbox_1").is(':checked')
                        && !$("#checkbox_2").is(':checked')
                        && !$("#checkbox_3").is(':checked')
                        && !$("#checkbox_4").is(':checked')
                        && !$("#checkbox_5").is(':checked')
                        && !$("#checkbox_6").is(':checked')) {

                    $("#checkbox_6").tips({
                        side: 2,
                        msg: '用途不得为空',
                        bg: '#AE81FF',
                        time: 3
                    });
                    $("#checkbox_6").focus();
                    return false;
                }

                if ($("#texthot").val() == "") {
                    $("#texthot").tips({
                        side: 2,
                        msg: '热度不得为空',
                        bg: '#AE81FF',
                        time: 3
                    });
                    $("#texthot").focus();
                    return false;
                } else {
                    $("#texthot").val(jQuery.trim($('#texthot').val()));
                }
                
                if (getUrlParam('id') == null)
                {
                    if ($("#selecttemplate").val() == "") {
                        $("#selecttemplate").tips({
                        side: 2,
                        msg: '模板不得为空',
                        bg: '#AE81FF',
                        time: 3
                       });
                    $("#selecttemplate").focus();
                    return false;
                    }
                }
                
                if (getUrlParam('id') == null)
                {
                    if ($("#selectfile").val() == "") {
                        $("#selectfile").tips({
                        side: 2,
                        msg: '模板文件不得为空',
                        bg: '#AE81FF',
                        time: 3
                       });
                    $("#selecttemplate").focus();
                    return false;
                    }
                }
                
/*                 if ($("#hidtemplate").val() == "") {
                    $("#hidtemplate").tips({
                        side: 2,
                        msg: '模板不得为空',
                        bg: '#AE81FF',
                        time: 3
                    });
                    $("#selecttemplate").focus();
                    return false;
                } else {
                    //$("#selecttemplate").val(jQuery.trim($('#hidtemplate').val()));
                } */

                
/*                 if ($("#hidtemplateimg").val() == "") {
                    $("#hidtemplateimg").tips({
                        side: 2,
                        msg: '图片不得为空',
                        bg: '#AE81FF',
                        time: 3
                    });
                    $("#selectfile").focus();
                    return false;
                } else {
                } */
                
                
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

            $(document).ready(function () {
                if (getUrlParam('id') != null)
                {
                    $.ajax({
                        type: "GET",
                        url: 'template_detail',
                        dataType: 'json',
                        data: {
                            'ID': getUrlParam('id'),
                        },
                        cache: false,
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status);
                        },
                        success: function (data) {
                            $("#textid").val(data.numberid);
                            $("#textname").val(data.name);

                            if (data.status == "0")
                            {
                                $("input[name=raduse]").val(["0"]);
                            } else
                            {
                                $("input[name=raduse]").val(["1"]);
                            }

                            if (data.websitetype == "0")
                            {
                                $("input[name=radtype]").val(["0"]);
                            } else if (data.websitetype == "1")
                            {
                                $("input[name=radtype]").val(["1"]);
                            } else if (data.websitetype == "2")
                            {
                                $("input[name=radtype]").val(["2"]);
                            }

                            var arr = new Array();
                            arr = data.useful.split(',');
                            for (var i = 0; i < arr.length; i++)
                            {
                                if (i == 0)
                                {
                                    if (arr[i] == 1)
                                    {
                                        $("input[name='checkbox_1']").attr("checked", "checked");
                                    }
                                }

                                if (i == 1)
                                {
                                    if (arr[i] == 1)
                                    {
                                        $("input[name='checkbox_2']").attr("checked", "checked");
                                    }
                                }

                                if (i == 2)
                                {
                                    if (arr[i] == 1)
                                    {
                                        $("input[name='checkbox_3']").attr("checked", "checked");
                                    }
                                }

                                if (i == 3)
                                {
                                    if (arr[i] == 1)
                                    {
                                        $("input[name='checkbox_4']").attr("checked", "checked");
                                    }
                                }

                                if (i == 4)
                                {
                                    if (arr[i] == 1)
                                    {
                                        $("input[name='checkbox_5']").attr("checked", "checked");
                                    }
                                }

                                if (i == 5)
                                {
                                    if (arr[i] == 1)
                                    {
                                        $("input[name='checkbox_6']").attr("checked", "checked");
                                    }
                                }
                            }
                            $("#texthot").val(data.hotdegree);
                            $("#hidtemplateold").val(data.filepath);
                            $("#hidtemplateimgold").val(data.imagepath);
                            $("#hidtemplate").val(data.filepath);
                            $("#hidtemplateimg").val(data.imagepath);
                            $("#uploadimg").attr("src",data.imagepath);
                            $("#selecttemplate").attr("src",data.filepath);
                        }
                    });
                }

                // 上传模板
                $("#selecttemplate").change(function () {
                    var file = $('[name="hidtemplateold"]');
                    if (getUrlParam('id') != "")
                    {
                        //删除
                        $.ajax({
                            type: "POST",
                            url: 'template_file_delete',
                            data:
                                    {
                                        'filepath': $("#hidtemplateold").val(),
                                    },
                            dataType: 'json',
                            cache: false,
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                alert(XMLHttpRequest.status);
                            },
                            success: function (data) {
                                $("#hidtemplate").val(data);
                            }
                        });

                    }
                    
                    $.ajax({
                        type: "POST",
                        url: 'template_model',
                        enctype: 'multipart/form-data',
                        data: new FormData(document.getElementById("fileForm")),
                        processData: false,
                        contentType: false,
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status);
                        },
                        success: function (data) {
                            $("#hidtemplate").val(data);
                        }
                    });
                });
            });

        </script>
    </head>
    <body class="navbady">
        <div class="current">
            <i class="icon-iconfont-shouye"></i>
            <span>管理首页</span>><span>基本设置</span>><span>模板管理</span>><span>编辑</span>
        </div>
        <div class="container_min">
            <div class="templatedetails_c">
                <div class="templatedetails_titlename">企业简约时尚商业网站模板</div>
                <div class="templatedetails_content clearboth form-group">
                    <form action="" id="fileForm" method="post" enctype ="multipart/form-data" class="" >
                        <div class="clearboth">
                            <div class="pull-left">
                                <div class="p_img "><div id="preview"><img id="uploadimg" src="static/backweb/images/tep_img2.jpg"></div></div>
                                <div class="tbtm clearboth text-center">
                                    <input type="file" id="selectfile" name="selectfile" onchange="previewImage(this)" accept="image/gif,image/jpeg,image/x-png"/>
                                </div>
                            </div>
                            <div class="p_info pull-left">
                                <ul class="clearboth">
                                    <Li class="clearboth">
                                        <div class="pull-left kwsname">编号：</div>
                                        <div class="pull-left">
                                           <input type="text" name="textid" id="textid" class="form-control form-border form-contro_w_b" > 
                                        </div>
                                    </li>
                                    <Li class="clearboth">
                                        <div class="pull-left kwsname">标题：</div>
                                        <div class="pull-left"><input type="text" name="textname" id="textname" class="form-control form-border form-contro_w_b" > 
                                        </div>
                                    </li>
                                    <Li class="clearboth">
                                        <div class="pull-left kwsname">状态：</div>
                                        <div class="pull-left">
                                            <div class="fmtu distable">
                                                <div class="distablediv">
                                                    <ul class="clearboth jurisdiction_footem">
                                                        <li class="pull-left">
                                                            <input type="radio" name="raduse" id="raduse" checked="checked" value="0" class="form_checkbox">
                                                            <label for="radio1">启用</label>
                                                        </li>
                                                        <li class="pull-left">
                                                            <input type="radio" name="raduse" id="raduse" value="1" class="form_checkbox">
                                                            <label for="radio2">禁用</label>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div> 
                                        </div>
                                    </Li>
                                    <Li class="clearboth">
                                        <div class="pull-left kwsname">类型：</div>
                                        <div class="pull-left">
                                            <div class="fmtu distable">
                                                <div class="distablediv">
                                                    <ul class="clearboth jurisdiction_footem">
                                                        <li class="pull-left">
                                                            <input type="radio" name="radtype" id="radtype" checked="checked" value="0" class="form_checkbox">
                                                            <label for="radio1">PC版</label>
                                                        </li>
                                                        <li class="pull-left">
                                                            <input type="radio" name="radtype" id="radtype" value="1" class="form_checkbox">
                                                            <label for="radio2">手机版</label>
                                                        </li>
                                                        <li class="pull-left">
                                                            <input type="radio" name="radtype" id="radtype" value="2" class="form_checkbox">
                                                            <label for="radio3">PC版+手机版</label>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div> 
                                        </div>
                                    </Li>
                                    <Li class="clearboth">
                                        <div class="pull-left kwsname">用途：</div>
                                        <div class="pull-left">
                                            <div class="fmtu distable">
                                                <div class="distablediv">
                                                    <ul class="clearboth jurisdiction_footem">
                                                        <li class="pull-left">
                                                            <input type="checkbox" name="checkbox_1" id="checkbox_1" class="form_checkbox">
                                                            <label for="checkbox_a">商城</label>
                                                        </li>
                                                        <li class="pull-left">
                                                            <input type="checkbox" name="checkbox_2" id="checkbox_2"  class="form_checkbox">
                                                            <label for="checkbox_2">门户</label>
                                                        </li>
                                                        <li class="pull-left">
                                                            <input type="checkbox" name="checkbox_3" id="checkbox_3"  class="form_checkbox">
                                                            <label for="checkbox_2">企业</label>
                                                        </li>
                                                        <li class="pull-left">
                                                            <input type="checkbox" name="checkbox_4" id="checkbox_4"  class="form_checkbox">
                                                            <label for="checkbox_2">个人</label>
                                                        </li>
                                                        <li class="pull-left">
                                                            <input type="checkbox" name="checkbox_5" id="checkbox_5"  class="form_checkbox">
                                                            <label for="checkbox_2">论坛</label>
                                                        </li>
                                                        <li class="pull-left">
                                                            <input type="checkbox" name="checkbox_6" id="checkbox_6"  class="form_checkbox">
                                                            <label for="checkbox_2">资讯</label>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div> 

                                        </div>

                                    </Li>
                                    <Li class="clearboth">
		                                 <div class="pull-left kwsname">颜色分类：</div>
		                                 <div class="pull-left">
		                                    <div class="unttmpcolorcr">
		                                        <ul class="clearboth">
		                                           <li class="pull-left bg_red artive"></li>
		                                           <li class="pull-left bg_blue "></li>
		                                           <li class="pull-left bg_black "></li>
		                                           <li class="pull-left bg_orange"></li>
		                                           <li class="pull-left bg_violet"></li>
		                                           <li class="pull-left bg_gray"></li>
		                                           <li class="pull-left bg_darkred"></li>
		                                           <li class="pull-left bg_green"></li>
		                                        </ul>
		                                    </div>
		                                 </div>
		                             </Li>
                                    <Li class="clearboth">
                                        <div class="pull-left kwsname">热度：</div>
                                        <div class="pull-left"><input type="text" name="texthot" id="texthot" class="form-control form-border form-contro_w_b"> 
                                        </div>
                                    </Li>
                                    <Li class="clearboth">
                                        <div class="pull-left kwsname">上传模板：</div>
                                        <div class="pull-left">
                                            <input type="file" id="selecttemplate" name="selecttemplate"/>
                                        </div>
                                    </Li>
                                </ul>
                            </div>
                        </div>
                        <div class="form_btn">
                            <input type="button" name="btnsave" id="btnsave" value="提交"  class="btn form-contro_w_b btn-primary" />
                            <input type="reset" name="button" id="button" value="重 置" class="btn form-contro_w_b  btn-reset" />
                            <input type="hidden" name="hidtemplate" id="hidtemplate" />
                            <input type="hidden" name="hidtemplateimg" id="hidtemplateimg" />
                            <input type="hidden" name="hidtemplateold" id="hidtemplateold" />
                            <input type="hidden" name="hidtemplateimgold" id="hidtemplateimgold" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
<script>
$(document).ready(function(){
	var $tab_li = $('.unttmpcolorcr li');
	$tab_li.click(function(){
		$(this).addClass('artive').siblings().removeClass('artive');
	});	
});
</script>
    </body>
</html>

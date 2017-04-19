<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <title>用户管理</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="css/global.css">
        <link href="css/layout.css" rel="stylesheet">
        <link href="css/fonticon.css" rel="stylesheet">
        <script src="../../static/js/jquery-1.7.2.js"></script>
        <script type="text/javascript" src="../../static/js/jquery.tips.js"></script>
        <script type="text/javascript" src="../../static/js/jquery.cookie.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                if (getUrlParam('styleid') != "")
                {
                    $.ajax({
                        type: "GET",
                        url: '../../style_detail',
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
                    var stylename = $("#stylename").val();
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
                        controls += "Font";
                    }

                    var detail = $("#detail").val();
                    var stylemode = $("#select").val();
                    if (getUrlParam('styleid') == "")
                    {
                        $.ajax({
                            type: "POST",
                            url: '../../style_add',
                            data:
                                    {
                                        'stylename': stylename,
                                        'stylemode': stylemode,
                                        'controls': controls,
                                        'detail': detail,
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
                                    window.location.href = "pages/preweb/register.html";
                                }
                            }
                        });
                    }
                    else
                    {
                        $.ajax({
                            type: "POST",
                            url: '../../style_edit',
                            data:
                            {
                            	'id': getUrlParam('styleid'),
                                'stylename': stylename,
                                'stylemode': stylemode,
                                'controls': controls,
                                'detail': detail,
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
                                    window.location.href = "pages/preweb/register.html";
                                }
                            }
                        });
                    }
                }
                return false;
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
        </script>
    </head>
    <body class="navbady">
        <div class="current">
            <i class="icon-iconfont-shouye"></i>
            <span>管理首页</span>><span>基本设置</span>><span>样式管理</span>><span>编辑</span>
        </div>
        <div class="container_min">
            <div class="container_edit_title">编辑内容</div>
            <form action="" method="get">
                <div class="maildetails_contarl  form-group">
                    <div class="maildetails_colt">
                        <div class="from_item clearboth ">
                            <div class=" pull-left mail_edit_title">样式名称：</div>
                            <div class=" pull-left mail_edit_inp">
                                <label id="lblstylename" for="textfield"></label>
                                <input type="text" id="stylename" name="stylename" class="form-control form-border editformv_control col-w-12">
                            </div>
                        </div>

                        <div class="from_item clearboth ">
                            <div class=" pull-left mail_edit_title">使用样式：</div>
                            <div class=" pull-left mail_edit_inp">
                                <label id="lblstylename" for="textfield"></label>
                                <select name="select" id="select" class="form-control form-border form-contro_w_b form-controlselect" >
                                    <option value="0">Lobal</option>
                                    <option value="1">企业</option>
                                    <option value="2">个人</option>
                                </select>
                            </div>
                        </div>

                        <div class="from_item clearboth">
                            <div class=" pull-left mail_edit_title">适用组件：</div>
                            <div class=" pull-left mail_edit_inp distable styleassembly_li">
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
                        <textarea id="detail" name="detail" cols="" rows="" class="maildetails_rinw"></textarea>
                    </div>
                </div>
                <div class="form_btn text-center">
                    <input type="submit" onclick="return severCheck();" name="button" id="button" value="提交"  class="btn form-contro_w_b btn-primary" />
                    <input type="reset" name="button" id="button" value="重 置" class="btn form-contro_w_b  btn-reset" />
                </div>
            </form>
        </div>
    </body>
</html>

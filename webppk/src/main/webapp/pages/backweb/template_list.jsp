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
        <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <title>角色管理</title>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="static/backweb/css/global.css">
        <link href="static/backweb/css/layout.css" rel="stylesheet">
        <link href="static/backweb/css/fonticon.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="static/jquery-easyui/themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="static/jquery-easyui/themes/icon.css">
        <script src="static/js/jquery-1.7.2.js"></script>
        <script type="text/javascript" src="static/js/jquery.tips.js"></script>
        <script type="text/javascript" src="static/jquery-easyui/jquery.min.js"></script>
        <script type="text/javascript" src="static/jquery-easyui/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="static/jquery-easyui/jquery.easyui.mobile.js"></script>
        <script type="text/javascript" src="static/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
            	
                initpage();

                var totalcount = 0;
                var bolpage = false;
                var pageindex = 0;
                var pagesize = 0;
                $.ajax({
                    type: "GET",
                    url: 'template_count',
                    dataType: 'json',
                    cache: false,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status);
                    },
                    success: function (data) {
                        totalcount = data;
                        var page = 1;
                        var rows = 9;
                        $("#pagecontrol").pagination({
                            total: totalcount,
                            pageSize: 9,
                            pageList: [9, 18, 27],
                            onSelectPage: function (pageNumber, pageSize) {
                                bolpage = true;
                                pageindex = pageNumber;
                                pagesize = pageSize;
                                getData(pageNumber, pageSize,"","","");
                            }
                        });
                    }
                });

                if (bolpage == false)
                {
                    getData(1, 9,"","","");
                    bolpage = true;
                }
                
                $("#btnquery").click(function () {
                	var modelname = $("#txtmodelname").val();
                	var templatetype = $("#selecttype").val();
                	var templateorder = $("#selectorder").val();
                	initpage();
                	getData(1, 9,modelname,templatetype,templateorder);
                	
                    $.ajax({
                        type: "GET",
                        url: 'template_count',
                        data: {
                            'modelname': modelname,
                            'templatetype': templatetype,
                            'templateorder': templateorder,
                        },
                        dataType: 'json',
                        cache: false,
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status);
                        },
                        success: function (data) {
                            totalcount = data;
                            var page = 1;
                            var rows = 9;
                            $("#pagecontrol").pagination({
                                total: totalcount,
                                pageSize: 9,
                                pageList: [9, 18, 27],
                                onSelectPage: function (pageNumber, pageSize) {
                                    bolpage = true;
                                    pageindex = pageNumber;
                                    pagesize = pageSize;
                                    getData(pageNumber, pageSize,"","","");
                                }
                            });
                        }
                    });
                });
                
                $("#kinsh1").click(function () {
                	updatestate($("#id1").val(),$("#spanstatus1").html());
                });
                
                $("#kinsh2").click(function () {
                	updatestate($("#id2").val(),$("#spanstatus2").html());
                });
                
                $("#kinsh3").click(function () {
                	updatestate($("#id3").val(),$("#spanstatus3").html());
                });
                
                $("#kinsh4").click(function () {
                	updatestate($("#id4").val(),$("#spanstatus4").html());
                });
                
                $("#kinsh5").click(function () {
                	updatestate($("#id5").val(),$("#spanstatus5").html());
                });
                
                $("#kinsh6").click(function () {
                	updatestate($("#id6").val(),$("#spanstatus6").html());
                });
                
                $("#kinsh7").click(function () {
                	updatestate($("#id7").val(),$("#spanstatus7").html());
                });
                
                $("#kinsh8").click(function () {
                	updatestate($("#id8").val(),$("#spanstatus8").html());
                });
                
                $("#kinsh9").click(function () {
                	updatestate($("#id9").val(),$("#spanstatus9").html());
                });
                
                $("#del1").click(function () {
                	deldata($("#id1").val());
                });
                
                $("#del2").click(function () {
                	deldata($("#id2").val());
                });
                
                $("#del3").click(function () {
                	deldata($("#id3").val());
                });
                
                $("#del4").click(function () {
                	deldata($("#id4").val());
                });
                
                $("#del5").click(function () {
                	deldata($("#id5").val());
                });
                
                $("#del6").click(function () {
                	deldata($("#id6").val());
                });
                
                $("#del7").click(function () {
                	deldata($("#id7").val());
                });
                
                $("#del8").click(function () {
                	deldata($("#id8").val());
                });
                
                $("#del9").click(function () {
                	deldata($("#id9").val());
                });
            });

            
            function initpage()
            {
                $("#templatelist1").hide();//隐藏div  
                $("#title1").html("");
                $("#spanid1").html("");
                $("#spanstatus1").html("");
                $("#spantype1").html("");
                $("#spanuse1").html("");
                $("#title1").html("");
                $("#spanidtext1").html("");
                $("#spanstatustext1").html("");
                $("#spantypetext1").html("");
                $("#spanusetext1").html("");
                $("#img1").attr('src', "");

                $("#templatelist2").hide();//隐藏div  
                $("#title2").html("");
                $("#spanid2").html("");
                $("#spanstatus2").html("");
                $("#spantype2").html("");
                $("#spanuse2").html("");
                $("#spanidtext2").html("");
                $("#spanstatustext2").html("");
                $("#spantypetext2").html("");
                $("#spanusetext2").html("");
                $("#img2").attr('src', "");

                $("#templatelist3").hide();//隐藏div  
                $("#title3").html("");
                $("#spanid3").html("");
                $("#spanstatus3").html("");
                $("#spantype3").html("");
                $("#spanuse3").html("");
                $("#spanidtext3").html("");
                $("#spanstatustext3").html("");
                $("#spantypetext3").html("");
                $("#spanusetext3").html("");
                $("#img3").attr('src', "");

                $("#templatelist4").hide();//隐藏div  
                $("#title4").html("");
                $("#spanid4").html("");
                $("#spanstatus4").html("");
                $("#spantype4").html("");
                $("#spanuse4").html("");
                $("#spanidtext4").html("");
                $("#spanstatustext4").html("");
                $("#spantypetext4").html("");
                $("#spanusetext4").html("");
                $("#img4").attr('src', "");

                $("#templatelist5").hide();//隐藏div  
                $("#title5").html("");
                $("#spanid5").html("");
                $("#spanstatus5").html("");
                $("#spantype5").html("");
                $("#spanuse5").html("");
                $("#spanidtext5").html("");
                $("#spanstatustext5").html("");
                $("#spantypetext5").html("");
                $("#spanusetext5").html("");
                $("#img5").attr('src', "");

                $("#templatelist6").hide();//隐藏div  
                $("#title6").html("");
                $("#spanid6").html("");
                $("#spanstatus6").html("");
                $("#spantype6").html("");
                $("#spanuse6").html("");
                $("#spanidtext6").html("");
                $("#spanstatustext6").html("");
                $("#spantypetext6").html("");
                $("#spanusetext6").html("");
                $("#img6").attr('src', "");

                $("#templatelist7").hide();//隐藏div  
                $("#title7").html("");
                $("#spanid7").html("");
                $("#spanstatus7").html("");
                $("#spantype7").html("");
                $("#spanuse7").html("");
                $("#spanidtext7").html("");
                $("#spanstatustext7").html("");
                $("#spantypetext7").html("");
                $("#spanusetext7").html("");
                $("#img7").attr('src', "");

                $("#templatelist8").hide();//隐藏div  
                $("#title8").html("");
                $("#spanid8").html("");
                $("#spanstatus8").html("");
                $("#spantype8").html("");
                $("#spanuse8").html("");
                $("#spanidtext8").html("");
                $("#spanstatustext8").html("");
                $("#spantypetext8").html("");
                $("#spanusetext8").html("");
                $("#img8").attr('src', "");
                
                $("#templatelist9").hide();//隐藏div  
            }
            
            //删除记录
            function deldata(id)
            {
           	  $.ajax({
                 type: "POST",
                 url: 'template_del',
                 data: {
                     'id': id,
                 },
                 dataType: 'json',
                 cache: false,
                 error: function (XMLHttpRequest, textStatus, errorThrown) {
                     alert(XMLHttpRequest.status);
                 },
                 success: function (data) {
                 	  var modelname = $("#txtmodelname").val();
                	  var templatetype = $("#selecttype").val();
                	  var templateorder = $("#selectorder").val();
                	  initpage();
                	  getData(1, 9,modelname,templatetype,templateorder);
                   }
        	   });
            }
            
            //更新状态  
            function updatestate(id,status)
            {
             	 var statusval = 0;
            	 if (status=='启用')
            	 {
            		 statusval = 1;
            	 }
            	 else
            	 {
            		 statusval = 0; 
            	 }
            	 
            	 $.ajax({
                     type: "POST",
                     url: 'template_status',
                     data: {
                         'id': id,
                         'status': statusval,
                     },
                     dataType: 'json',
                     cache: false,
                     error: function (XMLHttpRequest, textStatus, errorThrown) {
                         alert(XMLHttpRequest.status);
                     },
                     success: function (data) {
                     	var modelname = $("#txtmodelname").val();
                    	var templatetype = $("#selecttype").val();
                    	var templateorder = $("#selectorder").val();
                    	initpage();
                    	getData(1, 9,modelname,templatetype,templateorder);
                     }
            	});
            }
            
            function getData(page, rows,modelname,selecttype,templateorder)
            {
                $.ajax({
                    type: "POST",
                    url: 'template_list',
                    data: {
                        'page': page,
                        'rows': rows,
                        'modelname': modelname,
                        'selecttype': selecttype,
                        'templateorder': templateorder,
                    },
                    dataType: 'json',
                    cache: false,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status);
                    },
                    success: function (data) {
                        for (var i = 0; i < data.length; i++) {  //循环数据
                            if (i == 0)
                            {
                                $("#templatelist1").show();//隐藏div  
                                $("#title1").html(data[i].name);
                                $("#spanid1").html(data[i].numberid);
                                if (data[i].status == "0")
                                {
                                    $("#spanstatus1").html("启用");
                                    $("#kinsh1").html("禁用");
                                } else
                                {
                                    $("#spanstatus1").html("禁用");
                                    $("#kinsh1").html("启用");
                                }

                                if (data[i].websitetype == "0")
                                {
                                    $("#spantype1").html("PC版");
                                } else if (data[i].websitetype == "1")
                                {
                                    $("#spantype1").html("手机版 ");
                                } else
                                {
                                    $("#spantype1").html("PC版+手机版  ");
                                }

                                //用途
                                var arr = data[i].useful.split(',');
                                var useful = "";
                                for (var j in arr) {
                                    if (useful == "")
                                    {
                                        useful = gettext(j, arr[j]);
                                    }
                                }

                                $("#spanuse1").html(useful);
                                $("#spanidtext1").html("编号：");
                                $("#spanstatustext1").html("状态：");
                                $("#spantypetext1").html("类型：");
                                $("#spanusetext1").html("用途：");
                                $("#img1").attr('src', data[i].imagepath);
                                $("#id1").val(data[i].id);
                                $("#detail1").attr('href', 'pages\\backweb\\template_details.jsp?id=' + data[i].id);
                            }

                            if (i == 1)
                            {
                                $("#templatelist2").show();//隐藏div  
                                $("#title2").html(data[i].name);
                                $("#spanid2").html(data[i].numberid);
                                if (data[i].status == "0")
                                {
                                    $("#spanstatus2").html("启用");
                                    $("#kinsh2").html("禁用");
                                } else
                                {
                                    $("#spanstatus2").html("禁用");
                                    $("#kinsh2").html("启用");
                                }

                                if (data[i].websitetype == "0")
                                {
                                    $("#spantype2").html("PC版");
                                } else if (data[i].websitetype == "1")
                                {
                                    $("#spantype2").html("手机版 ");
                                } else
                                {
                                    $("#spantype2").html("PC版+手机版  ");
                                }

                                //用途
                                var arr = data[i].useful.split(',');
                                var useful = "";
                                for (var j in arr) {
                                    if (useful == "")
                                    {
                                        useful = gettext(j, arr[j]);
                                    }
                                }

                                $("#spanuse2").html(useful);
                                $("#spanidtext2").html("编号：");
                                $("#spanstatustext2").html("状态：");
                                $("#spantypetext2").html("类型：");
                                $("#spanusetext2").html("用途：");
                                $("#img2").attr('src', data[i].imagepath);
                                $("#id2").val(data[i].id);
                                $("#detail2").attr('href', 'pages\\backweb\\template_details.jsp?id=' + data[i].id);
                            }

                            if (i == 2)
                            {
                                $("#templatelist3").show();//隐藏div  
                                $("#title3").html(data[i].name);
                                $("#spanid3").html(data[i].numberid);
                                if (data[i].status == "0")
                                {
                                    $("#spanstatus3").html("启用");
                                    $("#kinsh3").html("禁用");
                                } else
                                {
                                    $("#spanstatus3").html("禁用");
                                    $("#kinsh3").html("启用");
                                }
                                
                                if (data[i].websitetype == "0")
                                {
                                    $("#spantype3").html("PC版");
                                } else if (data[i].websitetype == "1")
                                {
                                    $("#spantype3").html("手机版 ");
                                } else
                                {
                                    $("#spantype3").html("PC版+手机版  ");
                                }

                                //用途
                                var arr = data[i].useful.split(',');
                                var useful = "";
                                for (var j in arr) {
                                    if (useful == "")
                                    {
                                        useful = gettext(j, arr[j]);
                                    }
                                }

                                $("#spanuse3").html(useful);
                                $("#spanidtext3").html("编号：");
                                $("#spanstatustext3").html("状态：");
                                $("#spantypetext3").html("类型：");
                                $("#spanusetext3").html("用途：");
                                $("#img3").attr('src', data[i].imagepath);
                                $("#id3").val(data[i].id);
                                $("#detail3").attr('href', 'pages\\backweb\\template_details.jsp?id=' + data[i].id);
                            }

                            if (i == 3)
                            {
                                $("#templatelist4").show();//隐藏div  
                                $("#title4").html(data[i].name);
                                $("#spanid4").html(data[i].numberid);
                                if (data[i].status == "0")
                                {
                                    $("#spanstatus4").html("启用");
                                    $("#kinsh4").html("禁用");
                                } else
                                {
                                    $("#spanstatus4").html("禁用");
                                    $("#kinsh4").html("启用");
                                }

                                if (data[i].websitetype == "0")
                                {
                                    $("#spantype4").html("PC版");
                                } else if (data[i].websitetype == "1")
                                {
                                    $("#spantype4").html("手机版 ");
                                } else
                                {
                                    $("#spantype4").html("PC版+手机版  ");
                                }

                                //用途
                                var arr = data[i].useful.split(',');
                                var useful = "";
                                for (var j in arr) {
                                    if (useful == "")
                                    {
                                        useful = gettext(j, arr[j]);
                                    }
                                }

                                $("#spanuse4").html(useful);
                                $("#spanidtext4").html("编号：");
                                $("#spanstatustext4").html("状态：");
                                $("#spantypetext4").html("类型：");
                                $("#spanusetext4").html("用途：");
                                $("#img4").attr('src', data[i].imagepath);
                                $("#id4").val(data[i].id);
                                $("#detail4").attr('href', 'pages\\backweb\\template_details.jsp?id=' + data[i].id);
                            }

                            if (i == 4)
                            {
                                $("#templatelist5").show();//隐藏div  
                                $("#title5").html(data[i].name);
                                $("#spanid5").html(data[i].numberid);
                                if (data[i].status == "0")
                                {
                                    $("#spanstatus5").html("启用");
                                    $("#kinsh5").html("禁用");
                                } else
                                {
                                    $("#spanstatus5").html("禁用");
                                    $("#kinsh5").html("启用");
                                }

                                if (data[i].websitetype == "0")
                                {
                                    $("#spantype5").html("PC版");
                                } else if (data[i].websitetype == "1")
                                {
                                    $("#spantype5").html("手机版 ");
                                } else
                                {
                                    $("#spantype5").html("PC版+手机版  ");
                                }

                                //用途
                                var arr = data[i].useful.split(',');
                                var useful = "";
                                for (var j in arr) {
                                    if (useful == "")
                                    {
                                        useful = gettext(j, arr[j]);
                                    }
                                }

                                $("#spanuse5").html(useful);
                                $("#spanidtext5").html("编号：");
                                $("#spanstatustext5").html("状态：");
                                $("#spantypetext5").html("类型：");
                                $("#spanusetext5").html("用途：");
                                $("#img5").attr('src', data[i].imagepath);
                                $("#id5").val(data[i].id);
                                $("#detail5").attr('href', 'pages\\backweb\\template_details.jsp?id=' + data[i].id);
                            }

                            if (i == 5)
                            {
                                $("#templatelist6").show();
                                $("#title6").html(data[i].name);
                                 $("#spanid6").html(data[i].numberid);
                                 if (data[i].status == "0")
                                 {
                                     $("#spanstatus6").html("启用");
                                     $("#kinsh6").html("禁用");
                                 } else
                                 {
                                     $("#spanstatus6").html("禁用");
                                     $("#kinsh6").html("启用");
                                 }
                         
                                 if (data[i].websitetype=="0")
                                 {
                                 $("#spantype6").html("PC版");
                                 }
                                 else if(data[i].websitetype=="1")
                                 {
                                 $("#spantype6").html("手机版 ");
                                 }
                                 else
                                 {
                                 $("#spantype6").html("PC版+手机版  ");
                                 }
                         
                                 //用途
                                 var arr = data[i].useful.split(',');
                                 var useful = "";
                                 for( var j in arr){
                                   if (useful == "")
                                   {
                                       useful = gettext(j,arr[j]);
                                   }
                                 }
                         
                                 $("#spanuse6").html(useful);
                                 $("#spanidtext6").html("编号：");
                                 $("#spanstatustext6").html("状态：");
                                 $("#spantypetext6").html("类型：");
                                 $("#spanusetext6").html("用途：");
                                 $("#img6").attr('src', data[i].imagepath);
                                 $("#id6").val(data[i].id);
                                 $("#detail6").attr('href', 'pages\\backweb\\template_details.jsp?id=' + data[i].id);
                            }

                            if (i == 6)
                            {
                                $("#templatelist7").show();//隐藏div  
                                $("#title7").html(data[i].name);
                                $("#spanid7").html(data[i].numberid);
                                if (data[i].status == "0")
                                {
                                    $("#spanstatus7").html("启用");
                                    $("#kinsh7").html("禁用");
                                } else
                                {
                                    $("#spanstatus7").html("禁用");
                                    $("#kinsh7").html("启用");
                                }

                                if (data[i].websitetype == "0")
                                {
                                    $("#spantype7").html("PC版");
                                } else if (data[i].websitetype == "1")
                                {
                                    $("#spantype7").html("手机版 ");
                                } else
                                {
                                    $("#spantype7").html("PC版+手机版  ");
                                }

                                //用途
                                var arr = data[i].useful.split(',');
                                var useful = "";
                                for (var j in arr) {
                                    if (useful == "")
                                    {
                                        useful = gettext(j, arr[j]);
                                    }
                                }

                                $("#spanuse7").html(useful);
                                $("#spanidtext7").html("编号：");
                                $("#spanstatustext7").html("状态：");
                                $("#spantypetext7").html("类型：");
                                $("#spanusetext7").html("用途：");
                                $("#img7").attr('src', data[i].imagepath);
                                $("#id7").val(data[i].id);
                                $("#detail7").attr('href', 'pages\\backweb\\template_details.jsp?id=' + data[i].id);
                            }

                            if (i == 7)
                            {
                                $("#templatelist8").show();//隐藏div  
                                $("#title8").html(data[i].name);
                                $("#spanid8").html(data[i].numberid);
                                if (data[i].status == "0")
                                {
                                    $("#spanstatus8").html("启用");
                                    $("#kinsh8").html("禁用");
                                } else
                                {
                                    $("#spanstatus8").html("禁用");
                                    $("#kinsh8").html("启用");
                                }

                                if (data[i].websitetype == "0")
                                {
                                    $("#spantype8").html("PC版");
                                } else if (data[i].websitetype == "1")
                                {
                                    $("#spantype8").html("手机版 ");
                                } else
                                {
                                    $("#spantype8").html("PC版+手机版  ");
                                }

                                //用途
                                var arr = data[i].useful.split(',');
                                var useful = "";
                                for (var j in arr) {
                                    if (useful == "")
                                    {
                                        useful = gettext(j, arr[j]);
                                    }
                                }
                                
                                $("#spanuse8").html(useful);
                                $("#spanidtext8").html("编号：");
                                $("#spanstatustext8").html("状态：");
                                $("#spantypetext8").html("类型：");
                                $("#spanusetext8").html("用途：");
                                $("#img8").attr('src', data[i].imagepath);
                                $("#id8").val(data[i].id);
                                $("#detail8").attr('href', 'pages\\backweb\\template_details.jsp?id=' + data[i].id);
                            }
                            
                            if (i == 8)
                            {
                                $("#templatelist9").show();//隐藏div  
                                $("#title9").html(data[i].name);
                                $("#spanid9").html(data[i].numberid);
                                if (data[i].status == "0")
                                {
                                    $("#spanstatus9").html("启用");
                                    $("#kinsh9").html("禁用");
                                } else
                                {
                                    $("#spanstatus9").html("禁用");
                                    $("#kinsh9").html("启用");
                                }

                                if (data[i].websitetype == "0")
                                {
                                    $("#spantype9").html("PC版");
                                } else if (data[i].websitetype == "1")
                                {
                                    $("#spantype9").html("手机版 ");
                                } else
                                {
                                    $("#spantype9").html("PC版+手机版  ");
                                }

                                //用途
                                var arr = data[i].useful.split(',');
                                var useful = "";
                                for (var j in arr) {
                                    if (useful == "")
                                    {
                                        useful = gettext(j, arr[j]);
                                    }
                                }
                                
                                $("#spanuse9").html(useful);
                                $("#spanidtext9").html("编号：");
                                $("#spanstatustext9").html("状态：");
                                $("#spantypetext9").html("类型：");
                                $("#spanusetext9").html("用途：");
                                $("#img9").attr('src', data[i].imagepath);
                                $("#id9").val(data[i].id);
                                $("#detail9").attr('href', 'pages\\backweb\\template_details.jsp?id=' + data[i].id);
                            }
                        }
                    }
                });
            }

            function gettext(index, data) 
            {
                if (index == 0 && data == "1")
                {
                    return "商城";
                }

                if (index == 1 && data == "1")
                {
                    return "门户";
                }

                if (index == 2 && data == "1")
                {
                    return "企业";
                }

                if (index == 3 && data == "1")
                {
                    return "个人";
                }

                if (index == 4 && data == "1")
                {
                    return "论坛";
                }

                if (index == 5 && data == "1")
                {
                    return "资讯 ";
                }

                return "";
            }
        </script>
    </head>
    <body class="navbady">
        <div class="current">
            <i class="icon-iconfont-shouye"></i>
            <span>管理首页</span>><span>基本设置</span>><span>模板管理</span>
        </div>
        <div class="container_min">
            <div class="listoperation clearboth">
                <a href="/ppk/pages/backweb/template_details.jsp" class=" pull-left listoperation_add">
                    <i class="icon-iconfont-add"></i> 添加模板
                </a>
                <div class=" pull-left listoperation_search form-group">
                    <form action="" method="get">
                        <div class="pull-left form_item_inline">
                            <label for="textfield">模板名称：</label>
                            <input type="text" name="txtmodelname" id="txtmodelname"  class="form-control form-border form-contro_w_b" id="textfield">
                        </div>
                        <div class="pull-left form_item_inline">
                            <label for="textfield">类型：</label>
                            <select name="selecttype" id="selecttype" class="form-control form-border form-contro_w_b form-controlselect" >
                                <option value="0">全部</option>
                                <option value="1">企业</option>
                                <option value="2">个人</option>
                            </select>
                        </div>
                        <div class="pull-left form_item_inline">
                            <label for="textfield">排序：</label>
                            <select name="selectorder" id="selectorder" class="form-control form-border form-contro_w_b form-controlselect" >
                                <option value="0">默认</option>
                                <option value="1">时间排序</option>
                            </select>
                        </div>
                        <div class="pull-left">
                            <input type="button" name="btnquery" id="btnquery" class="btn btn-primary " value="提交">
                        </div>
                    </form>
                </div>       
            </div>
            <div class="templatelist">
                <ul class="templatelist_grep clearboth">
                    <!--------------------------------item-------------------------------->
                    <li class="templatelist_item pull-left">
                        <div id="templatelist1" class="templatelist_item_min">
                            <div id="imgdiv1" name="imgdiv1" class="img"><img id="img1" name="img1" width="400" height="260" src="static/backweb/images/tep_img1.jpg" ></div>
                            <div id="title1" name="title1" class="title">企业简约时尚商业网站</div>
                            <div class="info clearboth">
                                <div class=" pull-left text-hidden"><span id="spanidtext1">编号：</span><span id="spanid1">5232520</span></div>
                                <div class=" pull-left text-hidden"><span id="spanstatustext1">状态：</span><b class="red"><span id="spanstatus1">启用</span></b></div>
                                <div class=" pull-left text-hidden"><span id="spantypetext1">类型：</span><span id="spantype1">PC版+移动版</span></div>
                                <div class=" pull-left text-hidden"><span id="spanusetext1">用途：</span></span><span id="spanuse1">商业网站</span></div>
                                <input type="hidden" name="id1" id="id1" />
                            </div>
                            <div class="tbtm clearboth">
                                <a id="detail1"  href="template_details.jsp" class="btn pull-left">详情 </a>
                                <a id="kinsh1"  class="btn blue pull-left">禁用 </a>
                                <a id="del1" href="" class="btn  red pull-left">删除 </a>
                            </div>
                            
                            
                        </div>
                    </li>
                    <!--------------------------------item-------------------------------->
                    <li class="templatelist_item pull-left">
                        <div id="templatelist2" class="templatelist_item_min">
                            <div id="imgdiv2" name="imgdiv2" class="img"><img id="img2" name="img2" width="400" height="260" src="static/backweb/images/tep_img2.jpg"></div>
                            <div id="title2" name="title2" class="title">企业简约时尚商业网站</div>
                            <div class="info clearboth">
                                <div class=" pull-left text-hidden"><span id="spanidtext2">编号：</span><span id="spanid2">5232520</span></div>
                                <div class=" pull-left text-hidden"><span id="spanstatustext2">状态：</span><b class="red"><span id="spanstatus2">启用</span></b></div>
                                <div class=" pull-left text-hidden"><span id="spantypetext2">类型：</span><span id="spantype2">PC版+移动版</span></div>
                                <div class=" pull-left text-hidden"><span id="spanusetext2">用途：</span><span id="spanuse2">商业网站</span></div>
                                <input type="hidden" name="id2" id="id2" />
                            </div>
                            <div class="tbtm clearboth">
                                <a  id="detail2" href="template_details.html" class="btn pull-left">详情 </a>
                                <a  id="kinsh2"  class="btn blue pull-left">禁用 </a>
                                <a  id="del2" class="btn  red pull-left">删除 </a>
                            </div>
                        </div>
                    </li>
                    <!--------------------------------item-------------------------------->
                    <li class="templatelist_item pull-left">
                        <div id="templatelist3" class="templatelist_item_min">
                            <div id="imgdiv3" name="imgdiv3" class="img"><img id="img3" name="img3" width="400" height="260" src="static/backweb/images/tep_img2.jpg"></div>
                            <div id="title3" name="title3" class="title">企业简约时尚商业网站</div>
                            <div class="info clearboth">
                                <div class=" pull-left text-hidden"><span id="spanidtext3">编号：</span><span id="spanid3">5232520</span></div>
                                <div class=" pull-left text-hidden"><span id="spanstatustext3">状态：</span><b class="red"><span id="spanstatus3">启用</span></b></div>
                                <div class=" pull-left text-hidden"><span id="spantypetext3">类型：</span><span id="spantype3">PC版+移动版</span></div>
                                <div class=" pull-left text-hidden"><span id="spanusetext3">用途：</span><span id="spanuse3">商业网站</span></div>
                                <input type="hidden" name="id3" id="id3" />
                            </div>
                            <div class="tbtm clearboth">
                                <a  id="detail3" href="template_details.html" class="btn pull-left">详情 </a>
                                <a  id="kinsh3"  class="btn blue pull-left">禁用 </a>
                                <a  id="del3" class="btn  red pull-left">删除 </a>
                            </div>
                        </div>
                    </li>
                    <!--------------------------------item-------------------------------->
                    <li class="templatelist_item pull-left">
                        <div id="templatelist4" class="templatelist_item_min">
                            <div id="imgdiv4" name="imgdiv4" class="img"><img id="img4" name="img4" width="400" height="260" src="static/backweb/images/tep_img2.jpg"></div>
                            <div id="title4" name="title4" class="title">企业简约时尚商业网站</div>
                            <div class="info clearboth">
                                <div class=" pull-left text-hidden"><span id="spanidtext4">编号：</span><span id="spanid4">5232520</span></div>
                                <div class=" pull-left text-hidden"><span id="spanstatustext4">状态：</span><b class="red"><span id="spanstatus4">启用</span></b></div>
                                <div class=" pull-left text-hidden"><span id="spantypetext4">类型：</span><span id="spantype4">PC版+移动版</span></div>
                                <div class=" pull-left text-hidden"><span id="spanusetext4">用途：</span><span id="spanuse4">商业网站</span></div>
                                <input type="hidden" name="id4" id="id4" />
                            </div>
                            <div class="tbtm clearboth">
                                <a  id="detail4" href="template_details.html" class="btn pull-left">详情 </a>
                                <a  id="kinsh4"  class="btn blue pull-left">禁用 </a>
                                <a  id="del4" class="btn  red pull-left">删除 </a>
                            </div>
                        </div>
                    </li>
                    <!--------------------------------item-------------------------------->
                    <li class="templatelist_item pull-left">
                        <div id="templatelist5" class="templatelist_item_min">
                            <div id="imgdiv5" name="imgdiv5" class="img"><img id="img5" name="img5" width="400" height="260" src="static/backweb/images/tep_img2.jpg"></div>
                            <div id="title5" name="title5" class="title">企业简约时尚商业网站</div>
                            <div class="info clearboth">
                                <div class=" pull-left text-hidden"><span id="spanidtext5">编号：</span><span id="spanid5">5232520</span></div>
                                <div class=" pull-left text-hidden"><span id="spanstatustext5">状态：</span><b class="red"><span id="spanstatus5">启用</span></b></div>
                                <div class=" pull-left text-hidden"><span id="spantypetext5">类型：</span><span id="spantype5">PC版+移动版</span></div>
                                <div class=" pull-left text-hidden"><span id="spanusetext5">用途：</span><span id="spanuse5">商业网站</span></div>
                                <input type="hidden" name="id5" id="id5" />
                            </div>
                            <div class="tbtm clearboth">
                                <a id="detail5" href="template_details.html" class="btn pull-left">详情 </a>
                                <a id="kinsh5" class="btn blue pull-left">禁用 </a>
                                <a id="del5" class="btn  red pull-left">删除 </a>
                            </div>
                        </div>
                    </li>
                    <!--------------------------------item-------------------------------->
                    <li class="templatelist_item pull-left">
                        <div id="templatelist6" class="templatelist_item_min">
                            <div id="imgdiv6" name="imgdiv6" class="img"><img id="img6" name="img6" width="400" height="260" src="static/backweb/images/tep_img2.jpg"></div>
                            <div id="title6" name="title6" class="title">企业简约时尚商业网站</div>
                            <div class="info clearboth">
                                <div class=" pull-left text-hidden"><span id="spanidtext6">编号：</span><span id="spanid6">5232520</span></div>
                                <div class=" pull-left text-hidden"><span id="spanstatustext6">状态：</span><b class="red"><span id="spanstatus6">启用</span></b></div>
                                <div class=" pull-left text-hidden"><span id="spantypetext6">类型：</span><span id="spantype6">PC版+移动版</span></div>
                                <div class=" pull-left text-hidden"><span id="spanusetext6">用途：</span><span id="spanuse6">商业网站</span></div>
                                <input type="hidden" name="id6" id="id6" />
                            </div>
                            <div class="tbtm clearboth">
                                <a id="detail6" href="template_details.html" class="btn pull-left">详情 </a>
                                <a id="kinsh6" class="btn blue pull-left">禁用 </a>
                                <a id="del6" class="btn  red pull-left">删除 </a>
                            </div>
                        </div>
                    </li>
                    <!--------------------------------item-------------------------------->
                    <li class="templatelist_item pull-left">
                        <div id="templatelist7" class="templatelist_item_min">
                            <div id="imgdiv7" name="imgdiv7" class="img"><img id="img7" name="img7" width="400" height="260" src="static/backweb/images/tep_img2.jpg"></div>
                            <div id="title7" name="title7" class="title">企业简约时尚商业网站</div>
                            <div class="info clearboth">
                                <div class=" pull-left text-hidden"><span id="spanidtext7">编号：</span><span id="spanid7">5232520</span></div>
                                <div class=" pull-left text-hidden"><span id="spanstatustext7">状态：</span><b class="red"><span id="spanstatus7">启用</span></b></div>
                                <div class=" pull-left text-hidden"><span id="spantypetext7">类型：</span><span id="spantype7">PC版+移动版</span></div>
                                <div class=" pull-left text-hidden"><span id="spanusetext7">用途：</span><span id="spanuse7">商业网站</span></div>
                                <input type="hidden" name="id7" id="id7" />
                            </div>
                            <div class="tbtm clearboth">
                                <a id="detail7" href="template_details.html" class="btn pull-left">详情 </a>
                                <a id="kinsh7" class="btn blue pull-left">禁用 </a>
                                <a id="del7" class="btn  red pull-left">删除 </a>
                            </div>
                        </div>
                    </li>
                    <!--------------------------------item-------------------------------->
                    <li class="templatelist_item pull-left">
                        <div id="templatelist8" class="templatelist_item_min">
                            <div id="imgdiv8" name="imgdiv8" class="img"><img id="img8" name="img8" width="400" height="260" src="static/backweb/images/tep_img2.jpg"></div>
                            <div id="title8" name="title8" class="title">企业简约时尚商业网站</div>
                            <div class="info clearboth">
                                <div class=" pull-left text-hidden"><span id="spanidtext8">编号：</span><span id="spanid8">5232520</span></div>
                                <div class=" pull-left text-hidden"><span id="spanstatustext8">状态：</span><b class="red"><span id="spanstatus8">启用</span></b></div>
                                <div class=" pull-left text-hidden"><span id="spantypetext8">类型：</span><span id="spantype8">PC版+移动版</span></div>
                                <div class=" pull-left text-hidden"><span id="spanusetext8">用途：</span><span id="spanuse8">商业网站</span></div>
                                <input type="hidden" name="id8" id="id8" />
                            </div>
                            <div class="tbtm clearboth">
                                <a id="detail8" href="template_details.html" class="btn pull-left">详情 </a>
                                <a id="kinsh8" class="btn blue pull-left">禁用 </a>
                                <a id="del8" class="btn  red pull-left">删除 </a>
                            </div>
                        </div>
                    </li>
                    <li class="templatelist_item pull-left">
                        <div id="templatelist9" class="templatelist_item_min">
                            <div id="imgdiv9" name="imgdiv9" class="img"><img id="img9" name="img9" width="400" height="260" src="static/backweb/images/tep_img2.jpg"></div>
                            <div id="title9" name="title9" class="title">企业简约时尚商业网站</div>
                            <div class="info clearboth">
                                <div class=" pull-left text-hidden"><span id="spanidtext9">编号：</span><span id="spanid9">5232520</span></div>
                                <div class=" pull-left text-hidden"><span id="spanstatustext9">状态：</span><b class="red"><span id="spanstatus9">启用</span></b></div>
                                <div class=" pull-left text-hidden"><span id="spantypetext9">类型：</span><span id="spantype9">PC版+移动版</span></div>
                                <div class=" pull-left text-hidden"><span id="spanusetext9">用途：</span><span id="spanuse9">商业网站</span></div>
                                <input type="hidden" name="id9" id="id9" />
                            </div>
                            <div class="tbtm clearboth">
                                <a id="detail9" href="template_details.html" class="btn pull-left">详情 </a>
                                <a id="kinsh9" class="btn blue pull-left">禁用 </a>
                                <a id="del9" class="btn  red pull-left">删除 </a>
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="easyui-panel">
                    <div id="pagecontrol" class="easyui-pagination" data-options="total:114,showPageList: false"></div>
                </div>

<!--                 <div class="listpaging ">

                    <ul>
                        <li class="previous">上一页</li>
                        <li class="artive">1</li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                        <li><a href="">6</a></li>
                        <li><a href="">7</a></li>
                        <li><a href="">8</a></li>
                        <li><a href="">9</a></li>
                        <li class="next"><a href="">下一页</a></li>
                    </ul>
                </div> -->
            </div>
        </div>
    </body>
</html>

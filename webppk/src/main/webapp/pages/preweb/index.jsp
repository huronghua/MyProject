<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
<link href="../ppk/static/preweb/css/main.css" rel="stylesheet">
<link rel="stylesheet" href="../ppk/static/preweb/css/global.css">
<link href="../ppk/static/preweb/css/layout.css" rel="stylesheet">
<link href="../ppk/static/preweb/css/fontsico.css" rel="stylesheet">
<script type="text/javascript"
	src="../ppk/static/preweb/js/jquery-1.11.3.js"></script>
<script src="../ppk/static/preweb/js/jquery.easydropdown.js"></script>
<link rel="stylesheet" href="../ppk/static/preweb/css/easydropdown.css" />
<script type="text/javascript"
	src="../ppk/static/preweb/js/jquery.range.js"></script>
<script type="text/javascript"
	src="../ppk/static/js/jquery.cxcolor.min.js"></script>
<link href="../ppk/static/preweb/css/jquery.range.css" rel="stylesheet">

<script src="../ppk/static/js/jquery.easydropdown.js"></script>
<link rel="stylesheet" href="../ppk/static/css/easydropdown.css" />
<script type="text/javascript" src="../ppk/static/js/jquery.range.js"></script>
<script type="text/javascript" src="../ppk/static/js/style.js"></script>
<link href="../ppk/static/css/jquery.range.css" rel="stylesheet">
<link rel="stylesheet" href="../ppk/static/css/jquery.cxcolor.css">
<script type="text/javascript"
	src="../ppk/static/js/jquery.nicescroll.js"></script>
<link rel="stylesheet" href="../ppk/static/css/jquery-ui.min.css">
<link rel="stylesheet" type="text/css"
	href="../ppk/static/jquery-easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="../ppk/static/jquery-easyui/themes/icon.css">
<script type="text/javascript"
	src="../ppk/static/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="../ppk/static/jquery-easyui/jquery.easyui.mobile.js"></script>
<script type="text/javascript" src="../ppk/static/js/jquery.tips.js"></script>
<script type="text/javascript"
	src="../ppk/static/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="../ppk/static/preweb/js/common.js"></script>
<script type="text/javascript" src="../ppk/static/preweb/js/selecttemplate.js"></script>
<script type="text/javascript" src="../ppk/static/preweb/js/articlenotice.js"></script>
<script type="text/javascript" src="../ppk/static/preweb/js/articlelayer.js"></script>
<link rel="stylesheet" href="../ppk/static/css/user.css">
<link rel="stylesheet" href="../ppk/static/fanshilei.css">
<script>
	$(function() {
		//fanshilei
		
		$("#auxiliary-btn").toggle(function() {
			$(".main-content").addClass("grid");
		}, function() {
			$(".main-content").removeClass("grid");
		});

		$("#fullScreen-btn").toggle(function() {
			fullScreen();
		}, function() {
			exitFullScreen();
		});

		$("#page-setup-btn").click(function() {
			$("#page-setup").show();
		});
		$("#seo-btn").click(function() {
			$("#seo-setup").show();
		});
		$("#attribute-btn").click(function() {
			$("#attribute-setup").show();
		});

		//var obj = $(window.frames["iframeResult"].document).find("#maincontent"); 
		//alert(obj.id);
		//按钮模块
		$('#buttonmodulepop').hide();

	});

	//fsl 2016/05/20 start
	$(document)
			.ready(
					function($) {
						var selectfont = '';
						//颜色设置用
						var selectcolor = '';
						//边框设置
						var border = '';
						
						//动态库
						$('#dropdynamic').change(function() {
							alert("1234");
						});
						
						$('#dropdynamic').combobox({    
						    onChange : function(n,o){
								//动态样式取得
/* 	 						    $.ajax({
	                                type: "GET",
	                                url: 'getdynamiclist',
	                    			data : {
	                    				'ID' : n
	                    			},
	                                dataType: 'json',
	                                cache: false,
	                                error: function (XMLHttpRequest, textStatus, errorThrown) {
	                                    alert(XMLHttpRequest.status);
	                                },
	                                success: function (data) {
	                        	        var stylelistimg = '<ul class="clearboth">';
	                        	        $.each(data.list,function(i,item){
	                        		        stylelistimg += '<li class="pull-left active"><div id="div' + i + '">';
	                        		        stylelistimg += '<img id="dynamic" width="119" height="115" src=' + item.dynamicimage + '/>'
	                        		        stylelistimg += '</div></li>';
	                                    });
	                        	       stylelistimg += "</ul>";
	                        	       $("#pridynamicgroup").html("");
	                        	       $("#pridynamicgroup").append(stylelistimg);
	                                }
	                           });	 */
						    }  
						});
						
						//投影背景
						$('#partsbox_img_Projectioncolor')
								.change(
										function() {
											var shadowstyle = '';
											var shadowstyletmp = '';
											var backcolor = $(
													'#partsbox_img_Projectioncolor')
													.css('background-color');
											backcolor = backcolor.split('(', 2)[1];

											if ($('#maincontent1 img').css(
													'box-shadow') == 'none')
												return;
											if ($('#maincontent1 img').css(
													'box-shadow').indexOf(
													"rgba") == -1) {
												shadowstyletmp = $(
														'#maincontent1 img')
														.css('box-shadow');

												shadowstyletmp = shadowstyletmp
														.split(')', 2)[1];
												shadowstyle = "rgba("
														+ backcolor
																.substr(
																		0,
																		backcolor.length - 1)
														+ ",255"
														+ ")"
														+ " "
														+ shadowstyletmp.split(
																' ', 5)[1]
														+ " "
														+ shadowstyletmp.split(
																' ', 5)[2]
														+ " "
														+ shadowstyletmp.split(
																' ', 5)[3]
														+ " "
														+ shadowstyletmp.split(
																' ', 5)[4];
												$('#maincontent1 img').css(
														'box-shadow',
														shadowstyle);
											}
										});

						//投影透明
						$('#imageprojectionTrans')
								.slider(
										{
											min : 0,
											max : 255,
											step : 1,
											showTip : true,
											onChange : function(value) {
												var shadowstyle = '';
												var shadowstyletmp = '';
												var backcolor = $(
														'#partsbox_img_Projectioncolor')
														.css('background-color');
												backcolor = backcolor.split(
														'(', 2)[1];
												shadowstyletmp = $(
														'#maincontent1 img')
														.css('box-shadow');
												shadowstyletmp = shadowstyletmp
														.split(')', 2)[1];
												shadowstyle = "rgba("
														+ backcolor
																.substr(
																		0,
																		backcolor.length - 1)
														+ ","
														+ value
														/ 255
														+ ")"
														+ " "
														+ shadowstyletmp.split(
																' ', 5)[1]
														+ " "
														+ shadowstyletmp.split(
																' ', 5)[2]
														+ " "
														+ shadowstyletmp.split(
																' ', 5)[3]
														+ " "
														+ shadowstyletmp.split(
																' ', 5)[4];
												$('#maincontent1 img').css(
														'box-shadow',
														shadowstyle);

											}
										});

						//描边
						$('#partsbox_imgbordercolor').change(
								function() {
									$('#maincontent1 img').parent().css(
											'border', border);
									var colour = $('#partsbox_imgbordercolor')
											.css('background-color');
									colour = colour.replace(/rgb/i, "rgba");
									var newBGColor = colour.split(')', 2) + 1
											+ ')';
									$('#maincontent1 img').css('border-color',
											newBGColor);
								});

						$('#imageborer').slider(
								{
									min : 0,
									max : 255,
									step : 1,
									showTip : true,
									onChange : function(value) {
										$('#maincontent1 img').css('border',
												value + 'px' + ' solid');
									}
								});

						//描边透明度
						$('#imagealpha').slider(
								{
									min : 0,
									max : 255,
									step : 1,
									showTip : true,
									onChange : function(value) {
										var oldBGColor = $('#maincontent1 img')
												.css('border-color');
										var newBGColor = '';
										if (oldBGColor.indexOf('rgba') == -1) {
											oldBGColor = oldBGColor.replace(
													/rgb/i, 'rgba');
											newBGColor = oldBGColor.split(')',
													2)
													+ value / 255 + ')';
										} else {
											newBGColor = oldBGColor.split(',',
													3)
													+ ',' + value / 255 + ')';
										}

										$('#maincontent1 img').css({
											'border-color' : newBGColor
										});
									}
								});

						//投影
						//投影大小X
						$('#imageprojectionX')
								.slider(
										{
											min : 0,
											max : 255,
											step : 1,
											showTip : true,
											onChange : function(value) {
												if ($('#maincontent1 img').css(
														'box-shadow') == 'none') {

													$('#maincontent1 img')
															.css(
																	{
																		'box-shadow' : 'rgba(0,0,0,255) 0px 0px 0px 0px'
																	});

												} else {
													var imageshadow = new String();
													var imagenewshadow = new String();
													imageshadow = $(
															'#maincontent1 img')
															.css('box-shadow');
													imagenewshadow = imageshadow
															.split(')', 2)[1];

													/*             		if ($('#maincontent1 img').css('box-shadow').indexOf('rgba')==-1)
													 {
													 $('#maincontent1 img').css('box-shadow').replace('rgb','rgba');
													 imageshadowstyle = $('#maincontent1 img').css('box-shadow').split(')',2)[0] + ",0" + ")"; 
													 alert(imageshadowstyle);
													 }
													 else
													 { */
													imageshadowstyle = imageshadow
															.split(')', 2)[0]
															+ ")"
															+ " "
															+ value
															+ "px"
															+ " "
															+ imagenewshadow
																	.split(' ',
																			5)[2]
															+ " "
															+ imagenewshadow
																	.split(' ',
																			5)[3]
															+ " "
															+ imagenewshadow
																	.split(' ',
																			5)[4];
													/* } */

													$('#maincontent1 img')
															.css(
																	{
																		'box-shadow' : imageshadowstyle
																	});
												}
											}
										});

						//投影大小Y
						$('#imageprojectionY')
								.slider(
										{
											min : 0,
											max : 255,
											step : 1,
											showTip : true,
											onChange : function(value) {
												if ($('#maincontent1 img').css(
														'box-shadow') == 'none') {
													$('#maincontent1 img')
															.css(
																	{
																		'box-shadow' : '0px 0px 0px 0px rgba(0,0,0,255)'
																	});
												} else {
													var imageshadow = new String();
													var imagenewshadow = new String();
													imageshadow = $(
															'#maincontent1 img')
															.css('box-shadow');
													imagenewshadow = imageshadow
															.split(')', 2)[1];

													var imageshadowstyle = imageshadow
															.split(')', 2)[0]
															+ ")"
															+ " "
															+ imagenewshadow
																	.split(' ',
																			5)[1]
															+ " "
															+ value
															+ "px"
															+ " "
															+ imagenewshadow
																	.split(' ',
																			5)[3]
															+ " "
															+ imagenewshadow
																	.split(' ',
																			5)[4];

													$('#maincontent1 img')
															.css(
																	{
																		'box-shadow' : imageshadowstyle
																	});
												}
											}
										});

						//投影blur
						$('#imageprojectionBlur')
								.slider(
										{
											min : 0,
											max : 255,
											step : 1,
											showTip : true,
											onChange : function(value) {
												if ($('#maincontent1 img').css(
														'box-shadow') == 'none') {
													$('#maincontent1 img')
															.css(
																	{
																		'box-shadow' : '0px 0px 0px 0px rgba(0,0,0,255)'
																	});
												} else {
													var imageshadow = new String();
													var imagenewshadow = new String();
													imageshadow = $(
															'#maincontent1 img')
															.css('box-shadow');
													imagenewshadow = imageshadow
															.split(')', 2)[1];

													var imageshadowstyle = imageshadow
															.split(')', 2)[0]
															+ ")"
															+ " "
															+ imagenewshadow
																	.split(' ',
																			5)[1]
															+ " "
															+ imagenewshadow
																	.split(' ',
																			5)[2]
															+ " "
															+ value
															+ "px"
															+ " "
															+ imagenewshadow
																	.split(' ',
																			5)[4];

													$('#maincontent1 img')
															.css(
																	{
																		'box-shadow' : imageshadowstyle
																	});
												}
											}
										});

						//扩展
						$('#imageprojectionSpread')
								.slider(
										{
											min : 0,
											max : 255,
											step : 1,
											showTip : true,
											onChange : function(value) {
												if ($('#maincontent1 img').css(
														'box-shadow') == 'none') {
													$('#maincontent1 img')
															.css(
																	{
																		'box-shadow' : '0px 0px 0px 0px rgba(0,0,0,255)'
																	});
												} else {
													var imageshadow = new String();
													var imagenewshadow = new String();
													imageshadow = $(
															'#maincontent1 img')
															.css('box-shadow');
													imagenewshadow = imageshadow
															.split(')', 2)[1];

													var imageshadowstyle = imageshadow
															.split(')', 2)[0]
															+ ")"
															+ " "
															+ imagenewshadow
																	.split(' ',
																			5)[1]
															+ " "
															+ imagenewshadow
																	.split(' ',
																			5)[2]
															+ " "
															+ imagenewshadow
																	.split(' ',
																			5)[3]
															+ " "
															+ value
															+ "px";

													$('#maincontent1 img')
															.css(
																	{
																		'box-shadow' : imageshadowstyle
																	});
												}
											}
										});

						//背景颜色
						//imageprojectionBackcolor
						$('#partsbox_imgbackgroundcolor').change(
								function() {
									$('#maincontent1 img').parent().css(
											'border', border);
									var colour = $(
											'#partsbox_imgbackgroundcolor')
											.css('background-color');
									colour = colour.replace(/rgb/i, "rgba");
									var newBGColor = colour.split(')', 2) + 255
											+ ')';
									$('#maincontent1 img').parent().css(
											'background-color', newBGColor);
								});

						//背景颜色透明
						$('#imageprojectionBackcolor')
								.slider(
										{
											min : 0,
											max : 255,
											step : 1,
											value : 255,
											showTip : true,
											onChange : function(value) {
												if ($('#maincontent1 img').css(
														'box-shadow') == 'none') {
													$('#maincontent1 img')
															.css(
																	{
																		'box-shadow' : '0px 0px 0px 0px rgba(0,0,0,255)'
																	});
												} else {
													var colour = $(
															'#partsbox_imgbackgroundcolor')
															.css(
																	'background-color');
													colour = colour.replace(
															/rgb/i, "rgba");
													var newBGColor = colour
															.split(')', 2)
															+ value / 255 + ')';
													$('#maincontent1 img')
															.parent()
															.css(
																	{
																		'background-color' : newBGColor
																	});
												}
											}
										});

						//动态效果
						$('#divrun').click(
								function() {
									$('#maincontent1 img').attr('class',
											'animated_div');
								});

						$('#divnormal').click(function() {
							$('#maincontent1 img').attr('class', 'img');
						});

						$('#divnormal1').click(function() {
							$('#maincontent1 img').attr('class', 'img1');
						});

						$('#divnormal3').click(function() {
							$('#maincontent1 img').attr('class', 'img3');
						});

						$('#divnormal4').click(function() {
							$('#maincontent1 img').attr('class', 'img4');
						});

						//实线虚线
						$('#selectline').combobox(
								{
									onSelect : function(rec) {
										if (rec.value == 2) {
											$('#maincontent1 img').parent()
													.css('border-style',
															'dashed');
											border = $('#maincontent1 img')
													.parent().css('border');
										}
									}
								});

						//字体选择
						$('#selectfont').combobox(
								{
									onSelect : function(rec) {
										if (selectfont == 0) {
											$("#maincontent1 h1").css(
													'font-family', rec.text);
										}

										if (selectfont == 1) {
											$("#maincontent1 h2").css(
													'font-family', rec.text);
										}

										if (selectfont == 2) {
											$("#maincontent1 h3").css(
													'font-family', rec.text);
										}

										if (selectfont == 3) {
											$("#maincontent1 h4").css(
													'font-family', rec.text);
										}

										if (selectfont == 4) {
											$("#maincontent1 h5").css(
													'font-family', rec.text);
										}

										if (selectfont == 5) {
											$("#maincontent1 h6").css(
													'font-family', rec.text);
										}
									}
								});

						//字体大小选择
						$('#selectfontsize').combobox(
								{
									onSelect : function(rec) {
										if (selectfont == 0) {
											$("#maincontent1 h1").css(
													'fontSize',
													rec.value + "px");
										}

										if (selectfont == 1) {
											$("#maincontent1 h2").css(
													'fontSize',
													rec.value + "px");
										}

										if (selectfont == 2) {
											$("#maincontent1 h3").css(
													'font-size',
													rec.value + "px");
										}

										if (selectfont == 3) {
											$("#maincontent1 h4").css(
													'font-size',
													rec.value + "px");
										}

										if (selectfont == 4) {
											$("#maincontent1 h5").css(
													'font-size',
													rec.value + "px");
										}

										if (selectfont == 5) {
											$("#maincontent1 h6").css(
													'font-size',
													rec.value + "px");
										}
									}
								});

						//字体颜色设置
						$('.cxcolor')
								.click(
										function() {
											if (selectcolor == 1) {
												$("#maincontent1 h1")
														.css(
																'color',
																$(
																		'#partsbox_ititleset_color')
																		.css(
																				'background-color'));
											}

											if (selectcolor == 2) {
												$("#maincontent1 h2")
														.css(
																'color',
																$(
																		'#partsbox_ititleset_color')
																		.css(
																				'background-color'));
											}

											if (selectcolor == 3) {
												$("#maincontent1 h3")
														.css(
																'color',
																$(
																		'#partsbox_ititleset_color')
																		.css(
																				'background-color'));
											}

											if (selectcolor == 4) {
												$("#maincontent1 h4")
														.css(
																'color',
																$(
																		'#partsbox_ititleset_color')
																		.css(
																				'background-color'));
											}

											if (selectcolor == 5) {
												$("#maincontent1 h5")
														.css(
																'color',
																$(
																		'#partsbox_ititleset_color')
																		.css(
																				'background-color'));
											}

											if (selectfont == 6) {
												$("#maincontent1 h6")
														.css(
																'color',
																$(
																		'#partsbox_ititleset_color')
																		.css(
																				'background-color'));
											}
										});
						$('#property').hide();

						//按钮模块
						var bgstyle = '';
						var btnuse = '';
						//重置按钮
						$("#btnbuttonreset").click(function() {
							$('#textbtnname').val("");
							$('#btnmodulepreview').show();
							$('#btnmodulesubmit').hide();
							$('#distablediv').html("");
						});

						//提交按钮
						$("#btnmodulesubmit").click(function() {
							//$("#divcontainer").append(btnuse);
							$("#box").append(btnuse);
						});

						$(".bg_red").click(
								function() {
									bgstyle = ";background:"
											+ $(".bg_red").css(
													"background-color");
								});

						$(".bg_blue").click(
								function() {
									bgstyle = ";background:"
											+ $(".bg_blue").css(
													"background-color");
								});

						$(".bg_black").click(
								function() {
									bgstyle = ";background:"
											+ $(".bg_black").css(
													"background-color");
								});

						$(".bg_orange").click(
								function() {
									bgstyle = ";background:"
											+ $(".bg_orange").css(
													"background-color");
								});

						$(".bg_violet").click(
								function() {
									bgstyle = ";background:"
											+ $(".bg_violet").css(
													"background-color");
								});

						$(".bg_gray").click(
								function() {
									bgstyle = ";background:"
											+ $(".bg_gray").css(
													"background-color");
								});

						$(".bg_darkred").click(
								function() {
									bgstyle = ";background:"
											+ $(".bg_darkred").css(
													"background-color");
								});

						$(".bg_green").click(
								function() {
									bgstyle = ";background:"
											+ $(".bg_green").css(
													"background-color");
								});

						$("#btnmodulesubmit").hide();
						$("#btnmodulepreview").show();

						$("#btnmodulepreview")
								.click(
										function() {
											if (checkbuttonmodule()) {
												var url = '';
												var btnstyle = '';
												if ($("#texturl").val() != '') {
													if ($('#dropopentype')
															.combobox(
																	'getValue') == '0') {

														url = "onclick=javascript:window.location.href='"
																+ $("#texturl")
																		.val()
																+ "'";
													} else {
														url = "onclick=javascript:window.open('"
																+ $("#texturl")
																		.val()
																+ "')";
													}
												}

												if (bgstyle != '')
													btnstyle = " style='height:"
															+ $("#textwidth")
																	.val()
															+ "px"
															+ " ;width:"
															+ $("#textheight")
																	.val()
															+ "px"
															+ " "
															+ bgstyle + ";'";
												else
													btnstyle = " style='height:"
															+ $("#textwidth")
																	.val()
															+ "px"
															+ " ;width:"
															+ $("#textheight")
																	.val()
															+ "px" + ";'";

												btnuse = " <input type='button'"
														+ btnstyle
														+ " id='testBtn'"
														+ url
														+ " value="
														+ $('#textbtnname')
																.val() + ">";
												var btn = $(btnuse);
												$("#distablediv").append(btn);
												//addBtnEvent("testBtn");
												$("#btnmodulesubmit").show();
												$("#btnmodulepreview").hide();
											}
										});
						$('#buttonmodule').click(function() {
							$('#buttonmodulepop').show();
							//window.open("pages/preweb/interactive_button.jsp","_blank");
						});

						//<!------------------------  会员模块 模块  -------------------------->
						$('#membermodulesubmit').hide();
						$('#textmemberwidth').numberbox('setValue', 400);
						$('#textmemberheight').numberbox('setValue', 230);
						$('#membermodlogin').hide();

						//预览按钮点击
						$('#membermodulepreview').click(
								function() {
									$('#membermodulepreview').hide();
									$('#membermodulesubmit').show();
									$('#membermodlogin').show();
									$('#membermodlogin_title').html(
											$("#textmembername").val());
								});

						//会员管理
						$('#membermodule').click(function() {
							$('#membermodulepop').show();
						});

						//免费注册显示
						$('#memberregisterY').click(function() {
							$('#memberregister').show();
						});

						//免费注册不显示
						$('#memberregisterN').click(function() {
							$('#memberregister').hide();
						});

						//忘记密码显示
						$('#memberfindpassY').click(function() {
							$('#memberforget').show();
						});

						//忘记密码隐藏
						$('#memberfindpassN').click(function() {
							$('#memberforget').hide();
						});

						//提交
						$('#membermodulesubmit')
								.click(
										function() {
											$("#membermodloginvalue")
													.width(
															$(
																	'#textmemberwidth')
																	.val());
											$("#membermodloginvalue").height(
													$('#textmemberheight')
															.val());
											//$("#membermodloginvalue").css({"background-color": "yellow"});
											$("#box").html(
													$("#membermodlogincontent")
															.html());

										});

						//<!------------------------  搜索模块 模块  -------------------------->
						$('#searchmodulesubmit').hide();
						$('#textsearchwidth').numberbox('setValue', 400);
						$('#textsearchheight').numberbox('setValue', 230);
						$('#searchpromptpreview_con').hide();
						$('#searchmodulepreview').click(
								function() {
									$('#textsearchkey').attr('placeholder',
											$('#textsearchtip').val());
									var searchkey = $('#textsearchkey').val()
											.split(",");
									var searchmodulelink = '';
									for (var i = 0; i < searchkey.length; i++) {
										searchmodulelink += "<a link=''>";
										searchmodulelink += searchkey[i];
										searchmodulelink += "</a>";
									}

									$('#textsearchtitle').html(
											$('#textsearchname').val());
									$('#searchmodulehref').html(
											searchmodulelink);
									$('#searchmodulesubmit').show();
									$('#searchmodulepreview').hide();
									$('#searchpromptpreview_con').show();
								});

						$('#seachmodulefanwei_qi')
								.click(
										function() {
											$('#seachmodulefanwei_1')
													.attr('class',
															'pull-left checkboxchoice_item on_check');
											$('#seachmodulefanwei_2')
													.attr('class',
															'pull-left checkboxchoice_item on_check');
											$('#seachmodulefanwei_3')
													.attr('class',
															'pull-left checkboxchoice_item on_check');
											$('#seachmodulefanwei_4')
													.attr('class',
															'pull-left checkboxchoice_item on_check');
											$('#seachmodulefanwei_5')
													.attr('class',
															'pull-left checkboxchoice_item on_check');
											$('#seachmodulefanwei_6')
													.attr('class',
															'pull-left checkboxchoice_item on_check');
										});

						$('#searchmodule').click(function() {
							$('#searchmodulepop').show();
							//window.open("pages/preweb/interactive_button.jsp","_blank");
						});

						//提交
						$('#searchmodulesubmit')
								.click(
										function() {
											$("#searchpromptpreview_content")
													.width(
															$(
																	'#textsearchwidth')
																	.val());
											$("#searchpromptpreview_content")
													.height(
															$(
																	'#textsearchheight')
																	.val());
											if ($("#searchnamedisplay").attr(
													'class') == 'checkboxchoice_item clearboth on_check') {
												$('#textsearchtitle').show();
											} else {
												$('#textsearchtitle').hide();
											}
											/*                     $("#searchpromptpreview_content").css({"background-color": "yellow"}); */
											$("#box")
													.html(
															$(
																	"#searchpromptpreview_con")
																	.html());
										});

						//重置
						$('#searchmodulereset').click(function() {
							$("#searchpromptpreview_con").html("");
						});

						//<!------------------------二维码 模块-------------------------->
						$("#textcodewidth").numberbox('setValue', 400);
						$("#textcodeheight").numberbox('setValue', 300);
						$("#textcodepicwidth").numberbox('setValue', 400);
						$("#textcodepicheight").numberbox('setValue', 300);
						$("#codemodulepop").hide();
						$('#codemodule').click(function() {
							$('#codemodulepop').show();
							//window.open("pages/preweb/interactive_button.jsp","_blank");
						});

						$("#btncodesubmit").click(function() {
							$("#box").append($("#textcodetitle"));
							$("#box").append($("#distablecodediv"));
						});

						$('#templatecodetab1')
								.click(
										function() {
											$("#textcodetitle").html(
													$("#textcodename").val());
											if ($("#setgeneratecodr_item_code")
													.attr('class') == 'pull-left radiochoice_item on setgeneratecodr_item'
													|| $(
															"#setgeneratecodr_item_code")
															.attr('class') == 'pull-left radiochoice_item setgeneratecodr_item on') {
												$('#qrcode')
														.qrcode(
																{
																	width : $(
																			"#textcodepicwidth")
																			.val(),
																	height : $(
																			"#textcodepicheight")
																			.val(),
																	correctLevel : 0,
																	text : $(
																			"#dropcodeselect")
																			.val()
																});
											} else {
												$('#qrcode').qrcode({
													width : 200,
													height : 200,
													correctLevel : 0,
													text : window.location.href
												});
											}
										});

						//<!------------------------  分享 模块  -------------------------->
						$('#sharemodulepop').hide();
						$('#checkboxsharechoiceall').click(
								function() {
									$('#checkboxsharechoiceqq').attr('class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoicesina').attr('class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoicetcent').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoicewechat').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoicenetease').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoiceptt').attr('class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoicemobilesend').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoicesohu').attr('class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoiceshinva').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoiceskyline').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoicephoenix').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoicefriend').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoicebean').attr('class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoiceqqfriend').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoiceqqpeople').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoicebaiduspace').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoiceYoudao').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoicemccool').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoicesearch').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoicegmail').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoicesohuwebo').attr(
											'class',
											'checkboxchoice_item on_check');
									$('#checkboxsharechoicefreinfcircle').attr(
											'class',
											'checkboxchoice_item on_check');
								});

						$('#btnsharesubmit')
								.click(
										function() {
											if ($('#dropsharewidth').val() == ''
													|| $('#dropshareheight')
															.val() == ''
													|| $('#textsharename')
															.val() == '') {
												return;
											}
											var htmlcontent = '';
											htmlcontent += "<div style='width:"
													+ $('#dropsharewidth')
															.val()
													+ ";height:"
													+ $('#dropshareheight')
															.val()
													+ "' id='sharecontent'><label>"
													+ $("#textsharename").val()
													+ "</label><br>";
											htmlcontent += $(
													'#sharemoduledescribe')
													.html()
													+ "<br>";
											htmlcontent += "<br>"
													+ $('#sharemodulecontent')
															.html();

											$("#box").html(htmlcontent);
										});

						$('#sharemodule').click(function() {
							$('#sharemodulepop').show();
						});

						/* <!------------------------  留言模块 模块  --------------------------> */
						$('#btnmessagesubmit').hide();
						$('#messagemodulecontent').hide();

						$('#textmessgaewidth').numberbox('setValue', 400);
						$('#textmessageheight').numberbox('setValue', 300);

						
						$('#btnmessagepreview').click(
								function() {
									$('#messagetitle').html(
											$('#textmessagename').val());
									$('#btnmessagepreview').hide();
									$('#btnmessagesubmit').show();
									$('#messagemodulecontent').show();
								});

						//姓名
						$('#radiochoice_item_nameY').click(function() {
							$('#messagemoduleusername').show();
						});

						$('#radiochoice_item_nameN').click(function() {
							$('#messagemoduleusername').hide();
						});

						//昵称
						$('#radiochoice_item_nicknameY').click(function() {
							$('#messagemodulenikename').show();
						});

						$('#radiochoice_item_nicknameN').click(function() {
							$('#messagemodulenikename').hide();
						});

						//电话
						$('#radiochoice_item_telphoneY').click(function() {
							$('#messagemoduletelphone').show();
						});

						$('#radiochoice_item_telphoneN').click(function() {
							$('#messagemoduletelphone').hide();
						});

						//email
						$('#radiochoice_item_emailY').click(function() {
							$('#messagemoduleemail').show();
						});

						$('#radiochoice_item_emailN').click(function() {
							$('#messagemoduleemail').hide();
						});

						//主题
						$('#radiochoice_item_themeY').click(function() {
							$('#messagemoduletheme').show();
						});

						$('#radiochoice_item_themeN').click(function() {
							$('#messagemoduletheme').hide();
						});

						$('#btnmessagesubmit')
								.click(
										function() {
											if ($('#textmessagename').val() != ''
													&& $('#textmessgaewidth')
															.val() != ''
													&& $('#textmessageheight')
															.val() != '') {
												var boxclone = "<div id='box1' class='easyui-draggable' style='z-index:999;clear:both;display:block'>";
												boxclone += $(
														'#messagemodulecontent')
														.html();
												boxclone += "</div>";
												if (tagi == 0) {
													$('#box' + tagi).html(
															boxclone);
												} else {
													/* $('#maincontent1').prepend($boxclone);
													 $boxclone.append($("#messagemodulecontent").clone(true)); */
													$('#box' + tagi).html(
															boxclone);
												}

												tagi += 1;
												$('#btnmessagesubmit').hide();
												$('#btnmessagepreview').show();
											}
										});

						$('#messagemodule').click(function() {
							$('#messagemodulepop').show();
						});

						
						/* <!------------------------  图文 模块  --------------------------> */
						var imageuse = '';
						var imagefontuse = '';
						$('#textimagetemplatewidth').numberbox('setValue', 100);
						$('#textimagetemplateheight').numberbox('setValue', 83);
						$('#textimagecontentwidth').numberbox('setValue', 400);
						$('#textimagecontentheight').numberbox('setValue', 300);
						$('#imagecontentpop').hide();
						//图文模块
						$('#imagecontentmodule').click(function() {
							$('#imagecontentpop').show();
						});

						//纯文模块
						$('#imagefontmodule').click(function() {
							$('#imagefontmodulepop').show();
						});

						//文章列表
						$('#imagearticlelistmodule').click(function() {
							$('#imagearticlelistmodulepop').show();
						});

						//文章列表删除
						$('#linkarticlelistdel1').click(function() {
							var _len = $("#tableimagearticle tr").length;
							var lineindex = 0;
							$("tr[id='articlelist1']").remove();//删除当前行
						});

						$('#linkarticlelistdel2').click(function() {
							var _len = $("#tableimagearticle tr").length;
							var lineindex = 0;
							$("tr[id='articlelist2']").remove();//删除当前行
						});

						$('#linkarticlelistdel3').click(function() {
							var _len = $("#tableimagearticle tr").length;
							var lineindex = 0;
							$("tr[id='articlelist3']").remove();//删除当前行
						});

						$('#linkarticlelistdel4').click(function() {
							var _len = $("#tableimagearticle tr").length;
							var lineindex = 0;
							$("tr[id='articlelist4']").remove();//删除当前行
						});

						$('#linkarticlelistdel5').click(function() {
							var _len = $("#tableimagearticle tr").length;
							var lineindex = 0;
							$("tr[id='articlelist5']").remove();//删除当前行
						});

						$('#linkarticlelistdel6').click(function() {
							var _len = $("#tableimagearticle tr").length;
							var lineindex = 0;
							$("tr[id='articlelist6']").remove();//删除当前行
						});

						//选择图片
						$("#imagetemplateupload").change(function() {
							previewImage(this);
						});

						//图文模块提交
						$("#btnimagemodulesubmit")
								.click(
										function() {

											if (tagi == 0) {
												tagi += 1;
											}

											imageuse = '<div class="easyui-draggable">'; //创建一个父div
											imageuse += '<span>'
													+ $('#textimagemodulename')
															.val() + '</span>';
											imageuse += '<br>';
											imageuse += '<div><img src='
													+ $("#imghead").attr('src')
													+ '';
											imageuse += ' height='
													+ $(
															'#textimagetemplateheight')
															.numberbox(
																	'getValue')
													+ "'";
											imageuse += ' width='
													+ $(
															'#textimagetemplatewidth')
															.numberbox(
																	'getValue')
													+ "'";
											imageuse += " />";
											imageuse += $('#textareaimgmodule')
													.val();
											imageuse += '</div>'
											imageuse += '</div>';

											$("#box" + tagi)
													.append($(imageuse));
											//$('#maincontent1').prepend(parentdiv);
										});

						//图文模块提交
						$("#btnimagefontmodule")
								.click(
										function() {
											if (tagi == 0) {
												tagi += 1;
											}

											imagefontuse = '<div class="easyui-draggable"';
											imagefontuse += ' style="width:'
													+ $('#numberimagefontwidth')
															.numberbox(
																	'getValue')
													+ 'px';
											imagefontuse += '; height:'
													+ $(
															'#numberimagefontheight')
															.numberbox(
																	'getValue')
													+ 'px; overflow:auto;white-space:normal;word-wrap:break-word; ">';
											/*                     imagefontuse += 'width=' + $('#numberimagefontwidth').numberbox('getValue') + '';
											 imagefontuse += ' height=' + $('#numberimagefontwidth').numberbox('getValue')  + '>'; */
											imagefontuse += $(
													'#textareaimagefont').val()
													+ '</div>'
											$("#box" + tagi).append(
													$(imagefontuse));
										});

						//文章列表模块提交
						$("#btnimagearticlelistsubmit")
								.click(
										function() {
											if (tagi == 0) {
												tagi += 1;
											}
											var imagearticleuse = '';
											imagearticleuse = '<div class="easyui-draggable">';
											imagearticleuse += '<span>'
													+ $(
															'#textimagearticlelistmodulename')
															.val() + '</span>';
											imagearticleuse += '<br>';
											imagearticleuse += '<div>';
											imagearticleuse += '<table>';
											imagearticleuse += '<tr>';
											imagearticleuse += '<th align="left">标题</th>';
											imagearticleuse += '<th align="left">日期</th>';
											imagearticleuse += '</tr>';
											if ($('#textimagefontmoduleitem1')
													.val() != '') {
												imagearticleuse += '<tr>';
												imagearticleuse += '<td width="200px">';
												imagearticleuse += '<a href='
														+ $(
																'#textimagefontlinkitem1')
																.val() + '>';
												imagearticleuse += $(
														'#textimagefontmoduleitem1')
														.val();
												imagearticleuse += '</a>';
												imagearticleuse += '</td>';
												imagearticleuse += '<td>';
												imagearticleuse += $(
														'#textimagefontdateitem1')
														.datebox('getValue');
												imagearticleuse += '</td>';
												imagearticleuse += '</tr>';
											}
											if ($('#textimagefontmoduleitem2')
													.val() != '') {
												imagearticleuse += '<tr>';
												imagearticleuse += '<td width="200px">';
												imagearticleuse += '<a href='
														+ $(
																'#textimagefontlinkitem2')
																.val() + '>';
												imagearticleuse += $(
														'#textimagefontmoduleitem2')
														.val();
												imagearticleuse += '</a>';
												imagearticleuse += '</td>';
												imagearticleuse += '<td>';
												imagearticleuse += $(
														'#textimagefontdateitem2')
														.datebox('getValue');
												imagearticleuse += '</td>';
												imagearticleuse += '</tr>';
											}
											if ($('#textimagefontmoduleitem3')
													.val() != '') {
												imagearticleuse += '<tr>';
												imagearticleuse += '<td width="200px">';
												imagearticleuse += '<a href='
														+ $(
																'#textimagefontlinkitem3')
																.val() + '>';
												imagearticleuse += $(
														'#textimagefontmoduleitem3')
														.val();
												imagearticleuse += '</a>';
												imagearticleuse += '</td>';
												imagearticleuse += '<td>';
												imagearticleuse += $(
														'#textimagefontdateitem3')
														.datebox('getValue');
												imagearticleuse += '</td>';
												imagearticleuse += '</tr>';
											}
											if ($('#textimagefontmoduleitem4')
													.val() != '') {
												imagearticleuse += '<tr>';
												imagearticleuse += '<td width="200px">';
												imagearticleuse += '<a href='
														+ $(
																'#textimagefontlinkitem4')
																.val() + '>';
												imagearticleuse += $(
														'#textimagefontmoduleitem4')
														.val();
												imagearticleuse += '</a>';
												imagearticleuse += '</td>';
												imagearticleuse += '<td>';
												imagearticleuse += $(
														'#textimagefontdateitem4')
														.datebox('getValue');
												imagearticleuse += '</td>';
												imagearticleuse += '</tr>';
											}
											if ($('#textimagefontmoduleitem5')
													.val() != '') {
												imagearticleuse += '<tr>';
												imagearticleuse += '<td width="200px">';
												imagearticleuse += '<a href='
														+ $(
																'#textimagefontlinkitem5')
																.val() + '>';
												imagearticleuse += $(
														'#textimagefontmoduleitem5')
														.val();
												imagearticleuse += '</a>';
												imagearticleuse += '</td>';
												imagearticleuse += '<td>';
												imagearticleuse += $(
														'#textimagefontdateitem5')
														.datebox('getValue');
												imagearticleuse += '</td>';
												imagearticleuse += '</tr>';
											}
											if ($('#textimagefontmoduleitem6')
													.val() != '') {
												imagearticleuse += '<tr>';
												imagearticleuse += '<td width="200px">';
												imagearticleuse += '<a href='
														+ $(
																'#textimagefontlinkitem6')
																.val() + '>';
												imagearticleuse += $(
														'#textimagefontmoduleitem6')
														.val();
												imagearticleuse += '</a>';
												imagearticleuse += '</td>';
												imagearticleuse += '<td>';
												imagearticleuse += $(
														'#textimagefontdateitem6')
														.datebox('getValue');
												imagearticleuse += '</td>';
												imagearticleuse += '</tr>';
											}
											imagearticleuse += '</table>';
											imagearticleuse += '</div>';
											imagearticleuse += '</div>';
											$("#box" + tagi).append(
													$(imagearticleuse));
										});

						//表格模块
						$("#imagearticletablemodule").click(function() {
							$("#imagearticletablemodulepop").show();
						});

						//添加行
						$("#linkarticletableaddrow")
								.click(
										function() {
											var rowCount = $("#articletablemoduletable tr").length;
											var newRow = '<tr id="articletablerow'+rowCount+'">';
											newRow += '<td align="left">';
											newRow += '<input type="text" id="articletabletd1' + "-" + rowCount + '"  class="form-control form-contro_style1 form-w  settableformvin_bnan" style="width: 265px">';
											newRow += '</td>';
											newRow += '<td align="left">';
											newRow += '<input type="text" id="articletabletd2' + "-" + rowCount + '"' ;
							newRow += 'class="form-control form-contro_style1 form-w  settableformvin_bnan" style="width: 180px">';
											newRow += '</td>';
											newRow += '<td align="left">';
											newRow += '<input type="text" id="articletabletd3' + "-" + rowCount + '"' ;
							newRow += 'class="form-control form-contro_style1 form-w  settableformvin_bnan" style="width: 180px">';
											newRow += '</td>';
											newRow += '<td align="left">';
											newRow += '<input type="text" id="articletabletd4' + "-" + rowCount + '"' ;
							newRow += 'class="form-control form-contro_style1 form-w  settableformvin_bnan" style="width: 220px">';
											newRow += '</td></tr>';
											$('#articletablemoduletable')
													.append(newRow);
										});

						//添加列
						$("#linkarticletableaddcolumn")
								.click(
										function() {
											var columnCount = document
													.getElementById("articletablemoduletable").rows
													.item(0).cells.length;
											var newcol = "<td>";
											newcol += '<input type="text" id="articletabletd"' ;
							newcol += 'class="form-control form-contro_style1 form-w  settableformvin_bnan" style="width: 180px">';
											newcol += "</td>";
											$col = $(newcol);
											$(
													"#articletablemoduletable>tbody>tr")
													.append($col);
										});

						//表格模块 提交
						$("#btnarticletablesubmit")
								.click(
										function() {
											var articletableuse = '';
											if (tagi == 0) {
												tagi += 1;
											}
											$('#articletablemoduletable')
													.attr(
															'border',
															$(
																	'#numberimagearticletabletableborder')
																	.val());
											$('#articletablemoduletable')
													.css(
															'width',
															$(
																	'#numberimagearticletabletablewidth')
																	.val());
											$('#articletablemoduletable')
													.css(
															'height',
															$(
																	'#numberimagearticletabletableheight')
																	.val());

											articletableuse = '<div class="easyui-draggable">';
											articletableuse += '<span>'
													+ $(
															'#textimagearticletablemodulename')
															.val() + '</span>';
											articletableuse += '<div style=width:'
													+ $(
															'#numberimagearticletablewidth')
															.val() + '';
											articletableuse += ';height='
													+ $(
															'#numberimagearticletableheight')
															.val() + '>';
											articletableuse += $(
													'#articletablemoduletablediv')
													.html();
											articletableuse += '</div>';
											articletableuse += '</div>';
											$("#box" + tagi).append(
													$(articletableuse));
										});
						
						    //样式取得
 						    $.ajax({
                                type: "GET",
                                url: 'getstylelist',
                                dataType: 'json',
                                cache: false,
                                error: function (XMLHttpRequest, textStatus, errorThrown) {
                                    alert(XMLHttpRequest.status);
                                },
                                success: function (data) {
                        	        var stylelistimg = '<ul class="clearboth">';
                        	        $.each(data.list,function(i,item){
                        		        stylelistimg += '<li class="pull-left active"><div id="stylediv' + i + '">';
                        		        stylelistimg += '<a id="styledivimage" value=' + item.StyleName + '>';
                        		        stylelistimg += '<img id="styleimage" width="113" height="115" src=' + item.StyleImg + '/>';
                        		        stylelistimg += '</a>';
                        		        stylelistimg += '</div></li>';
                                    });
                        	       stylelistimg += "</ul>";
                        	       $("#partsbox_style").append(stylelistimg);
                                }
                           });
						    
						   //动态样式取得
/* 						   $.ajax({
                                type: "GET",
                                url: 'getdynamiclist',
                    			data : {
                    				'ID' : '0'
                    			},
                                dataType: 'json',
                                cache: false,
                                error: function (XMLHttpRequest, textStatus, errorThrown) {
                                    alert(XMLHttpRequest.status);
                                },
                                success: function (data) {
                        	        var stylelistimg = '<ul class="clearboth">';
                        	        $.each(data.list,function(i,item){
                        		        stylelistimg += '<li class="pull-left active"><div id="div' + i + '">';
                        		        stylelistimg += '<img id="dynamic" width="119" height="115" src=' + item.dynamicimage + '/>'
                        		        stylelistimg += '</div></li>';
                                    });
                        	       stylelistimg += "</ul>";
                        	       $("#pridynamicgroup").append(stylelistimg);
                                }
                           });	 */	   
						   
					});
	//fsl 2016/05/20

	//模板初始化
	function inittemplate(tabindex) {
		if (tabindex == 0) {
			$("#template_img0").attr("src", "");
			$("#template_img1-1").attr("src", "");
			$("#template_img2-1").attr("src", "");
			$("#template_img3-1").attr("src", "");
			$("#template_img4-1").attr("src", "");
			$("#template_img5-1").attr("src", "");
			$("#template_img6-1").attr("src", "");
			$("#template_img7-1").attr("src", "");
			$("#template_img8-1").attr("src", "");
			$("#template_img9-1").attr("src", "");
			$("#template_img10-1").attr("src", "");
			$("#template_img11-1").attr("src", "");
			$("#template_img12-1").attr("src", "");

			$("#pname1-1").html("");
			$("#pname2-1").html("");
			$("#pname3-1").html("");
			$("#pname4-1").html("");
			$("#pname5-1").html("");
			$("#pname6-1").html("");
			$("#pname7-1").html("");
			$("#pname8-1").html("");
			$("#pname9-1").html("");
			$("#pname10-1").html("");
			$("#pname11-1").html("");
			$("#pname12-1").html("");

			$("#template_hid1-1").val("");
			$("#template_hid2-1").val("");
			$("#template_hid3-1").val("");
			$("#template_hid4-1").val("");
			$("#template_hid5-1").val("");
			$("#template_hid6-1").val("");
			$("#template_hid7-1").val("");
			$("#template_hid8-1").val("");
			$("#template_hid9-1").val("");
			$("#template_hid10-1").val("");
			$("#template_hid11-1").val("");
			$("#template_hid12-1").val("");
		}

		if (tabindex == 1) {
			$("#template_img1-2").attr("src", "");
			$("#template_img2-2").attr("src", "");
			$("#template_img3-2").attr("src", "");
			$("#template_img4-2").attr("src", "");
			$("#template_img5-2").attr("src", "");
			$("#template_img6-2").attr("src", "");
			$("#template_img7-2").attr("src", "");
			$("#template_img8-2").attr("src", "");
			$("#template_img9-2").attr("src", "");
			$("#template_img10-2").attr("src", "");
			$("#template_img11-2").attr("src", "");
			$("#template_img12-2").attr("src", "");

			$("#pname1-2").html("");
			$("#pname2-2").html("");
			$("#pname3-2").html("");
			$("#pname4-2").html("");
			$("#pname5-2").html("");
			$("#pname6-2").html("");
			$("#pname7-2").html("");
			$("#pname8-2").html("");
			$("#pname9-2").html("");
			$("#pname10-2").html("");
			$("#pname11-2").html("");
			$("#pname12-2").html("");

			$("#template_hid1-2").val("");
			$("#template_hid2-2").val("");
			$("#template_hid3-2").val("");
			$("#template_hid4-2").val("");
			$("#template_hid5-2").val("");
			$("#template_hid6-2").val("");
			$("#template_hid7-2").val("");
			$("#template_hid8-2").val("");
			$("#template_hid9-2").val("");
			$("#template_hid10-2").val("");
			$("#template_hid11-2").val("");
			$("#template_hid12-2").val("");
		}

		if (tabindex == 2) {
			$("#template_img1-3").attr("src", "");
			$("#template_img2-3").attr("src", "");
			$("#template_img3-3").attr("src", "");
			$("#template_img4-3").attr("src", "");
			$("#template_img5-3").attr("src", "");
			$("#template_img6-3").attr("src", "");
			$("#template_img7-3").attr("src", "");
			$("#template_img8-3").attr("src", "");
			$("#template_img9-3").attr("src", "");
			$("#template_img10-3").attr("src", "");
			$("#template_img11-3").attr("src", "");
			$("#template_img12-3").attr("src", "");

			$("#pname1-3").html("");
			$("#pname2-3").html("");
			$("#pname3-3").html("");
			$("#pname4-3").html("");
			$("#pname5-3").html("");
			$("#pname6-3").html("");
			$("#pname7-3").html("");
			$("#pname8-3").html("");
			$("#pname9-3").html("");
			$("#pname10-3").html("");
			$("#pname11-3").html("");
			$("#pname12-3").html("");

			$("#template_hid1-3").val("");
			$("#template_hid2-3").val("");
			$("#template_hid3-3").val("");
			$("#template_hid4-3").val("");
			$("#template_hid5-3").val("");
			$("#template_hid6-3").val("");
			$("#template_hid7-3").val("");
			$("#template_hid8-3").val("");
			$("#template_hid9-3").val("");
			$("#template_hid10-3").val("");
			$("#template_hid11-3").val("");
			$("#template_hid12-3").val("");
		}

		if (tabindex == 3) {
			$("#template_img1-4").attr("src", "");
			$("#template_img2-4").attr("src", "");
			$("#template_img3-4").attr("src", "");
			$("#template_img4-4").attr("src", "");
			$("#template_img5-4").attr("src", "");
			$("#template_img6-4").attr("src", "");
			$("#template_img7-4").attr("src", "");
			$("#template_img8-4").attr("src", "");
			$("#template_img9-4").attr("src", "");
			$("#template_img10-4").attr("src", "");
			$("#template_img11-4").attr("src", "");
			$("#template_img12-4").attr("src", "");

			$("#pname1-4").html("");
			$("#pname2-4").html("");
			$("#pname3-4").html("");
			$("#pname4-4").html("");
			$("#pname5-4").html("");
			$("#pname6-4").html("");
			$("#pname7-4").html("");
			$("#pname8-4").html("");
			$("#pname9-4").html("");
			$("#pname10-4").html("");
			$("#pname11-4").html("");
			$("#pname12-4").html("");

			$("#template_hid1-4").val("");
			$("#template_hid2-4").val("");
			$("#template_hid3-4").val("");
			$("#template_hid4-4").val("");
			$("#template_hid5-4").val("");
			$("#template_hid6-4").val("");
			$("#template_hid7-4").val("");
			$("#template_hid8-4").val("");
			$("#template_hid9-4").val("");
			$("#template_hid10-4").val("");
			$("#template_hid11-4").val("");
			$("#template_hid12-4").val("");
		}

		if (tabindex == 4) {
			$("#template_img1-5").attr("src", "");
			$("#template_img2-5").attr("src", "");
			$("#template_img3-5").attr("src", "");
			$("#template_img4-5").attr("src", "");
			$("#template_img5-5").attr("src", "");
			$("#template_img6-5").attr("src", "");
			$("#template_img7-5").attr("src", "");
			$("#template_img8-5").attr("src", "");
			$("#template_img9-5").attr("src", "");
			$("#template_img10-5").attr("src", "");
			$("#template_img11-5").attr("src", "");
			$("#template_img12-5").attr("src", "");

			$("#pname1-5").html("");
			$("#pname2-5").html("");
			$("#pname3-5").html("");
			$("#pname4-5").html("");
			$("#pname5-5").html("");
			$("#pname6-5").html("");
			$("#pname7-5").html("");
			$("#pname8-5").html("");
			$("#pname9-5").html("");
			$("#pname10-5").html("");
			$("#pname11-5").html("");
			$("#pname12-5").html("");

			$("#template_hid1-5").val("");
			$("#template_hid2-5").val("");
			$("#template_hid3-5").val("");
			$("#template_hid4-5").val("");
			$("#template_hid5-5").val("");
			$("#template_hid6-5").val("");
			$("#template_hid7-5").val("");
			$("#template_hid8-5").val("");
			$("#template_hid9-5").val("");
			$("#template_hid10-5").val("");
			$("#template_hid11-5").val("");
			$("#template_hid12-5").val("");
		}

		if (tabindex == 5) {
			$("#template_img1-6").attr("src", "");
			$("#template_img2-6").attr("src", "");
			$("#template_img3-6").attr("src", "");
			$("#template_img4-6").attr("src", "");
			$("#template_img5-6").attr("src", "");
			$("#template_img6-6").attr("src", "");
			$("#template_img7-6").attr("src", "");
			$("#template_img8-6").attr("src", "");
			$("#template_img9-6").attr("src", "");
			$("#template_img10-6").attr("src", "");
			$("#template_img11-6").attr("src", "");
			$("#template_img12-6").attr("src", "");

			$("#pname1-6").html("");
			$("#pname2-6").html("");
			$("#pname3-6").html("");
			$("#pname4-6").html("");
			$("#pname5-6").html("");
			$("#pname6-6").html("");
			$("#pname7-6").html("");
			$("#pname8-6").html("");
			$("#pname9-6").html("");
			$("#pname10-6").html("");
			$("#pname11-6").html("");
			$("#pname12-6").html("");
		}

		/*             	$("template_img1-2").attr("src","");
		 $("template_img2-2").attr("src","");
		 $("template_img3-2").attr("src","");
		 $("template_img4-2").attr("src","");
		 $("template_img5-2").attr("src","");
		 $("template_img6-2").attr("src","");
		 $("template_img7-2").attr("src","");
		 $("template_img8-2").attr("src","");
		 $("template_img9-2").attr("src","");
		 $("template_img10-2").attr("src","");
		 $("template_img11-2").attr("src",""); */
	}
	//////////按钮模块
	//客户端校验
	function checkbuttonmodule() {
		if ($("#textbtnname").val() == "") {
			$("#lblbutmodule").html("模块标题不能为空");
			$("#textbtnname").focus();
			return false;
		} else {
			$("#textbtnname").val(jQuery.trim($('#textbtnname').val()));
		}

		if ($("#textwidth").val() == "") {
			$("#lblbutmodule").html("模块宽度不能为空");
			$("#textwidth").focus();
			return false;
		} else {
			$("#textwidth").val(jQuery.trim($('#textwidth').val()));
		}

		if ($("#textheight").val() == "") {
			$("#lblbutmodule").html("模块高度不能为空");
			$("#textheight").focus();
			return false;
		} else {
			$("#textheight").val(jQuery.trim($('#textheight').val()));
		}

		return true;
	}

	//全屏模式
	function fullScreen() {
		var el = document.documentElement, rfs = el.requestFullScreen
				|| el.webkitRequestFullScreen || el.mozRequestFullScreen
				|| el.msRequestFullScreen, wscript;

		if (typeof rfs != "undefined" && rfs) {
			rfs.call(el);
			return;
		}

		if (typeof window.ActiveXObject != "undefined") {
			wscript = new ActiveXObject("WScript.Shell");
			if (wscript) {
				wscript.SendKeys("{F11}");
			}
		}
	}
	//退出全屏
	function exitFullScreen() {
		var el = document, cfs = el.cancelFullScreen
				|| el.webkitCancelFullScreen || el.mozCancelFullScreen
				|| el.exitFullScreen, wscript;

		if (typeof cfs != "undefined" && cfs) {
			cfs.call(el);
			return;
		}

		if (typeof window.ActiveXObject != "undefined") {
			wscript = new ActiveXObject("WScript.Shell");
			if (wscript != null) {
				wscript.SendKeys("{F11}");
			}
		}
	}

	//模板数据取得
	function getData(page, rows, modelname, selecttype, templateorder,
			templatetype) {
		$.ajax({
			type : "GET",
			url : 'hometemplate_list',
			data : {
				'page' : page,
				'rows' : rows,
				'modelname' : modelname,
				'selecttype' : selecttype,
				'templateorder' : templateorder,
				'templatetype' : templatetype
			},
			dataType : 'json',
			cache : false,
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
			},
			success : function(data) {
				var varj = 0;
				var vartype = templatetype + 1;
				for (var i = 0; i < data.length; i++) { //循环数据
					varj = i + 1;
					$("#template_img" + varj + "-" + vartype).attr("src",
							data[i].imagepath);
					$("#pname" + varj + "-" + vartype).html(data[i].name);
					$("#template_hid" + varj + "-" + vartype).val(
							data[i].filepath);
				}
				
			}
		});
	}

	//模板数据载入
	function gethtmlData(url) {
		var selectcolor = '';
		//边框设置
		var border = '';
		$
				.ajax({
					type : "GET",
					url : 'get_html',
					data : {
						'htmlurl' : url,
					},
					dataType : 'json',
					cache : false,
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert(XMLHttpRequest.status);
					},
					success : function(data) {
						$('#maincontent1').append(data);

                        //图片样式点击
                        $("#styledivimage").click(function() {
                        	
                          	$.ajax({
    				            type: "POST",
    				            url: 'get_cssstyle',
    							data : {
    								'classname' : $("#styledivimage").attr('value')
    							},
    				            dataType: 'json',
    				            cache: false,
    				            error: function (XMLHttpRequest, textStatus, errorThrown) {
    				                alert(XMLHttpRequest.status);
    				            },
    				            success: function (data) {
    				            	alert($("#styledivimage").attr('value'));
    				            	$(img).attr($("#styledivimage").attr('value'));
    				            }
    				        });
                        	
                        });


						$("img")
								.click(
										function() {
											imagecurr = $(this);
											if ($(this).attr("id")=="dynamic"
												|| $(this).attr("id")=="styleimage")
												return;
											
											selectcolor = 0;
											//常规
											$(".partsbox_tab ul li:eq(0)").css(
													"display", "block");
											$("#partsbox_normal").css(
													"display", "block");
											//样式
											$(".partsbox_tab ul li:eq(1)").css(
													"display", "block");
											$("#partsbox_style").css("display",
													"block");
											//边框
											$(".partsbox_tab ul li:eq(2)").css(
													"display", "block");
											$("#partsbox_item_frame").css(
													"display", "block");
											//标题
											$(".partsbox_tab ul li:eq(3)").css(
													"display", "none");
											$("#partsbox_group_title").css(
													"display", "none");
											//文字
											$(".partsbox_tab ul li:eq(4)").css(
													"display", "none");
											$("#partsbox_item_fontstyle").css(
													"display", "none");

											$("#divvisible")
													.attr('class',
															'checkboxchoice_item clearboth on_check');
											var arrwidth = $("img")
													.css('width').split('px');
											var arrheight = $("img").css(
													'height').split('px');
											$('#property').show();
											$('#txtwidth').val(arrwidth[0]);
											$('#txtheight').val(arrheight[0]);

											$('#txtwidth')
													.change(
															function() {
																$(
																		'#maincontent1 img')
																		.css(
																				'width',
																				$(
																						'#txtwidth')
																						.val()
																						+ "px"); // 设定实际显示宽度
															});

											$('#txtheight')
													.change(
															function() {
																$(
																		'#maincontent1 img')
																		.css(
																				'height',
																				$(
																						'#txtheight')
																						.val()
																						+ "px"); // 设定实际显示宽度
															});

											$('#divvisible')
													.click(
															function() {
																if ($(
																		"#divvisible")
																		.attr(
																				'class') == 'checkboxchoice_item clearboth') {
																	$(
																			'#maincontent1 img')
																			.hide();
																} else {
																	$(
																			'#maincontent1 img')
																			.show();
																}
															});

											//图片样式
											$('#div1')
													.click(
															function() {
																//$('#maincontent1 img').attr('class', 'img-info');
																$(
																		'#maincontent1 img')
																		.attr(
																				'class',
																				'img-info');
															});

											$('#div2')
													.click(
															function() {
																//$('#maincontent1 img').attr('class', 'img-info1');
																$(
																		'#maincontent1 img')
																		.attr(
																				'class',
																				'img-info1');
															});

											//边框样式
											//显示边框
											$('#rdodisplayborder')
													.click(
															function() {
																if ($(
																		"#rdodisplayborder")
																		.attr(
																				'class') == 'pull-left radiochoice_item setgeneratecodr_item form-marginrigt on') {
																	//$('#maincontent1 img').css('border', border);
																	$(
																			'#maincontent1 img')
																			.parent()
																			.css(
																					'border',
																					border);
																}
															});

											//隐藏边框

											$('#rdohideborder')
													.click(
															function() {
																//$('#maincontent1 img').css('border', "0");
																oldstyle = $(
																		'#maincontent1 img')
																		.parent()
																		.css(
																				'border');
																$(
																		'#maincontent1 img')
																		.parent()
																		.css(
																				'border',
																				"0");
															});

											//边框宽度
											$('#textborderwidth')
													.change(
															function() {
																//$('#maincontent1 img').css('border-width',$('#textborderwidth').val());
																$(
																		'#maincontent1 img')
																		.parent()
																		.css(
																				'border',
																				$(
																						'#textborderwidth')
																						.val()
																						+ 'px'
																						+ ' solid');
																border = $(
																		'#maincontent1 img')
																		.parent()
																		.css(
																				'border');
																//$('.col-md-4 header-left').css('border-width',$('#textborderwidth').val());
															});

											$('.cxcolor')
													.click(
															function() {
																if (selectcolor != 0) {
																	return;
																}
																var colour = $(
																		'#partsbox_setbordercolor')
																		.css(
																				'background-color');
																colour = colour
																		.replace(
																				/rgb/i,
																				"rgba");
																var newBGColor = colour
																		.split(
																				')',
																				2)
																		+ 1
																		+ ')';
																$(
																		'#maincontent1 img')
																		.parent()
																		.css(
																				'border-color',
																				newBGColor);
																border = $(
																		'#maincontent1 img')
																		.parent()
																		.css(
																				'border');
															});
		
		             
						//取得样式
/* 						var styletagname = 	
						$.ajax({
                        type: "GET",
                        url: 'getstylelistbytag',
        				data : {
        					'ID' : row[index].ID,
        				},
                        dataType: 'json',
                        cache: false,
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status);
                        },
                        success: function (data) {
                        	var stylelistimg = '<ul class="clearboth">';
                        	$.each(data.list,function(i,item){
                        		stylelistimg += '<li class="pull-left active"><div id="div' + i + '">';
                        		stylelistimg += '<img width="113" height="115" src=' + item.StyleImg + '/>'
                        		stylelistimg += '</div></li>';
                            });
                        	stylelistimg += "</ul>";
                        	$("#partsbox_style").append(stylelistimg);
                        } */
											
											
											
											
											
											
											
											
											
											
											
										});

						//标题点击
						$("#maincontent1 h1")
								.click(
										function() {
											$('#property').show();
											//隐藏菜单
											$(".partsbox_tab ul li:eq(0)").css(
													"display", "none");
											$("#partsbox_normal").css(
													"display", "none");
											$(".partsbox_tab ul li:eq(1)").css(
													"display", "none");
											$("#partsbox_style").css("display",
													"none");
											$(".partsbox_tab ul li:eq(2)").css(
													"display", "none");
											$("#partsbox_item_frame").css(
													"display", "none");
											$(".partsbox_tab ul li:eq(3)").css(
													"display", "block");
											$("#partsbox_group_title").css(
													"display", "block");
											$(".partsbox_tab ul li:eq(4)").css(
													"display", "none");
											$("#partsbox_item_fontstyle").css(
													"display", "none");
											$(".partsbox_tab ul li:eq(5)").css(
													"display", "none");
											$("#partsbox_image").css("display",
													"none");
											$(".partsbox_tab ul li:eq(6)").css(
													"display", "none");
											$("#partsbox_dynamic").css(
													"display", "none");

											selectcolor = 1;
											///////////////////////标题隐藏显示
											$('#divheadvisible')
													.click(
															function() {
																//显示标题
																if ($(
																		"#divheadvisible")
																		.attr(
																				'class') == 'pull-left radiochoice_item setgeneratecodr_item form-marginrigt on') {
																	$(
																			"#maincontent1 h1")
																			.show();
																}
															});

											$('#divheadhide')
													.click(
															function() {
																//隐藏标题
																if ($(
																		"#divheadhide")
																		.attr(
																				'class') == 'pull-left radiochoice_item setgeneratecodr_item on') {
																	$(
																			"#maincontent1 h1")
																			.hide();
																}
															});
											selectfont = 0;
										});

						$("#maincontent1 h2")
								.click(
										function() {
											$('#property').show();
											//隐藏菜单
											$(".partsbox_tab ul li:eq(0)").css(
													"display", "none");
											$("#partsbox_normal").css(
													"display", "none");
											$(".partsbox_tab ul li:eq(1)").css(
													"display", "none");
											$("#partsbox_style").css("display",
													"none");
											$(".partsbox_tab ul li:eq(2)").css(
													"display", "none");
											$("#partsbox_item_frame").css(
													"display", "none");
											$("#partsbox_tab ul li:eq(3)").css(
													"display", "block");
											$("#partsbox_group_title").css(
													"display", "block");
											$(".partsbox_tab ul li:eq(4)").css(
													"display", "none");
											$("#partsbox_item_fontstyle").css(
													"display", "none");
											$(".partsbox_tab ul li:eq(5)").css(
													"display", "none");
											$("#partsbox_image").css("display",
													"none");
											$(".partsbox_tab ul li:eq(6)").css(
													"display", "none");
											$("#partsbox_dynamic").css(
													"display", "none");

											partsbox_image
											selectcolor = 2;
											///////////////////////标题隐藏显示
											$('#divheadvisible')
													.click(
															function() {
																//显示标题
																if ($(
																		"#divheadvisible")
																		.attr(
																				'class') == 'pull-left radiochoice_item setgeneratecodr_item form-marginrigt on') {
																	$(
																			"#maincontent1 h2")
																			.show();
																}
															});

											$('#divheadhide')
													.click(
															function() {
																//隐藏标题
																if ($(
																		"#divheadhide")
																		.attr(
																				'class') == 'pull-left radiochoice_item setgeneratecodr_item on') {
																	$(
																			"#maincontent1 h2")
																			.hide();
																}
															});
											selectfont = 1;
										});

						$("#maincontent1 h3")
								.click(
										function() {
											$('#property').show();
											//隐藏菜单
											$(".partsbox_tab ul li:eq(0)").css(
													"display", "none");
											$("#partsbox_normal").css(
													"display", "none");
											$(".partsbox_tab ul li:eq(1)").css(
													"display", "none");
											$("#partsbox_style").css("display",
													"none");
											$(".partsbox_tab ul li:eq(2)").css(
													"display", "none");
											$("#partsbox_item_frame").css(
													"display", "none");
											$("#partsbox_tab ul li:eq(3)").css(
													"display", "block");
											$("#partsbox_group_title").css(
													"display", "block");
											$(".partsbox_tab ul li:eq(4)").css(
													"display", "none");
											$("#partsbox_item_fontstyle").css(
													"display", "none");
											$(".partsbox_tab ul li:eq(5)").css(
													"display", "none");
											$("#partsbox_image").css("display",
													"none");
											$(".partsbox_tab ul li:eq(6)").css(
													"display", "none");
											$("#partsbox_dynamic").css(
													"display", "none");
											selectcolor = 3;
											///////////////////////标题隐藏显示
											$('#divheadvisible')
													.click(
															function() {
																//显示标题
																if ($(
																		"#divheadvisible")
																		.attr(
																				'class') == 'pull-left radiochoice_item setgeneratecodr_item form-marginrigt on') {
																	$(
																			"#maincontent1 h3")
																			.show();
																}
															});

											$('#divheadhide')
													.click(
															function() {
																//隐藏标题
																if ($(
																		"#divheadhide")
																		.attr(
																				'class') == 'pull-left radiochoice_item setgeneratecodr_item on') {
																	$(
																			"#maincontent1 h3")
																			.hide();
																}
															});
											selectfont = 2;
										});

						$("#maincontent1 h4")
								.click(
										function() {
											$('#property').show();
											//隐藏菜单
											$(".partsbox_tab ul li:eq(0)").css(
													"display", "none");
											$("#partsbox_normal").css(
													"display", "none");
											$(".partsbox_tab ul li:eq(1)").css(
													"display", "none");
											$("#partsbox_style").css("display",
													"none");
											$(".partsbox_tab ul li:eq(2)").css(
													"display", "none");
											$("#partsbox_item_frame").css(
													"display", "none");
											$("#partsbox_tab ul li:eq(3)").css(
													"display", "block");
											$("#partsbox_group_title").css(
													"display", "block");
											$(".partsbox_tab ul li:eq(4)").css(
													"display", "none");
											$("#partsbox_item_fontstyle").css(
													"display", "none");
											$(".partsbox_tab ul li:eq(5)").css(
													"display", "none");
											$("#partsbox_image").css("display",
													"none");
											$(".partsbox_tab ul li:eq(6)").css(
													"display", "none");
											$("#partsbox_dynamic").css(
													"display", "none");
											selectcolor = 4;
											///////////////////////标题隐藏显示
											$('#divheadvisible')
													.click(
															function() {
																//显示标题
																if ($(
																		"#divheadvisible")
																		.attr(
																				'class') == 'pull-left radiochoice_item setgeneratecodr_item form-marginrigt on') {
																	$(
																			"#maincontent1 h4")
																			.show();
																}
															});

											$('#divheadhide')
													.click(
															function() {
																//隐藏标题
																if ($(
																		"#divheadhide")
																		.attr(
																				'class') == 'pull-left radiochoice_item setgeneratecodr_item on') {
																	$(
																			"#maincontent1 h4")
																			.hide();
																}
															});
											selectfont = 3;
										});

						$("#maincontent1 h5")
								.click(
										function() {
											$('#property').show();
											//隐藏菜单
											$(".partsbox_tab ul li:eq(0)").css(
													"display", "none");
											$("#partsbox_normal").css(
													"display", "none");
											$(".partsbox_tab ul li:eq(1)").css(
													"display", "none");
											$("#partsbox_style").css("display",
													"none");
											$(".partsbox_tab ul li:eq(2)").css(
													"display", "none");
											$("#partsbox_item_frame").css(
													"display", "none");
											$("#partsbox_tab ul li:eq(3)").css(
													"display", "block");
											$("#partsbox_group_title").css(
													"display", "block");
											$(".partsbox_tab ul li:eq(4)").css(
													"display", "none");
											$("#partsbox_item_fontstyle").css(
													"display", "none");
											$(".partsbox_tab ul li:eq(5)").css(
													"display", "none");
											$("#partsbox_image").css("display",
													"none");
											$(".partsbox_tab ul li:eq(6)").css(
													"display", "none");
											$("#partsbox_dynamic").css(
													"display", "none");
											selectcolor = 5;
											///////////////////////标题隐藏显示
											$('#divheadvisible')
													.click(
															function() {
																//显示标题
																if ($(
																		"#divheadvisible")
																		.attr(
																				'class') == 'pull-left radiochoice_item setgeneratecodr_item form-marginrigt on') {
																	$(
																			"#maincontent1 h5")
																			.show();
																}
															});

											$('#divheadhide')
													.click(
															function() {
																//隐藏标题
																if ($(
																		"#divheadhide")
																		.attr(
																				'class') == 'pull-left radiochoice_item setgeneratecodr_item on') {
																	$(
																			"#maincontent1 h5")
																			.hide();
																}
															});
											selectfont = 4;
										});

						$("#maincontent1 h6")
								.click(
										function() {
											$('#property').show();
											//隐藏菜单
											$(".partsbox_tab ul li:eq(0)").css(
													"display", "none");
											$("#partsbox_normal").css(
													"display", "none");
											$(".partsbox_tab ul li:eq(1)").css(
													"display", "none");
											$("#partsbox_style").css("display",
													"none");
											$(".partsbox_tab ul li:eq(2)").css(
													"display", "none");
											$("#partsbox_item_frame").css(
													"display", "none");
											$("#partsbox_tab ul li:eq(3)").css(
													"display", "block");
											$("#partsbox_group_title").css(
													"display", "block");
											$(".partsbox_tab ul li:eq(4)").css(
													"display", "none");
											$("#partsbox_item_fontstyle").css(
													"display", "none");
											$(".partsbox_tab ul li:eq(5)").css(
													"display", "none");
											$("#partsbox_image").css("display",
													"none");
											$(".partsbox_tab ul li:eq(6)").css(
													"display", "none");
											$("#partsbox_dynamic").css(
													"display", "none");
											selectcolor = 6;
											///////////////////////标题隐藏显示
											$('#divheadvisible')
													.click(
															function() {
																//显示标题
																if ($(
																		"#divheadvisible")
																		.attr(
																				'class') == 'pull-left radiochoice_item setgeneratecodr_item form-marginrigt on') {
																	$(
																			"#maincontent1 h6")
																			.show();
																}
															});

											$('#divheadhide')
													.click(
															function() {
																//隐藏标题
																if ($(
																		"#divheadhide")
																		.attr(
																				'class') == 'pull-left radiochoice_item setgeneratecodr_item on') {
																	$(
																			"#maincontent1 h6")
																			.hide();
																}
															});
											selectfont = 5;
										});
					}
				});
	}

	//图片上传预览    IE是用了滤镜。
	function previewImage(file) {
		var MAXWIDTH = 100;
		var MAXHEIGHT = 83;
		var div = document.getElementById('imagetemplateuploaddiv');
		if (file.files && file.files[0]) {
			div.innerHTML = '<img id=imghead>';
			var img = document.getElementById('imghead');
			img.onload = function() {
				var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT,
						img.offsetWidth, img.offsetHeight);
				img.width = rect.width;
				img.height = rect.height;
				//         img.style.marginLeft = rect.left+'px';
				img.style.marginTop = rect.top + 'px';
			}
			var reader = new FileReader();
			reader.onload = function(evt) {
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
			var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth,
					img.offsetHeight);
			status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width
					+ ',' + rect.height);
			div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
		}

		function clacImgZoomParam(maxWidth, maxHeight, width, height) {
			var param = {
				top : 0,
				left : 0,
				width : width,
				height : height
			};
			if (width > maxWidth || height > maxHeight) {
				rateWidth = width / maxWidth;
				rateHeight = height / maxHeight;

				if (rateWidth > rateHeight) {
					param.width = maxWidth;
					param.height = Math.round(height / rateWidth);
				} else {
					param.width = Math.round(width / rateHeight);
					param.height = maxHeight;
				}
			}

			param.left = Math.round((maxWidth - param.width) / 2);
			param.top = Math.round((maxHeight - param.height) / 2);
			return param;
		}

		/*                 $.ajax({
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
		 }); */
	}
</script>


</head>
<body>
	<header>
		<div class="topwrap clearboth">
			<div class="toplogo pull-left">
				<img src="../ppk/static/preweb/images/logo.png">
			</div>
			<div class=" pull-right topnav-btn">
				<p>
					<a href="#" id="fullScreen-btn" class=" btn">全屏</a> <a href=""
						class=" btn">帮助</a> <a href="" class=" btn">消息</a> <a href=""
						class=" btn">联系客服</a> <span>欢迎您！: admin</span>
				</p>
			</div>
		</div>
		<div class="topnav clearboth">
			<!--左侧功能菜单-->
			<div class="pull-left functionnav">
				<div class="functionnav_t">功 能</div>
				<div class="functionnav_main">
					<ul class="functionnav_group">
						<!--模板 -->
						<li class="functionnav_item">
							<div class="functionnav_intmmeun clearboth">
								<i class=" pull-left icon icon-iconfont-c-templatecon"></i> <span
									class="pull-left" id="templateclick">模板</span>
							</div>
						</li>
						<!--布局 -->
						<li class="functionnav_item">
							<div class="functionnav_intmmeun clearboth">
								<i class=" pull-left icon icon-iconfont-moban"></i> <span
									class="pull-left">布局</span>
							</div> <!--选择模块-->
							<div class="functionnav_item_main">
								<div class="functionnav_item_title">布局模块</div>
								<div class="functionnav_item_text">点击布局，为您的网站增加一行内容模块</div>
								<div class="assembly_layout_group">
									<ul class="clearboth">
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
										<li class="pull-left"></li>
									</ul>
								</div>

								<div class="assembly_layout_currency">
									<div class="functionnav_item_title">通用布局</div>
									<div class="assembly_layout_currencylist">
										<ul>
											<Li class="pull-left">网站<br /> 顶部
											</Li>
											<Li class="pull-left">头部<br /> 区域
											</Li>
											<Li class="pull-left">LOGO</Li>
											<Li class="pull-left">网站<br /> 底部
											</Li>
										</ul>
									</div>
								</div>
							</div> <!--选择模块 end  -->
						</li>
						<!--图片 -->
						<li class="functionnav_item">
							<div class="functionnav_intmmeun clearboth">
								<i class=" pull-left icon icon-iconfont-tupian"></i> <span
									class="pull-left">图片</span>
							</div> <!--选择模块-->
							<div class="functionnav_item_main">
								<div class="functionnav_item_title">图片模块</div>
								<div class="functionnav_item_text">点击为您的网站增加一行内容模块</div>
								<div class="currency_group currency_picture">
									<ul class="clearboth">
										<Li id='picture-inagestext-btn' class="pull-left">
											<div></div>
											<p>图文模块111111111</p>
										</Li>
										<Li class="pull-left"
											onClick="window.location.href = 'picture_carousel.html'">
											<div></div>
											<p>轮播图模块</p>
										</Li>
										<Li class="pull-left"
											onClick="window.location.href = 'picture_single.html'">
											<div></div>
											<p>单图模块</p>
										</Li>
										<Li class="pull-left"
											onClick="window.location.href = 'picture_atlas.html'">
											<div></div>
											<p>图册模块</p>
										</Li>
										<Li class="pull-left"
											onClick="window.location.href = 'picture_background.html'">
											<div></div>
											<p>背景模块</p>
										</Li>
										<Li class="pull-left"
											onClick="window.location.href = 'picture_layer.html'">
											<div></div>
											<p>浮层图片</p>
										</Li>
									</ul>
								</div>
							</div> <!--选择模块 end -->
						</li>
						<!--文章 -->
						<li class="functionnav_item">
							<div class="functionnav_intmmeun clearboth">
								<i class=" pull-left icon icon-iconfont-wenzhang"></i> <span
									class="pull-left">文章</span>
							</div> <!--选择模块-->
							<div class="functionnav_item_main">
								<div class="functionnav_item_title">文章模块</div>
								<div class="functionnav_item_text">点击为您的网站增加一行内容模块</div>
								<div class="currency_group currency_article ">
									<ul class="clearboth">
										<Li class="pull-left" id='imagecontentmodule'>
											<div></div>
											<p>图文模块</p>
										</Li>
										<Li class="pull-left" id='imagefontmodule'>
											<div></div>
											<p>纯文模块</p>
										</Li>
										<Li class="pull-left" id='imagearticlelistmodule'>
											<div></div>
											<p>文章列表</p>
										</Li>
										<Li class="pull-left" id='imagearticletablemodule'>
											<div></div>
											<p>表格模块</p>
										</Li>
										<Li class="pull-left" id='imagearticlenoticemodule'>
											<div></div>
											<p>公告栏</p>
										</Li>
										<Li class="pull-left" id='imagearticlelayermodule'>
											<div></div>
											<p>浮层文字</p>
										</Li>
									</ul>
								</div>
							</div> <!--选择模块-->
						</li>
						<!--交互 -->
						<li class="functionnav_item">
							<div class="functionnav_intmmeun clearboth">
								<i class=" pull-left icon icon-iconfont-iconfontwanyouxi"></i> <span
									class="pull-left">交互</span>
							</div> <!--选择模块-->
							<div class="functionnav_item_main">
								<div class="functionnav_item_title">交互模块</div>
								<div class="functionnav_item_text">点击为您的网站增加一行内容模块</div>
								<div class="currency_group currency_interactive">
									<ul class="clearboth">
										<!--fsl -->
										<Li id='buttonmodule' class="pull-left">
											<div></div>
											<p>按钮模块</p>
										</Li>
										<!--fsl -->
										<Li id='membermodule' class="pull-left">
											<!--fsl -->
											<div></div>
											<p>会员登录</p>
										</Li>
										<Li id='searchmodule' class="pull-left">
											<div></div>
											<p>搜索模块</p>
										</Li>
										<Li id='codemodule' class="pull-left">
											<div></div>
											<p>二维码</p>
										</Li>
										<Li id='sharemodule' class="pull-left">
											<div></div>
											<p>分享网站</p>
										</Li>
										<Li id='messagemodule' class="pull-left">
											<div></div>
											<p>提交留言</p>
										</Li>
									</ul>
								</div>
							</div> <!--选择模块-->
						</li>
						<!--高级 -->
						<li class="functionnav_item">
							<div class="functionnav_intmmeun clearboth">
								<i class=" pull-left icon icon-iconfont-img-type"></i> <span
									class="pull-left">高级</span>
							</div> <!--选择模块-->
							<div class="functionnav_item_main">
								<div class="functionnav_item_title">高级模块</div>
								<div class="functionnav_item_text">点击为您的网站增加一行内容模块</div>
								<div class="currency_group currency_senior">
									<ul class="clearboth">
										<Li class="pull-left"
											onClick="window.location.href = 'senior_column.html'">
											<div></div>
											<p>导航菜单</p>
										</Li>
										<Li class="pull-left"
											onClick="window.location.href = 'senior_flash.html'">
											<div></div>
											<p>Flash</p>
										</Li>
										<Li class="pull-left"
											onClick="window.location.href = 'senior_video.html'">
											<div></div>
											<p>视频</p>
										</Li>
										<Li class="pull-left"
											onClick="window.location.href = 'senior_map.html'">
											<div></div>
											<p>在线地图</p>
										</Li>
										<Li class="pull-left"
											onClick="window.location.href = 'senior_link.html'">
											<div></div>
											<p>友情链接</p>
										</Li>
										<Li class="pull-left"
											onClick="window.location.href = 'senior_html.html'">
											<div></div>
											<p>HTML代码</p>
										</Li>
									</ul>
								</div>
							</div> <!--选择模块-->
						</li>
					</ul>
				</div>
			</div>
			<!--左侧功能菜单 end-->
			<div class="pull-left functionnav_main_left">
				<div class=" pull-left switchpage_nav">
					<span class="dropdown-inlineblock dropdown—h form-w_1_5"> <select
						name="" tabindex="4"
						class="dropdown dropdown—h switchpage_navtiem " style="">
							<option value="April">首页</option>
							<option value="5">关于我们</option>
					</select>
					</span>
				</div>
				<a href="#" id="page-setup-btn" class=" pull-left btn btn-default">编辑</a>
				<a href="#" id="seo-btn" class=" pull-left btn btn-default">SEO</a>
				<a href="#" id="attribute-btn" class=" pull-left btn btn-default">属性</a>
			</div>


			<div class=" pull-right functionnav_main_right">
				<a href="#" class="pull-left btn"><i
					class="icon-align-vertical-middle"></i>自动对齐</a> <a href="#"
					class="pull-left btn" id="auxiliary-btn"><i
					class="icon-iconfont-shuxuebiaochi"></i>辅助标尺</a> <a href=""
					class="pull-left btn"><i class="icon-iconfont-qianjin"></i>前进</a> <a
					href="" class="pull-left btn"><I class="icon-iconfont-houtui"></I>后退</a>
				<a href="" class="pull-left btn"><i class="icon-iconfont-pc"></i>PC</a>
				<a href="" class="pull-left btn"><i class="icon-shoujii"></i>移动</a>
				<a href="" class="pull-left btn btn-test preview"><b>预览</b></a> <a
					href="" class="pull-left btn btn-primary keep"><b>保存</b></a>
			</div>
		</div>
	</header>
	<main>
	<div id="property"
		style="height: 100%; width: 360px; position: fixed; z-index: 999; background: #377ba8; right: 0">
		<div class="partsbox">
			<div class="partsbox_tab">
				<ul>
					<li class="active">常规</li>
					<li>样式</li>
					<li>边框</li>
					<li>标题</li>
					<li>文字</li>
					<li>图片</li>
					<li>动态</li>
				</ul>
			</div>
			<div class="partsbox_cot scrollInner">
				<!---------------常规   ---------------------->
				<div class="partsbox_group" id="partsbox_normal">
					<!---------------item   ---------------------->
					<div class="partsbox_item">
						<div class="partsbox_title">尺寸</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth checkboxchoice_box">
								<div name="divvisible" id="divvisible"
									class="checkboxchoice_item clearboth">
									<span class="checkboxchoice_co pull-left"> <input
										type="checkbox" name="chkvisible" id="chkvisible"
										class="choiceclass">
									</span> <label class="checkboxchoice_name pull-left" for="checkbox">
										<span class="checkboxchoice_name_t">显示</span>
									</label>
								</div>
							</div>
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class=" pull-left form-marginrigt">
									<input type="number" name="txtwidth" id="txtwidth"
										class="form-control form-contro_style1 form-w_1"
										placeholder="宽度">
								</div>
								<div class=" pull-left ">
									<span class="dropdown-inlineblock"> <select name=""
										tabindex="4" class="dropdown rimsn ">
											<option value="April">像素</option>
											<option value="5">百分比</option>
									</select>
									</span>
								</div>
							</div>
							<!---------------form-item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class=" pull-left form-marginrigt">
									<input type="number" name="txtheight" id="txtheight"
										class="form-control form-contro_style1 form-w_1 "
										placeholder="高度">
								</div>
								<div class=" pull-left ">
									<span class="dropdown-inlineblock"> <select name=""
										tabindex="4" class="dropdown rimsn ">
											<option value="April">像素</option>
											<option value="5">百分比</option>
									</select>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!---------------item  end  ---------------------->
					<!---------------item   ---------------------->
					<div class="partsbox_item">
						<div class="partsbox_title">透明度</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="partsbox_opcity">
									<!--                        <input type="text" id="lbltransparent" class="foumt-slider" value="100"/>
                                                                   <div class="easyui-slider" data-options="min:10,max:100,step:1" style="width:200px"></div> -->
									<!-- fsl -->
									<input class="easyui-slider" id="lbltransparent"
										style="width: 200px"
										data-options="
                                                   min:0,
                                                   max:100,
                                                   step:1,
                                                   showTip:true,
                                                   onChange: function(value){
                                                   $(imagecurr).parent().css({'opacity':value/100});
                                                   }">
									<span class="unit">%</span>
								</div>
							</div>
						</div>
					</div>
					<!---------------item  end  ---------------------->
					<!---------------item   ---------------------->
					<div class="partsbox_item">
						<div class="partsbox_title">跳转链接</div>
						<div class="partsbox_main">

							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="partsbox_urltiten">
									URL地址:<br />
								</div>
								<label for="textfield"></label>
								<!--                          <input type="number" name="texturl" id="texturl" class="form-control form-contro_style1 form-w " placeholder="高度"> -->
								<!-- fsl -->
								<input id="texturl" type="text" class="easyui-textbox"
									style="width: 100%"
									data-options="
                                               onChange: function(value){
                                               var strlink = '<a id=imglink href=' + value + '></a>';
                                               $('#maincontent1 img').wrapAll(strlink);
                                               }">
							</div>
							<div class="set_item clearboth radiochoice_box">
								<div
									class="pull-left radiochoice_item on setgeneratecodr_item form-marginrigt">
									<span class="radiochoice_co"> <input type="radio"
										name="templatetab1" id="templatetab1"
										class="form_choice choiceclass" />
									</span> <label for="templatetab1">当前页面打开</label>
								</div>
								<div class="pull-left radiochoice_item setgeneratecodr_item">
									<span class="radiochoice_co"> <input type="radio"
										name="templatetab2" id="templatetab2"
										class="form_choice choiceclass" />
									</span> <label for="templatetab2">新窗口打开</label>
								</div>
							</div>
						</div>
					</div>
					<!---------------item  end  ---------------------->
				</div>
				<!---------------样式   ---------------------->
				<div class="partsbox_group none">
					<div class="partsbox_style" id="partsbox_style">
<!-- 						<ul class="clearboth">
							<li class="pull-left active"><div id='div1'>
									<img src="../ppk/static/preweb/images/partsbox_style_img.jpg">圆角
								</div></li>
							<li class="pull-left"><div id='div2'>
									<img src="../ppk/static/preweb/images/partsbox_style_img.jpg">圆
								</div></li>
							<li class="pull-left"><div>
									<img src="../ppk/static/preweb/images/partsbox_style_img.jpg">
								</div></li>
							<li class="pull-left"><div>
									<img src="../ppk/static/preweb/images/partsbox_style_img.jpg">
								</div></li>
							<li class="pull-left"><div>
									<img src="../ppk/static/preweb/images/partsbox_style_img.jpg">
								</div></li>
							<li class="pull-left"><div>
									<img src="../ppk/static/preweb/images/partsbox_style_img.jpg">
								</div></li>
							<li class="pull-left"><div>
									<img src="../ppk/static/preweb/images/partsbox_style_img.jpg">
								</div></li>
							<li class="pull-left"><div>
									<img src="../ppk/static/preweb/images/partsbox_style_img.jpg">
								</div></li>
							<li class="pull-left"><div>
									<img src="../ppk/static/preweb/images/partsbox_style_img.jpg">
								</div></li>
							<li class="pull-left"><div>
									<img src="../ppk/static/preweb/images/partsbox_style_img.jpg">
								</div></li>
						</ul> -->
					</div>
				</div>
				<!---------------边框   ---------------------->
				<div class="partsbox_group  none">
					<!---------------item   ---------------------->
					<div class="partsbox_item" id="partsbox_item_frame">
						<div class="partsbox_title">显示方式</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth radiochoice_box">
								<div id="rdodisplayborder"
									class="pull-left radiochoice_item on setgeneratecodr_item form-marginrigt">
									<span class="radiochoice_co"> <input type="radio"
										name="templatetab1" id="templatetab1"
										class="form_choice choiceclass" />
									</span> <label for="templatetab1">显示边框</label>
								</div>
								<div id="rdohideborder"
									class="pull-left radiochoice_item setgeneratecodr_item">
									<span class="radiochoice_co"> <input type="radio"
										name="templatetab2" id="templatetab2"
										class="form_choice choiceclass" />
									</span> <label for="templatetab2">隐藏边框</label>
								</div>
							</div>
						</div>
					</div>
					<!---------------form-item  end  ---------------------->
					<!---------------item   ---------------------->
					<div class="partsbox_item">
						<div class="partsbox_title">边框大小</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth ">
								<div class="pull-left partsbox_tkey form-marginrigt">宽度：</div>
								<div class=" pull-left form-marginrigt">
									<input type="number" name="textborderwidth"
										id="textborderwidth"
										class="form-control form-contro_style1 form-w_0"
										placeholder="宽度">

								</div>
								<div class=" pull-left ">
									<span class="dropdown-inlineblock"> <select name=""
										tabindex="4" class="dropdown rimsn ">
											<option value="April">像素</option>
											<option value="5">百分比</option>
									</select>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!---------------form-item  end  ---------------------->
					<!---------------item   ---------------------->
					<div class="partsbox_item">
						<div class="partsbox_title">边框样式</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth ">
								<span class="dropdown-inlineblock form-w_w"> <select
									id="selectline" class="easyui-combobox" name="selectline"
									style="width: 200px;">
										<option value="1">实线</option>
										<option value="2">虚线</option>
								</select>
								</span>
							</div>
							<!---------------form item  end ---------------------->
						</div>
						<!---------------form-item  end  ---------------------->
						<!---------------item   ---------------------->
						<div class="partsbox_item">
							<div class="partsbox_title">透明度</div>
							<div class="partsbox_main">
								<!---------------form item  ---------------------->
								<div class="set_item clearboth">
									<div class="partsbox_opcity">
										<!-- fsl -->
										<input class="easyui-slider" id="lblalpha"
											style="width: 255px"
											data-options="
                                                       min:0,
                                                       max:255,
                                                       step:1,
                                                       showTip:true,
                                                       onChange: function(value){
                                                       var oldBGColor = $('#maincontent1 img').parent().css('border-color');
                                                       var newBGColor = '';
                                                       if (oldBGColor.indexOf('rgba')==-1)
                                                       {
                                                       oldBGColor = oldBGColor.replace(/rgb/i, 'rgba');
                                                       newBGColor = oldBGColor.split(')',2) + value/255 + ')';
                                                       }
                                                       else
                                                       {
                                                       newBGColor = oldBGColor.split(',',3) + ',' + value/255 + ')';
                                                       }


                                                       $('#maincontent1 img').parent().css({'border-color':newBGColor});
                                                       }">
										<span class="unit">%</span>
									</div>
								</div>
							</div>
						</div>
						<!---------------item  end  ---------------------->
						<!---------------item   ---------------------->
						<div class="partsbox_item">
							<div class="partsbox_title">边框颜色</div>
							<div class="partsbox_main">
								<!---------------form item  ---------------------->
								<div class="set_item clearboth">
									<div id="partsbox_setbordercolor"></div>
								</div>
							</div>
						</div>
						<!---------------item  end  ---------------------->
					</div>
				</div>
				<!---------------标题   ---------------------->
				<div class="partsbox_group none" id="partsbox_group_title">
					<!---------------item   ---------------------->
					<div class="partsbox_item">
						<div class="partsbox_title">显示方式</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth radiochoice_box">
								<div id="divheadvisible"
									class="pull-left radiochoice_item on setgeneratecodr_item form-marginrigt">
									<span class="radiochoice_co"> <input type="radio"
										name="templatetab1" id="templatetab1"
										class="form_choice choiceclass" />
									</span> <label for="templatetab1">显示标题</label>
								</div>
								<div id="divheadhide"
									class="pull-left radiochoice_item setgeneratecodr_item">
									<span class="radiochoice_co"> <input type="radio"
										name="templatetab2" id="templatetab2"
										class="form_choice choiceclass" />
									</span> <label for="templatetab2">隐藏标题</label>
								</div>
							</div>
						</div>
					</div>
					<!---------------form-item  end  ---------------------->
					<!---------------item   ---------------------->
					<div class="partsbox_item">
						<div class="partsbox_title">文字样式</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth radiochoice_box">
								<div class="pull-left partsbox_tkey form-marginrigt">字体：</div>
								<div class="pull-left">
									<span class="dropdown-inlineblock form-w_1_8"> <select
										id="selectfont" class="easyui-combobox" name="selectfont"
										style="width: 200px;">
											<option value="0">宋体</option>
											<option value="1">微软雅黑</option>
									</select>
									</span>
								</div>
							</div>
							<!---------------item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth radiochoice_box">
								<div class="pull-left partsbox_tkey form-marginrigt">大小：</div>
								<div class="pull-left">
									<span class="dropdown-inlineblock form-w_1_8"> <select
										id="selectfontsize" class="easyui-combobox"
										name="selectfontsize" style="width: 200px;">
											<option value="12">12</option>
											<option value="14">14</option>
											<option value="18">18</option>
											<option value="20">20</option>
											<option value="24">24</option>
											<option value="30">30</option>
											<option value="36">36</option>
											<option value="48">48</option>
											<option value="60">60</option>
									</select>
									</span>
								</div>
							</div>
							<!---------------item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth radiochoice_box">
								<div class="pull-left partsbox_tkey form-marginrigt">颜色：</div>
								<div class="pull-left">
									<div id="partsbox_ititleset_color"></div>
								</div>
							</div>
							<!---------------item  end  ---------------------->
						</div>
					</div>
					<!---------------form-item  end  ---------------------->
					<!---------------item   ---------------------->
					<div class="partsbox_item">
						<div class="partsbox_title">跳转链接</div>
						<div class="partsbox_main">

							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="partsbox_urltiten">
									URL地址:<br />
								</div>
								<label for="textfield"></label> <input type="number"
									name="textfield" id="textfield"
									class="form-control form-contro_style1 form-w "
									placeholder="高度">
							</div>
							<div class="set_item clearboth radiochoice_box">
								<div
									class="pull-left radiochoice_item on setgeneratecodr_item form-marginrigt">
									<span class="radiochoice_co"> <input type="radio"
										name="templatetab1" id="templatetab1"
										class="form_choice choiceclass" />
									</span> <label for="templatetab1">当前页面打开</label>
								</div>
								<div class="pull-left radiochoice_item setgeneratecodr_item">
									<span class="radiochoice_co"> <input type="radio"
										name="templatetab2" id="templatetab2"
										class="form_choice choiceclass" />
									</span> <label for="templatetab2">新窗口打开</label>
								</div>
							</div>
						</div>
					</div>
					<!---------------item  end  ---------------------->
					<!---------------item   ---------------------->
					<div class="partsbox_item">
						<div class="partsbox_title">边框颜色</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div id="partsbox_settitlebackgoud_color"></div>
							</div>
						</div>
					</div>
					<!---------------item  end  ---------------------->
				</div>
				<!---------------文字   ---------------------->
				<div class="partsbox_group none">
					<!---------------item   ---------------------->
					<div class="partsbox_item" id="partsbox_item_fontstyle">
						<div class="partsbox_title">文字样式</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth radiochoice_box">
								<div class="pull-left partsbox_tkey form-marginrigt">字体：</div>
								<div class="pull-left">
									<span class="dropdown-inlineblock form-w_1_8"> <select
										name="" tabindex="4" class="dropdown rimsn ">
											<option value="April">宋体</option>
											<option value="5">微软雅黑</option>
									</select>
									</span>
								</div>
							</div>
							<!---------------item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth radiochoice_box">
								<div class="pull-left partsbox_tkey form-marginrigt">大小：</div>
								<div class="pull-left">
									<span class="dropdown-inlineblock form-w_1_8"> <select
										name="" tabindex="4" class="dropdown rimsn ">
											<option value="April">12</option>
											<option value="5">14</option>
											<option value="5">18</option>
											<option value="5">20</option>
											<option value="5">24</option>
											<option value="5">30</option>
											<option value="5">36</option>
											<option value="5">48</option>
											<option value="5">60</option>
									</select>
									</span>
								</div>
							</div>
							<!---------------item  end  ---------------------->
						</div>
					</div>
					<!---------------form-item  end  ---------------------->
					<!---------------item   ---------------------->
					<div class="partsbox_item">
						<div class="partsbox_title">行间距</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="partsbox_opcity">
									<input type="hidden" class="foumt-lineheight" value="100" /> <span
										class="unit">PX</span>
								</div>
							</div>
							<!---------------item  end  ---------------------->
						</div>
					</div>
					<!---------------form-item  end  ---------------------->
					<!---------------item   ---------------------->
					<div class="partsbox_item">
						<div class="partsbox_title">文字颜色</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div id="partsbox_fontsitmecolor"></div>
							</div>
							<!---------------item  end  ---------------------->
						</div>
					</div>
					<!---------------form-item  end  ---------------------->
					<!---------------item   ---------------------->
					<div class="partsbox_item">
						<div class="partsbox_title">投影</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div id="partsbox_Projectioncolor"></div>
							</div>
							<!---------------item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="">透明度：</div>
								<div class="partsbox_opcity">
									<input type="hidden" class="foumt-slider" value="100" /> <span
										class="unit">%</span>
								</div>
							</div>
							<!---------------item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="">大小：</div>
								<div class="partsbox_opcity">
									<input type="hidden" class="foumt-rojectionsize" value="5" />
									<span class="unit">PX</span>
								</div>
							</div>
							<!---------------item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="">角度：</div>
								<div class="partsbox_opcity">
									<input type="hidden" class="foumt-rojectionangle" value="320" />
									<span class="unit">度</span>
								</div>
							</div>
							<!---------------item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="">距离：</div>
								<div class="partsbox_opcity">
									<input type="hidden" class="foumt-rojectiondistance" value="10" />
									<span class="unit">PX</span>
								</div>
							</div>
							<!---------------item  end  ---------------------->
						</div>
					</div>
					<!---------------form-item  end  ---------------------->
					<!---------------item   ---------------------->
					<div class="partsbox_item">
						<div class="partsbox_title">背景颜色</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div id="partsbox_fontbackgroundcolor"></div>
							</div>
							<!---------------item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="">透明度：</div>
								<div class="partsbox_opcity">
									<input type="hidden" class="foumt-slider" value="100" /> <span
										class="unit">%</span>
								</div>
							</div>
							<!---------------item  end  ---------------------->
						</div>
					</div>
					<!---------------form-item  end  ---------------------->
				</div>
				<!---------------图片   ---------------------->
				<div class="partsbox_group none" id="partsbox_image">
					<!---------------item   ---------------------->
					<div class="partsbox_item">
						<div class="partsbox_title">透明度</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="partsbox_opcity">
									<input type="hidden" class="foumt-slider" value="100" /> <span
										class="unit">%</span>
								</div>
							</div>
							<!---------------item  end  ---------------------->
						</div>
					</div>
					<!---------------form-item  end  ---------------------->
					<!---------------item   ---------------------->
					<div class="partsbox_item">
						<div class="partsbox_title">描边</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div id="partsbox_imgbordercolor"></div>
							</div>
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div>大小</div>
								<div class="partsbox_opcity">
									<!-- <input type="hidden" class="foumt-slider" value="5" /> -->
									<!-- fsl -->
									<input class="easyui-slider" id="imageborer"
										style="width: 255px">
									<!-- <span class="unit">%</span> -->
								</div>
							</div>
							<!---------------item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div>透明度</div>
								<div class="partsbox_opcity">
									<!--                        <input type="hidden" class="foumt-slider" value="100" /> -->
									<!-- fsl -->
									<input class="easyui-slider" id="imagealpha"
										style="width: 255px">
									<!--                        <span class="unit">%</span> -->
								</div>
							</div>
							<!---------------item  end  ---------------------->
						</div>
						<!---------------form-item  end  ---------------------->
						<!---------------item   ---------------------->
						<div class="partsbox_item">
							<div class="partsbox_title">投影</div>
							<div class="partsbox_main">
								<!---------------form item  ---------------------->
								<div class="set_item clearboth">
									<div class="xcmain_color" id="partsbox_img_Projectioncolor"></div>
								</div>
								<!---------------item  end  ---------------------->
								<!---------------form item  ---------------------->
								<div class="set_item clearboth">
									<div class="">透明度：</div>
									<div class="partsbox_opcity">
										<!--                        <input type="hidden" class="foumt-slider" value="100" />
                                                                       <span class="unit">%</span> -->
										<input class="easyui-slider" id="imageprojectionTrans"
											style="width: 255px">
									</div>
								</div>
								<!---------------item  end  ---------------------->
								<!---------------form item  ---------------------->
								<div class="set_item clearboth">
									<div class="">X轴偏移：</div>
									<div class="partsbox_opcity">
										<!--                        <input type="hidden" class="foumt-rojectionsize" value="5" />
                                                                       <span class="unit">PX</span> -->
										<input class="easyui-slider" id="imageprojectionX"
											style="width: 255px">
									</div>
								</div>
								<!---------------item  end  ---------------------->
								<!---------------form item  ---------------------->
								<div class="set_item clearboth">
									<div class="">Y轴偏移：</div>
									<div class="partsbox_opcity">
										<!--                        <input type="hidden" class="foumt-rojectionangle" value="320" />
                                                                       <span class="unit">度</span> -->
										<input class="easyui-slider" id="imageprojectionY"
											style="width: 255px">
									</div>
								</div>
								<!---------------item  end  ---------------------->
								<!---------------form item  ---------------------->
								<div class="set_item clearboth">
									<div class="">模糊：</div>
									<div class="partsbox_opcity">
										<!--                        <input type="hidden" class="foumt-rojectiondistance" value="10" />
                                                                       <span class="unit">PX</span> -->
										<input class="easyui-slider" id="imageprojectionBlur"
											style="width: 255px">
									</div>
								</div>
								<!---------------item  end  ---------------------->
								<div class="set_item clearboth">
									<div class="">扩展：</div>
									<div class="partsbox_opcity">
										<!--                        <input type="hidden" class="foumt-rojectiondistance" value="10" />
                                                                       <span class="unit">PX</span> -->
										<input class="easyui-slider" id="imageprojectionSpread"
											style="width: 255px">
									</div>
								</div>
								<!---------------item  end  ---------------------->
							</div>
						</div>
						<!---------------form-item  end  ---------------------->
						<!---------------item   ---------------------->
						<div class="partsbox_item">
							<div class="partsbox_title">背景颜色</div>
							<div class="partsbox_main">
								<!---------------form item  ---------------------->
								<div class="set_item clearboth">
									<div class="xcmain_color" id="partsbox_imgbackgroundcolor"></div>
								</div>
								<!---------------item  end  ---------------------->
								<!---------------form item  ---------------------->
								<div class="set_item clearboth">
									<div class="">透明度：</div>
									<div class="partsbox_opcity">
										<!--                        <input type="hidden" class="foumt-slider" value="100" />
                                                                       <span class="unit">%</span> -->
										<input class="easyui-slider" id="imageprojectionBackcolor"
											style="width: 255px">
									</div>
								</div>
								<!---------------item  end  ---------------------->
							</div>
						</div>
						<!---------------form-item  end  ---------------------->
					</div>
				</div>
				<!---------------动态   ---------------------->
				<div class="partsbox_group none">
					<!---------------item   ---------------------->
					<div class="partsbox_item" id="partsbox_dynamic">
						<div class="partsbox_title">动态库</div>
						<div class="partsbox_main">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth radiochoice_box">
								<span class="dropdown-inlineblock form-w_w"> 
								<select tabindex=0 class="easyui-combobox" name="dropdynamic" id="dropdynamic"
												style="width: 150px; height: 25px"
												data-options="required:true">
										<option value="0">载入效果</option>
										<option value="1">移动效果</option>
								</select>
								</span>
							</div>
							<!---------------item  end  ---------------------->
							<div class="clearboth pridynamic_group" id='pridynamicgroup'>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main-content" id="maincontent"
		style="overflow-y: auto; overflow-x: auto; width: 100%; height: 100%;">
		<div id="divcontainerbutton">
			<div id='box1' class='easyui-draggable'
				style="z-index: 999; clear: both; display: block"></div>
			<div id='box2' class='easyui-draggable'
				style="z-index: 999; clear: both; display: block"></div>
			<div id='box3' class='easyui-draggable'
				style="z-index: 999; clear: both; display: block"></div>
			<div id='box4' class='easyui-draggable'
				style="z-index: 999; clear: both; display: block"></div>
			<div id='box5' class='easyui-draggable'
				style="z-index: 999; clear: both; display: block"></div>
			<div id='box6' class='easyui-draggable'
				style="z-index: 999; clear: both; display: block"></div>
			<div id='box7' class='easyui-draggable'
				style="z-index: 999; clear: both; display: block"></div>
			<div id='box8' class='easyui-draggable'
				style="z-index: 999; clear: both; display: block"></div>
		</div>

		<div id="maincontent1" style="position: relative; overflow: hidden">

		</div>

		<div id='buttonmodulepop' class="popup popupbg distable"
			style="display: none">
			<div class="distablediv">
				<div class="popupcontainer">
					<div class="poputitlee clearboth">
						<div class="pull-left poputitlee_name">按钮模块</div>
						<div class="pull-right ">
							<div class="close  icon-iconfont-guanbi"></div>
						</div>
					</div>
					<div class="popupcontent clearboth">
						<div class="pull-left promptset">
							<form id='formbutton' action="" method="post"
								enctype="multipart/form-data">
								<!------------------------------------->
								<div class="popup-modularsettings  clearboth">

									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">模块标题：</div>
										<div class=" pull-left form-marginrigt">
											<label for="textbtnname"></label> <input name="textbtnname"
												class="easyui-textbox" id="textbtnname"
												style="width: 300px; height: 25px"
												data-options="required:true">
										</div>
										<div class="pull-left cim_dun checkboxchoice_box">
											<div class="checkboxchoice_item clearboth"
												id='searchnamedisplay'>
												<span class="checkboxchoice_co pull-left"> <input
													type="checkbox" name="checkbox" id="checkbox"
													class="choiceclass">
												</span> <label class="checkboxchoice_name pull-left" for="checkbox">
													<span class="checkboxchoice_name_t">显示</span>
												</label>
											</div>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">模块尺寸：</div>
										<div class=" pull-left t">
											<!-- <label for="textwidth"></label> -->
											<input class="easyui-numberspinner" id="textwidth"
												style="width: 100px; height: 25px"
												data-options="required:true"></input>

										</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock"> <select
												class="easyui-combobox" name="dropwidth"
												style="width: 80px; height: 25px"
												data-options="required:true">
													<option value="April">像素</option>
													<option value="5">百分比</option>
											</select> <!--                      <select name=""  tabindex="4" class="dropdown rimsn ">
                                                                                <option value="April">像素</option>
                                                                                <option value="5">百分比</option>
                                                                              </select> -->
											</span>
										</div>
										<div class=" pull-left t">
											<label for="textheight"></label>
											<!--                      <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_0"> -->
											<input class="easyui-numberspinner" id="textheight"
												style="width: 100px; height: 25px;"
												data-options="required:true"></input>
										</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock"> <select
												class="easyui-combobox" name="dropheight"
												style="width: 80px; height: 25px"
												data-options="required:true">
													<option value="April">像素</option>
													<option value="5">百分比</option>
											</select>
											</span>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
								</div>
								<!------------------内容设置 ------------------->
								<div class="popup_main popupmain_ptop">
									<!---------------form item  ---------------------->
									<div class="set_item set_item_e clearboth">
										<div class="item_keyname pull-left">背景颜色：</div>
										<div class="template_colorlitem  pull-left">
											<ul class=" clearboth">
												<li id='butcolorclick' class="template_colorclick artive"></li>
												<li class="bg_red"></li>
												<li class="bg_blue "></li>
												<li class="bg_black "></li>
												<li class="bg_orange"></li>
												<li class="bg_violet"></li>
												<li class="bg_gray"></li>
												<li class="bg_darkred"></li>
												<li class="bg_green"></li>
											</ul>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">提示文字：</div>
										<div class=" pull-left form-marginrigt">
											<label for="textdisplayfont"></label>
											<!--                    <input type="text" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_3"> -->
											<input class="easyui-textbox" id="textdisplayfont"
												style="width: 300px; height: 25px">
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">跳转链接：</div>
										<div class=" pull-left form-marginrigt">
											<label for="texturl"></label>
											<!--                    <input type="text" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_3"> -->
											<input class="easyui-textbox" id="texturl"
												style="width: 300px; height: 25px"
												data-options="validType:'url'">
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">打开方式：</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock form-w_2"> <!--                      <select name=""  tabindex="4" class="dropdown rimsn ">
                                                                                <option value="April">当前页面打开</option>
                                                                                <option value="5">新窗口打开</option>
                                                                              </select> -->
												<select class="easyui-combobox" id="dropopentype"
												name="dropopentype" style="width: 150px; height: 25px"
												data-options="required:true">
													<option value="0">当前页面打开</option>
													<option value="1">新窗口打开</option>
											</select>
											</span>

										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<label id="lblbutmodule" style='color: red'></label>
								</div>
								<div class="form-botton">
									<input type="button" name="btnmodulepreview"
										id="btnmodulepreview" value="预览" class="btn btn_a"> <input
										type="button" name="btnmodulesubmit" id="btnmodulesubmit"
										value="确定提交" class="btn btn_a"> <input type="reset"
										name="btnbuttonreset" id="btnbuttonreset" value="重置"
										class="btn btn_b">
								</div>

							</form>
						</div>
						<div class="pull-left promptpreview">
							<div class="promptpreview_title text-center">效果预览</div>
							<div class="promptpreview_con  distable text-center">
								<div id='distablediv' class="distablediv">
									<!--                   <a href="" class="buttundemo buttun_width buttun_height buttun_color buttun_bgcolor">确认提交</a> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!------------------------  会员模块 模块  -------------------------->
		<div id='membermodulepop' class="popup popupbg distable"
			style="display: none">
			<div class="distabledivmember">
				<div class="popupcontainer">
					<div class="poputitlee clearboth">
						<div class="pull-left poputitlee_name">会员模块</div>
						<div class="pull-right ">
							<div class="close  icon-iconfont-guanbi"></div>
						</div>
					</div>
					<div class="popupcontent clearboth">
						<div class="pull-left promptset">
							<form action="" method="get" enctype="multipart/form-data">

								<div class="popup-modularsettings  clearboth">


									<div class="set_item clearboth">
										<div class="item_keyname pull-left">模块标题：</div>
										<div class=" pull-left form-marginrigt">
											<label for="textmembername"></label> <input type="text"
												class="easyui-textbox" name="textmembername"
												id="textmembername" style="width: 300px; height: 30px">
										</div>
										<div class="pull-left cim_dun checkboxchoice_box">
											<div class="checkboxchoice_item clearboth">
												<span class="checkboxchoice_co pull-left"> <input
													type="checkbox" name="checkbox" id="checkbox"
													class="choiceclass">
												</span> <label class="checkboxchoice_name pull-left" for="checkbox">
													<span class="checkboxchoice_name_t">显示</span>
												</label>
											</div>
										</div>
									</div>

									<div class="set_item clearboth">
										<div class="item_keyname pull-left">模块尺寸：</div>
										<div class=" pull-left t">
											<label for="textmemberwidth"></label> <input
												class="easyui-numberspinner" id="textmemberwidth"
												style="width: 100px; height: 30px"
												data-options="required:true"></input>
											<!-- <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_0"> -->
										</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock"> <select
												class="easyui-combobox" name="dropmemberwidth"
												style="width: 90px; height: 30px"
												data-options="required:true">
													<option value="0">像素</option>
													<option value="1">百分比</option>
											</select>
											</span>
										</div>
										<div class=" pull-left t">
											<label for="textmemberheight"></label>
											<!--                                                     <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_0"> -->
											<input class="easyui-numberspinner" id="textmemberheight"
												style="width: 100px; height: 30px"
												data-options="required:true"></input>
										</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock"> <!--                                                         <select name=""  tabindex="4" class="dropdown rimsn ">
                                                                                                                    <option value="April">像素</option>
                                                                                                                    <option value="5">百分比</option>
                                                                                                                </select> -->
												<select class="easyui-combobox" name="dropmemberheight"
												style="width: 90px; height: 30px"
												data-options="required:true">
													<option value="0">像素</option>
													<option value="1">百分比</option>
											</select>
											</span>
										</div>
									</div>
								</div>
								<div class="popup_main scrollInner popupmain_ptop"
									id='memberboxcontent'>

									<div class="set_item set_item_e clearboth">

										<div class="item_keyname pull-left">注册按钮：</div>
										<div
											class=" pull-left set_picture_background_style radiochoice_box setgeneratecodr">
											<div id='memberregisterY'
												class="pull-left radiochoice_item on setgeneratecodr_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab1" id="templatetab1"
													class="form_choice choiceclass" />
												</span> <label for="templatetab1">显示</label>
											</div>
											<div id='memberregisterN'
												class="pull-left radiochoice_item setgeneratecodr_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab2" id="templatetab2"
													class="form_choice choiceclass" />
												</span> <label for="templatetab2">不显示</label>
											</div>
										</div>
									</div>
									<div class="set_item set_item_e clearboth">
										<div class="item_keyname pull-left">找回密码：</div>
										<div
											class=" pull-left set_picture_background_style radiochoice_box setgeneratecodr">
											<div id='memberfindpassY'
												class="pull-left radiochoice_item on setgeneratecodr_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab1" id="templatetab1"
													class="form_choice choiceclass" />
												</span> <label for="templatetab1">显示</label>
											</div>
											<div id='memberfindpassN'
												class="pull-left radiochoice_item setgeneratecodr_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab2" id="templatetab2"
													class="form_choice choiceclass" />
												</span> <label for="templatetab2">不显示</label>
											</div>
										</div>
									</div>

								</div>
								<div class="form-botton">
									<input type="button" name="membermodulepreview"
										id="membermodulepreview" value="预览" class="btn btn_a">
									<input type="button" name="membermodulesubmit"
										id="membermodulesubmit" value="确定提交" class="btn btn_a">
									<input type="reset" name="memberbuttonreset"
										id="memberbuttonreset" value="重置" class="btn btn_b">
								</div>

							</form>
						</div>
						<div class="pull-left promptpreview">
							<div class="promptpreview_title text-center">效果预览</div>
							<div class="promptpreview_con  distable text-center"
								id='membermodlogincontent'>
								<div class="distablediv text-left" id='membermodloginvalue'>
									<div class="modlogin" id="membermodlogin">
										<form action="" method="get">
											<div id='membermodlogin_title' class="modlogin_title">会员登录</div>
											<div class="modlogin_group">
												<div class="modlogin_item clearboth">
													<div class="modlogin_ico modlogin_ico_a">
														<i></i>
													</div>
													<div class="modlogin_con">
														<input name="memberusername" type="text"
															id="memberusername" class="mudusm_cim">
													</div>
												</div>
												<div class="modlogin_item clearboth">
													<div class="modlogin_ico modlogin_ico_b">
														<i></i>
													</div>
													<div class="modlogin_con">
														<input name="memberpass" type="text" id="memberpass"
															class="mudusm_cim">
													</div>
												</div>
											</div>
											<div class="modlogin_button">
												<p class=" clearboth">
													<span class="modlogin_btnleft" id='memberforget'><a
														href="">忘记登录密码</a></span> <span class="modlogin_btnright"
														id='memberregister'><a href="" class="red">免费注册</a></span>
												</p>
												<div>
													<input type="button" id="" name="" class="modlogin_btn"
														value="登  录" />
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!------------------------  搜索模块 模块  -------------------------->
		<div id='searchmodulepop' class="popup popupbg distable"
			style="display: none">
			<div class="distablediv">
				<div class="popupcontainer">
					<div class="poputitlee clearboth">
						<div class="pull-left poputitlee_name">搜索模块</div>
						<div class="pull-right ">
							<div class="close  icon-iconfont-guanbi"></div>
						</div>
					</div>
					<div class="popupcontent clearboth">
						<div class="pull-left promptset">
							<form action="" method="get" enctype="multipart/form-data">
								<!------------------------------------->
								<div class="popup-modularsettings  clearboth">

									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">模块标题：</div>
										<div class=" pull-left form-marginrigt">
											<label for="textsearchname"></label> <input type="text"
												class="easyui-textbox" name="textsearchname"
												id="textsearchname" style="width: 300px; height: 30px"
												data-options="required:true">
											<!-- <input type="text" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_3"> -->
										</div>
										<div class="pull-left cim_dun checkboxchoice_box">
											<div class="checkboxchoice_item clearboth">
												<span class="checkboxchoice_co pull-left"> <input
													type="checkbox" name="checkbox" id="checkbox"
													class="choiceclass">
												</span> <label class="checkboxchoice_name pull-left" for="checkbox">
													<span class="checkboxchoice_name_t">显示</span>
												</label>
											</div>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">模块尺寸：</div>
										<div class=" pull-left t">
											<label for="textsearchwidth"></label> <input
												class="easyui-numberspinner" id="textsearchwidth"
												style="width: 100px; height: 30px"
												data-options="required:true"></input>
											<!-- <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_0"> -->
										</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock"> <select
												class="easyui-combobox" name="dropsearchwidth"
												style="width: 90px; height: 30px"
												data-options="required:true">
													<!--                                                         <select name=""  tabindex="4" class="dropdown rimsn "> -->
													<option value="0">像素</option>
													<option value="1">百分比</option>
											</select>
											</span>
										</div>
										<div class=" pull-left t">
											<label for="textsearchheight"></label> <input
												class="easyui-numberspinner" id="textsearchheight"
												style="width: 100px; height: 30px"
												data-options="required:true"></input>
											<!-- <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_0"> -->
										</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock"> <select
												class="easyui-combobox" name="dropsearchheight"
												style="width: 90px; height: 30px"
												data-options="required:true">
													<!-- <select name=""  tabindex="4" class="dropdown rimsn "> -->
													<option value="0">像素</option>
													<option value="1">百分比</option>
											</select>
											</span>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
								</div>
								<!------------------内容设置 ------------------->
								<div class="popup_main scrollInner popupmain_ptop">
									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">搜索范围：</div>
										<div class=" pull-left form-marginrigt">
											<div class=""></div>
										</div>
										<div class="pull-left cim_dun checkboxchoice_box">
											<div class="checkboxchoice_item clearboth"
												id="seachmodulefanwei_qi">
												<span class="checkboxchoice_co pull-left"> <input
													type="checkbox" name="seachfanwei_qi" id="seachfanwei_qi"
													class="choiceclass">
												</span> <label class="checkboxchoice_name pull-left"
													for="seachfanwei_qi"> <span
													class="checkboxchoice_name_t">全部</span></label>
											</div>
											<div class=" clearboth setseach_colgroup">
												<ul class="clearboth">
													<li class="pull-left checkboxchoice_item"
														id='seachmodulefanwei_1'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="seachfanwei_1" id="seachfanwei_1"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="seachfanwei_1"> <span
															class="checkboxchoice_name_t">关于我们</span></label></li>
													<li class="pull-left checkboxchoice_item"
														id='seachmodulefanwei_2'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="seachfanwei_2" id="seachfanwei_2"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="seachfanwei_2"> <span
															class="checkboxchoice_name_t">新闻动态</span></label></li>
													<li class=" pull-left checkboxchoice_item "
														id='seachmodulefanwei_3'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="seachfanwei_3" id="seachfanwei_3"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="seachfanwei_3"> <span
															class="checkboxchoice_name_t">网站公告</span></label></li>
													<li class=" pull-left checkboxchoice_item "
														id='seachmodulefanwei_4'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="seachfanwei_4" id="seachfanwei_4"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="seachfanwei_4"> <span
															class="checkboxchoice_name_t">产品展示</span></label></li>
													<li class=" pull-left checkboxchoice_item "
														id='seachmodulefanwei_5'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="seachfanwei_5" id="seachfanwei_5"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="seachfanwei_5"> <span
															class="checkboxchoice_name_t">行业快报</span></label></li>
													<li class=" pull-left checkboxchoice_item "
														id='seachmodulefanwei_6'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="seachfanwei_6" id="seachfanwei_6"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="seachfanwei_6"> <span
															class="checkboxchoice_name_t">客户服务</span></label></li>
												</ul>
											</div>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">搜索提示：</div>
										<div class=" pull-left form-marginrigt">
											<label for="textsearchtip"></label> <input type="text"
												class="easyui-textbox" name="textsearchtip"
												id="textsearchtip" style="width: 300px; height: 30px"
												data-options="required:true">
											<!-- <input type="text" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_3"> -->
										</div>
										<div class="pull-left cim_dun checkboxchoice_box">
											<div class="checkboxchoice_item clearboth">
												<span class="checkboxchoice_co pull-left"> <input
													type="checkbox" name="checkbox" id="checkbox"
													class="choiceclass">
												</span>
											</div>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">关 键 字：</div>
										<div class=" pull-left form-marginrigt">
											<label for="textsearchkey"></label>
											<!--                                                     <input type="text" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_3"> -->
											<input type="text" class="easyui-textbox"
												name="textsearchkey" id="textsearchkey"
												style="width: 300px; height: 30px"
												data-options="required:true">
											<p class="sermgupai_prompyt">每个关键字以“，“分隔</p>
										</div>
										<div class="pull-left cim_dun checkboxchoice_box">
											<div class="checkboxchoice_item clearboth">
												<span class="checkboxchoice_co pull-left"> <input
													type="checkbox" name="checkbox" id="checkbox"
													class="choiceclass">
												</span> <label class="checkboxchoice_name pull-left" for="checkbox">
													<span class="checkboxchoice_name_t">显示</span>
												</label>
											</div>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
								</div>
								<div class="form-botton">
									<input type="button" name="searchmodulepreview"
										id="searchmodulepreview" value="预览" class="btn btn_a">
									<input type="button" name="searchmodulesubmit"
										id="searchmodulesubmit" value="确定提交" class="btn btn_a">
									<input type="reset" name="searchmodulereset"
										id="searchmodulereset" value="重置" class="btn btn_b">
								</div>

							</form>
						</div>
						<div class="pull-left promptpreview">
							<div class="promptpreview_title text-center">效果预览</div>
							<div class="promptpreview_con  distable text-center"
								id="searchpromptpreview_con" style="display: none;">
								<div class="distablediv text-left"
									id="searchpromptpreview_content">
									<div class="mod_search" id="searchmodulecontent">
										<div class=" clearboth">
											<label id='textsearchtitle'></label>
											<form action="" method="get">
												<div class="s_ftom">
													<input name="" type="text" id='textsearchtips' class="s_a"
														placeholder="123" />
												</div>
												<div class="s_brn">
													<input name="" type="button" class="s_b" value="搜索">
												</div>
											</form>
										</div>
										<div class="mod_seach_key">
											<b>关键字：</b><span id='searchmodulehref'><a href="">企业发展</a><a
												href="">优质服务</a><a href="">创新</a><a href="">工程社工</a><a
												href="">行情资讯</a></span>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!------------------------  二维码 模块  -------------------------->
		<div id='codemodulepop' class="popup popupbg distable"
			style="display: none">
			<div class="distablediv">
				<div class="popupcontainer">
					<div class="poputitlee clearboth">
						<div class="pull-left poputitlee_name">二维码模块</div>
						<div class="pull-right ">
							<div class="close  icon-iconfont-guanbi"></div>
						</div>
					</div>
					<div class="popupcontent clearboth">
						<div class="pull-left promptset">
							<form action="" method="get" enctype="multipart/form-data">
								<!------------------------------------->
								<div class="popup-modularsettings  clearboth">

									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">模块标题：</div>
										<div class=" pull-left form-marginrigt">
											<label for="textfield"></label> <input type="text"
												class="easyui-textbox" name="textcodename" id="textcodename"
												style="width: 300px; height: 30px"
												data-options="required:true">
											<!--                                                     <input type="text" name="textcodemodule" id="textcodemodule" class="form-control form-contro_style1 form-w_3"> -->
										</div>
										<div class="pull-left cim_dun checkboxchoice_box">
											<div class="checkboxchoice_item clearboth">
												<span class="checkboxchoice_co pull-left"> <input
													type="checkbox" name="checkbox" id="checkbox"
													class="choiceclass">
												</span> <label class="checkboxchoice_name pull-left" for="checkbox">
													<span class="checkboxchoice_name_t">显示</span>
												</label>
											</div>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">模块尺寸：</div>
										<div class=" pull-left t">
											<label for="textcodewidth"></label> <input
												class="easyui-numberspinner" id="textcodewidth"
												style="width: 100px; height: 30px"
												data-options="required:true"></input>
										</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock"> <select
												class="easyui-combobox" name="dropcodewidth"
												style="width: 90px; height: 30px"
												data-options="required:true">
													<option value="0">像素</option>
													<option value="1">百分比</option>
											</select>
											</span>
										</div>
										<div class=" pull-left t">
											<label for="textfield"></label> <input
												class="easyui-numberspinner" id="textcodeheight"
												style="width: 100px; height: 30px"
												data-options="required:true"></input>
										</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock"> <select
												class="easyui-combobox" name="dropcodeheight"
												style="width: 90px; height: 30px"
												data-options="required:true">
													<option value="0">像素</option>
													<option value="1">百分比</option>
											</select>
											</span>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
								</div>
								<!------------------内容设置 ------------------->
								<div class="popup_main popupmain_ptop">
									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">图片尺寸：</div>
										<div class=" pull-left t">
											<label for="textcodepicwidth"></label> <input
												class="easyui-numberspinner" id="textcodepicwidth"
												style="width: 100px; height: 30px"
												data-options="required:true"></input>
										</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock"> <select
												class="easyui-combobox" name="dropcodepicwidth"
												style="width: 90px; height: 30px"
												data-options="required:true">
													<option value="0">像素</option>
													<option value="1">百分比</option>
											</select>
											</span>
										</div>
										<div class=" pull-left t">
											<label for="textcodepicheight"></label> <input
												class="easyui-numberspinner" id="textcodepicheight"
												style="width: 100px; height: 30px"
												data-options="required:true"></input>
										</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock"> <select
												class="easyui-combobox" name="dropcodepicheight"
												style="width: 90px; height: 30px"
												data-options="required:true">
													<option value="0">像素</option>
													<option value="1">百分比</option>
											</select>
											</span>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item set_item_e clearboth">
										<div class="item_keyname pull-left">图片生成：</div>
										<div
											class=" pull-left set_picture_background_style radiochoice_box setgeneratecodr">
											<div
												class="pull-left radiochoice_item on setgeneratecodr_item"
												id='setgeneratecodr_item_code'>
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab1" id="templatetab1"
													class="form_choice choiceclass" />
												</span> <label>生成二维码</label>
											</div>
											<div class="pull-left radiochoice_item setgeneratecodr_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab2" id="templatetab2"
													class="form_choice choiceclass" />
												</span> <label for="templatetab2">自定义二维码</label>
											</div>
											<div class="generatecodr_bax">
												<div class="clearboth generatecodr_coim">
													<div class="generatecodr_colcmun">
														<span class="dropdown-inlineblock form-w_2"> <select
															class="easyui-combobox" name="dropcodeselect"
															id="dropcodeselect" style="width: 150px; height: 30px"
															data-options="required:true">
																<option value="0">选择栏目</option>
																<option value="1">首页</option>
														</select>
														</span>
													</div>
													<div class="generatecodr_ttom">
														<a class="btn btn_generatecodr" id='templatecodetab1'>生成二维码
														</a>
													</div>
												</div>
												<div class="clearboth generatecodr_coim none">
													<div class="generatecodr_colcmun"></div>
													<div class="generatecodr_ttom">
														<div
															class="pull-left form-marginrigt set_codeupload_btn btn_generatecodr">
															<span class="">本地上传</span> <label for="fileField"></label>
															<input type="file" name="fileField" id="fileField"
																class="choiceclass  codeuploadfileclass">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
								</div>
								<div class="form-botton">
									<input type="button" name="btncodesubmit" id="btncodesubmit"
										value="确定提交" class="btn btn_a"> <input type="reset"
										name="button" id="button" value="重置" class="btn btn_b">
								</div>

							</form>
						</div>
						<div class="pull-left promptpreview">
							<div class="promptpreview_title text-center">效果预览</div>
							<div class="promptpreview_con  distable text-center"
								id='promptpreview_code_content'>
								<label id='textcodetitle'></label>
								<div class="distablediv" id='distablecodediv'>
									<div id='qrcode' class="codecontair img-responsive"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!------------------------  分享 模块  -------------------------->
		<div id='sharemodulepop' class="popup popupbg distable"
			style="display: none">
			<div class="distablediv">
				<div class="popupcontainer">
					<div class="poputitlee clearboth">
						<div class="pull-left poputitlee_name">分享模块</div>
						<div class="pull-right ">
							<div class="close  icon-iconfont-guanbi"></div>
						</div>
					</div>
					<div class="popupcontent clearboth">
						<div class="pull-left ">
							<form action="" method="get" enctype="multipart/form-data">
								<!------------------------------------->
								<div class="popup-modularsettings  clearboth">

									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">模块标题：</div>
										<div class=" pull-left form-marginrigt">
											<label for="textsharename"></label> <input type="text"
												class="easyui-textbox" name="textsharename"
												id="textsharename" style="width: 300px; height: 30px"
												data-options="required:true">
											<!-- <input type="text" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_3"> -->
										</div>
										<div class="pull-left cim_dun checkboxchoice_box">
											<div class="checkboxchoice_item clearboth"
												id="sharemodulenamedisplay">
												<span class="checkboxchoice_co pull-left"> <input
													type="checkbox" name="checkbox" id="checkbox"
													class="choiceclass">
												</span> <label class="checkboxchoice_name pull-left" for="checkbox">
													<span class="checkboxchoice_name_t">显示</span>
												</label>
											</div>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">模块尺寸：</div>
										<div class=" pull-left t">
											<label for="textsharewidth"></label> <input
												class="easyui-numberspinner" id="textsharewidth"
												style="width: 100px; height: 30px"
												data-options="required:true"></input>
											<!-- <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_0"> -->
										</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock"> <select
												class="easyui-combobox" name="dropsharewidth"
												style="width: 120px; height: 30px"
												data-options="required:true">
													<option value="April">像素</option>
													<option value="5">百分比</option>
											</select>
											</span>
										</div>
										<div class=" pull-left t">
											<label for="textshareheight"></label> <input
												class="easyui-numberspinner" id="textshareheight"
												style="width: 100px; height: 30px"
												data-options="required:true"></input>
											<!-- <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_0"> -->
										</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock"> <select
												class="easyui-combobox" name="dropshareheight"
												style="width: 120px; height: 30px"
												data-options="required:true">
													<!-- <select name=""  tabindex="4" class="dropdown rimsn "> -->
													<option value="0">像素</option>
													<option value="1">百分比</option>
											</select>
											</span>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
								</div>
								<!------------------内容设置 ------------------->
								<div class="popup_main popupmain_ptop">
									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">分享内容：</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock form-w_2"> <select
												class="easyui-combobox" name="dropsharecontent"
												style="width: 120px; height: 30px"
												data-options="required:true">
													<!--                                                         <select name=""  tabindex="4" class="dropdown rimsn "> -->
													<option value="0">整站</option>
													<option value="1">文章列表</option>
											</select>
											</span>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item clearboth" id='sharemoduledescribe'>
										<div class="item_keyname pull-left">分享说明：</div>
										<div class=" pull-left form-marginrigt">
											<label for="textfield"></label> <input type="text"
												class="easyui-textbox" name="textsharename"
												id="textsharename" style="width: 300px; height: 30px"
												data-options="required:true" placeholder="输入说明文字">
											<!--                                                     <input type="text" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_4" placeholder="输入说明文字"> -->
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">分享渠道：</div>
										<div class=" pull-left " id='sharemodulecontent'>
											<div class="cim_dun checkboxchoice_box">
												<div class="checkboxchoice_item clearboth"
													id='checkboxsharechoiceall'>
													<span class="checkboxchoice_co pull-left"> <input
														type="checkbox" name="checkbox" id="checkbox"
														class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="checkbox"> <span
														class="checkboxchoice_name_t">全部</span></label>
												</div>
											</div>
											<div class="set_sharelist">
												<ul class="checkboxchoice_box clearboth">
													<!----- item  ------->
													<li class="checkboxchoice_item" id='checkboxsharechoiceqq'>
														<span class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_1" id="share_1"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left" for="share_1">
															<span class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>QQ空间
														</span>
													</label>
													</li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoicesina'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_2" id="share_2"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left" for="share_2">
															<span class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>新浪微博
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoicetcent'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_3" id="share_3"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left" for="share_3">
															<span class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>腾讯微博
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoicewechat'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_4" id="share_4"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left" for="share_4">
															<span class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>微信
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoicenetease'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_5" id="share_5"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left" for="share_5">
															<span class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>网易微博
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item" id='checkboxsharechoiceptt'>
														<span class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_6" id="share_6"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left" for="share_6">
															<span class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>一键通
														</span>
													</label>
													</li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoicemobilesend'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_7" id="share_7"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left" for="share_7">
															<span class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>手机快传
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoicesohu'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_8" id="share_8"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left" for="share_8">
															<span class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>搜狐微博
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoiceshinva'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_9" id="share_9"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left" for="share_9">
															<span class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>新华微博
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoiceskyline'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_10" id="share_10"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="share_10"> <span
															class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>天涯
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoicephoenix'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_11" id="share_11"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="share_11"> <span
															class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>凤凰微博
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoicefriend'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_12" id="share_12"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="share_12"> <span
															class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>朋友圈
														</span>
													</label></li>

													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoicebean'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_13" id="share_13"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="share_13"> <span
															class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>豆瓣
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoiceqqfriend'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_14" id="share_14"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="share_14"> <span
															class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>QQ好友
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoiceqqpeople'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_15" id="share_15"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="share_15"> <span
															class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>人民微博
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoicebaiduspace'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_16" id="share_16"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="share_16"> <span
															class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>百度空间
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoiceYoudao'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_17" id="share_17"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="share_17"> <span
															class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>有道笔记
														</span>
													</label></li>


													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoicemccool'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_20" id="share_20"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="share_20"> <span
															class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>麦库记事
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoicesearch'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_21" id="share_21"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="share_21"> <span
															class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>百度搜藏
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoicegmail'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_22" id="share_22"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="share_22"> <span
															class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>Gmail邮箱
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoicesohuwebo'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_23" id="share_23"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="share_23"> <span
															class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>搜狐微博
														</span>
													</label></li>
													<!----- item  ------->
													<li class="checkboxchoice_item"
														id='checkboxsharechoicefreinfcircle'><span
														class="checkboxchoice_co pull-left"> <input
															type="checkbox" name="share_24" id="share_24"
															class="choiceclass">
													</span> <label class="checkboxchoice_name pull-left"
														for="share_24"> <span
															class="checkboxchoice_name_t"> <i
																class="shareimg shareimg_1 "></i>朋友圈
														</span>
													</label></li>

												</ul>
											</div>

										</div>
									</div>
									<!---------------form-item  end  ---------------------->
								</div>
								<div class="form-botton">
									<input type="button" name="btnsharesubmit" id="btnsharesubmit"
										value="确定提交" class="btn btn_a"> <input type="reset"
										name="button" id="button" value="重置" class="btn btn_b">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!------------------------  留言模块 模块  -------------------------->
		<div id='messagemodulepop' class="popup popupbg distable"
			style="display: none">
			<div class="distablediv">
				<div class="popupcontainer">
					<div class="poputitlee clearboth">
						<div class="pull-left poputitlee_name">留言模块</div>
						<div class="pull-right ">
							<div class="close  icon-iconfont-guanbi"></div>
						</div>
					</div>
					<div class="popupcontent clearboth">
						<div class="pull-left promptset">
							<form action="" method="get" enctype="multipart/form-data">
								<!------------------------------------->
								<div class="popup-modularsettings  clearboth">

									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">模块标题：</div>
										<div class=" pull-left form-marginrigt">
											<label for="textmessagename"></label> <input type="text"
												class="easyui-textbox" name="textmessagename"
												id="textmessagename" style="width: 300px; height: 30px"
												data-options="required:true">
											<!--                                                     <input type="text" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_3"> -->
										</div>
										<div class="pull-left cim_dun checkboxchoice_box">
											<div class="checkboxchoice_item clearboth">
												<span class="checkboxchoice_co pull-left"> <input
													type="checkbox" name="checkbox" id="checkbox"
													class="choiceclass">
												</span> <label class="checkboxchoice_name pull-left" for="checkbox">
													<span class="checkboxchoice_name_t">显示</span>
												</label>
											</div>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">模块尺寸：</div>
										<div class=" pull-left t">
											<label for="textmessgaewidth"></label> <input
												class="easyui-numberspinner" id="textmessgaewidth"
												style="width: 100px; height: 30px"
												data-options="required:true"></input>
											<!--                                                     <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_0"> -->
										</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock"> <select
												class="easyui-combobox" name="dropmessagewidth"
												style="width: 90px; height: 30px"
												data-options="required:true">
													<option value="April">像素</option>
													<option value="5">百分比</option>
											</select>
											</span>
										</div>
										<div class=" pull-left t">
											<label for="textmessageheight"></label> <input
												class="easyui-numberspinner" id="textmessageheight"
												style="width: 100px; height: 30px"
												data-options="required:true"></input>
											<!-- <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_0"> -->
										</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock"> <select
												class="easyui-combobox" name="dropmessageheight"
												style="width: 90px; height: 30px"
												data-options="required:true">
													<option value="0">像素</option>
													<option value="1">百分比</option>
											</select>
											</span>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
								</div>
								<!------------------内容设置 ------------------->
								<div class="popup_main scrollInner scrollInner popupmain_ptop">
									<!---------------form item  ---------------------->
									<div class="set_item  clearboth set_messageitem">
										<div class="item_keyname item_keyname_twin pull-left">
											<span>姓</span>名：
										</div>
										<div
											class=" pull-left set_picture_background_style radiochoice_box setgeneratecodr">
											<div
												class="pull-left radiochoice_item on setgeneratecodr_item"
												id='radiochoice_item_nameY'>
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab1_1" id="templatetab1_1"
													class="form_choice choiceclass" />
												</span> <label for="templatetab1_1">显示</label>
											</div>
											<div class="pull-left radiochoice_item setgeneratecodr_item"
												id='radiochoice_item_nameN'>
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab1_2" id="templatetab1_2"
													class="form_choice choiceclass" />
												</span> <label for="templatetab1_2">不显示</label>
											</div>
											<div class="pull-left radiochoice_item setgeneratecodr_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab1_3" id="templatetab1_3"
													class="form_choice choiceclass" />
												</span> <label for="templatetab1_3">自定义</label>
											</div>

										</div>
										<div class="pull-left message_imun">
											<label for="textfield"></label> <input type="text"
												name="textfield" id="textfield"
												class="form-control form-contro_style1 form-w_1" disabled>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item  clearboth set_messageitem">
										<div class="item_keyname item_keyname_twin pull-left">
											<span>昵</span>称：
										</div>
										<div
											class=" pull-left set_picture_background_style radiochoice_box setgeneratecodr">
											<div
												class="pull-left radiochoice_item on setgeneratecodr_item"
												id='radiochoice_item_nicknameY'>
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab2_1" id="templatetab2_1"
													class="form_choice choiceclass" />
												</span> <label for="templatetab2_1">显示</label>
											</div>
											<div class="pull-left radiochoice_item setgeneratecodr_item"
												id='radiochoice_item_nicknameN'>
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab2_2" id="templatetab2_2"
													class="form_choice choiceclass" />
												</span> <label for="templatetab2_2">不显示</label>
											</div>
											<div class="pull-left radiochoice_item setgeneratecodr_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab2_3" id="templatetab2_3"
													class="form_choice choiceclass" />
												</span> <label for="templatetab2_3">自定义</label>
											</div>
										</div>
										<div class="pull-left message_imun">
											<label for="textfield"></label> <input type="text"
												name="textfield" id="textfield"
												class="form-control form-contro_style1 form-w_1" disabled>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item  clearboth set_messageitem">
										<div class="item_keyname item_keyname_twin pull-left">
											<span>电</span>话：
										</div>
										<div
											class=" pull-left set_picture_background_style radiochoice_box setgeneratecodr">
											<div
												class="pull-left radiochoice_item on setgeneratecodr_item"
												id='radiochoice_item_telphoneY'>
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab3_1" id="templatetab3_1"
													class="form_choice choiceclass" />
												</span> <label for="templatetab3_1">显示</label>
											</div>
											<div class="pull-left radiochoice_item setgeneratecodr_item"
												id='radiochoice_item_telphoneN'>
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab3_2" id="templatetab3_2"
													class="form_choice choiceclass" />
												</span> <label for="templatetab3_2">不显示</label>
											</div>
											<div class="pull-left radiochoice_item setgeneratecodr_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab3_3" id="templatetab3_3"
													class="form_choice choiceclass" />
												</span> <label for="templatetab3_3">自定义</label>
											</div>
										</div>
										<div class="pull-left message_imun">
											<label for="textfield"></label> <input type="text"
												name="textfield" id="textfield"
												class="form-control form-contro_style1 form-w_1" disabled>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item  clearboth set_messageitem">
										<div class="item_keyname item_keyname_twin pull-left">
											<span>邮</span>箱：
										</div>
										<div
											class=" pull-left set_picture_background_style radiochoice_box setgeneratecodr">
											<div
												class="pull-left radiochoice_item on setgeneratecodr_item"
												id='radiochoice_item_emailY'>
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab4_1" id="templatetab4_1"
													class="form_choice choiceclass" />
												</span> <label for="templatetab4_1">显示</label>
											</div>
											<div class="pull-left radiochoice_item setgeneratecodr_item"
												id='radiochoice_item_emailN'>
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab4_2" id="templatetab4_2"
													class="form_choice choiceclass" />
												</span> <label for="templatetab4_2">不显示</label>
											</div>
											<div class="pull-left radiochoice_item setgeneratecodr_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab4_3" id="templatetab4_3"
													class="form_choice choiceclass" />
												</span> <label for="templatetab4_3">自定义</label>
											</div>
										</div>
										<div class="pull-left message_imun">
											<label for="textfield"></label> <input type="text"
												name="textfield" id="textfield"
												class="form-control form-contro_style1 form-w_1" disabled>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
									<!---------------form item  ---------------------->
									<div class="set_item  clearboth set_messageitem">
										<div class="item_keyname item_keyname_twin pull-left">
											<span>主</span>题：
										</div>
										<div
											class=" pull-left set_picture_background_style radiochoice_box setgeneratecodr">
											<div
												class="pull-left radiochoice_item on setgeneratecodr_item"
												id='radiochoice_item_themeY'>
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab5_1" id="templatetab5_1"
													class="form_choice choiceclass" />
												</span> <label for="templatetab5_1">显示</label>
											</div>
											<div class="pull-left radiochoice_item setgeneratecodr_item"
												id='radiochoice_item_themeN'>
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab5_2" id="templatetab5_2"
													class="form_choice choiceclass" />
												</span> <label for="templatetab5_2">不显示</label>
											</div>
											<div class="pull-left radiochoice_item setgeneratecodr_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab5_3" id="templatetab5_3"
													class="form_choice choiceclass" />
												</span> <label for="templatetab5_3">自定义</label>
											</div>
										</div>
										<div class="pull-left message_imun">
											<label for="textfield"></label> <input type="text"
												name="textfield" id="textfield"
												class="form-control form-contro_style1 form-w_1" disabled>
										</div>
									</div>
									<!---------------form-item  end  ---------------------->
								</div>
								<div class="form-botton">
									<input type="button" name="btnmessagepreview"
										id="btnmessagepreview" value="预览" class="btn btn_a"> <input
										type="button" name="btnmessagesubmit" id="btnmessagesubmit"
										value="确定提交" class="btn btn_a"> <input type="reset"
										name="button" id="button" value="重置" class="btn btn_b">
								</div>

							</form>
						</div>
						<div class="pull-left promptpreview">
							<div class="promptpreview_title text-center">效果预览</div>
							<div class="promptpreview_con  distable text-center"
								id='messagemodulecontent'>
								<div class="distablediv text-left">
									<div class="mod_message">
										<form action="" method="get">
											<label id="messagetitle"></label>
											<div class="mod_message_group">

												<div class="mod_message_item" id='messagemoduleusername'>
													<div class="mod_message_keft">姓名：</div>
													<div class="mod_message_mton">
														<input name="" type="text" id="" class="mod_message_tent">
													</div>
												</div>
												<div class="mod_message_item" id='messagemodulenikename'>
													<div class="mod_message_keft">昵称：</div>
													<div class="mod_message_mton">
														<input name="" type="text" id="" class="mod_message_tent">
													</div>
												</div>
												<div class="mod_message_item" id='messagemoduletelphone'>
													<div class="mod_message_keft">电话：</div>
													<div class="mod_message_mton">
														<input name="" type="text" id="" class="mod_message_tent">
													</div>
												</div>
												<div class="mod_message_item" id='messagemoduleemail'>
													<div class="mod_message_keft">邮箱：</div>
													<div class="mod_message_mton">
														<input name="" type="text" id="" class="mod_message_tent">
													</div>
												</div>
												<div class="mod_message_item" id='messagemoduletheme'>
													<div class="mod_message_keft">主题：</div>
													<div class="mod_message_mton">
														<input name="" type="text" id="" class="mod_message_tent">
													</div>
												</div>
												<div class="mod_message_item">
													<div class="mod_message_keft">内容：</div>
													<div class="mod_message_mton">
														<textarea name="" cols="" rows="3"
															class="mod_message_tent"></textarea>
													</div>
												</div>
											</div>
											<div class="mod_message_gbuton">
												<input type="button" id="" name=""
													class="pew_massge_btn pew_massge_btn_a" value="提交" /> <input
													type="reset" id="" name=""
													class="pew_massge_btn pew_massge_btn_b" value="重置" />
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!------------------------  精选 模块  -------------------------->
<%--         <jsp:include  page="selecttemplate.html"/> --%>

		<!------------------------  图文 模块   -------------------------->
<%--         <jsp:include  page="picture_inagestext.html"/> --%>
		<!------------------------  图文 模块  -------------------------->
<!-- 		<div class="popup popupbg distable" id='imagecontentpop'
			style="display: none">
			<div class="distablediv">
				<div class="popupcontainer">
					<div class="poputitlee clearboth">
						<div class="pull-left poputitlee_name">图文模块</div>
						<div class="pull-right ">
							<div class="close  icon-iconfont-guanbi"></div>
						</div>
					</div>
					<div class="popupcontent">
						<form action="" method="get" enctype="multipart/form-data">
							---------------------------------
							<div class="popup-modularsettings  clearboth">

								-------------form item  --------------------
								<div class="set_item clearboth">
									<div class="item_keyname pull-left">模块标题：</div>
									<div class=" pull-left form-marginrigt">
										<label for="textfield"></label> <input type="text"
											class="easyui-textbox" name="textimagemodulename"
											id="textimagemodulename" style="width: 300px; height: 30px"
											data-options="required:true">
																				<input type="text"
											name="textfield" id="textfield"
											class="form-control form-contro_style1 form-w_3">
									</div>
									<div class="pull-left cim_dun checkboxchoice_box">
										<div class="checkboxchoice_item clearboth">
											<span class="checkboxchoice_co pull-left"> <input
												type="checkbox" name="checkbox" id="checkbox"
												class="choiceclass">
											</span> <label class="checkboxchoice_name pull-left" for="checkbox">
												<span class="checkboxchoice_name_t">显示</span>
											</label>
										</div>
									</div>
								</div>
								-------------form-item  end  --------------------
								-------------form item  --------------------
								<div class="set_item clearboth">
									<div class="item_keyname pull-left">模块尺寸：</div>
									<div class=" pull-left t">
										<label for="textimagemodulewidth"></label>
																				<input type="number"
											name="textfield" id="textfield"
											class="form-control form-contro_style1 form-w_0">
										<input class="easyui-numberspinner" id="textimagecontentwidth"
											style="width: 100px; height: 25px"
											data-options="required:true"></input>
									</div>
									<div class=" pull-left form-marginrigt">
										<span class="dropdown-inlineblock"> <select
											class="easyui-combobox" name="dropimagecontentwidth"
											style="width: 80px; height: 25px"
											data-options="required:true">
												<option value="0">像素</option>
												<option value="1">百分比</option>
										</select>
										</span>
									</div>
									<div class=" pull-left t">
										<label for="textfield"></label>
																				<input type="number"
											name="textfield" id="textfield"
											class="form-control form-contro_style1 form-w_0">
										<input class="easyui-numberspinner"
											id="textimagecontentheight"
											style="width: 100px; height: 25px"
											data-options="required:true"></input>
									</div>
									<div class=" pull-left form-marginrigt">
										<span class="dropdown-inlineblock"> <select
											class="easyui-combobox" name="dropimagecontentheight"
											style="width: 80px; height: 25px"
											data-options="required:true">
												<option value="0">像素</option>
												<option value="1">百分比</option>
										</select>
										</span>
									</div>
								</div>
								-------------form-item  end  --------------------

							</div>
							----------------内容设置 -----------------
							<div class="popup_main">
								-------------form item  --------------------
								<div class="set_item  popupmain_setitem clearboth">
									<div class="item_keyname pull-left">图文排列：</div>
									<div class=" pull-left set_miustyle set_inagestext ">
										<ul class="clearboth">
											<li
												class="pull-left  form-marginrigt set_inagestext_a artive"></li>
											<li class="pull-left  form-marginrigt set_inagestext_b"></li>
											<li class="pull-left  form-marginrigt set_inagestext_c"></li>
											<li class="pull-left  form-marginrigt set_inagestext_d"></li>
										</ul>
									</div>
								</div>
								-------------form-item  end  --------------------
								-------------form item  --------------------
								<div class="set_item clearboth">
									<div class="item_keyname pull-left">图片尺寸：</div>
									<div class=" pull-left t">
										<label for="textfield"></label> <input
											class="easyui-numberspinner" id="textimagetemplatewidth"
											style="width: 100px; height: 25px"
											data-options="required:true"></input>
																				<input type="number"
											name="textfield" id="textfield"
											class="form-control form-contro_style1 form-w_0">
									</div>
									<div class=" pull-left form-marginrigt">
										<span class="dropdown-inlineblock"> <select
											class="easyui-combobox" name="dropimagetemplatewidth"
											style="width: 80px; height: 25px"
											data-options="required:true">
																						<select name=""
											tabindex="4" class="dropdown rimsn ">
												<option value="April">像素</option>
												<option value="5">百分比</option>
										</select>
										</span>
									</div>
									<div class=" pull-left t">
										<label for="textimagetemplateheight"></label> <input
											class="easyui-numberspinner" id="textimagetemplateheight"
											style="width: 100px; height: 25px"
											data-options="required:true"></input>
																				<input type="number"
											name="textfield" id="textfield"
											class="form-control form-contro_style1 form-w_0">
									</div>
									<div class=" pull-left form-marginrigt">
										<span class="dropdown-inlineblock"> <select
											class="easyui-combobox" name="dropimagetemplateheight"
											style="width: 80px; height: 25px"
											data-options="required:true">
																						<select name=""
											tabindex="4" class="dropdown rimsn ">
												<option value="April">像素</option>
												<option value="5">百分比</option>
										</select>
										</span>
									</div>
									<div class="pull-left cim_dun checkboxchoice_box">
										<div class="checkboxchoice_item clearboth">
											<span class="checkboxchoice_co pull-left"> <input
												type="checkbox" name="checkbox2" id="checkbox2"
												class="choiceclass">
											</span> <label class="checkboxchoice_name pull-left" for="checkbox2">
												<span class="checkboxchoice_name_t">默认</span>
											</label>
										</div>
									</div>
								</div>
								-------------form-item  end  --------------------
								-------------form item  --------------------
								<div class="set_item set_backgroundimages_item clearboth">
									<div class="item_keyname pull-left">图片文件：</div>
									<div class="pull-left set_imagestextupload_c form-marginrigt"
										id="imagetemplateuploaddiv">
										<img id='imagetemplatesrc' src="" />
									</div>
									<div class="pull-left  checkboxchoice_box ">
										<div
											class=" clearboth set_backgroundimages_upload backgcarousel_upload">
											<div
												class="pull-left form-marginrigt   set_backgroundimages_upload_btn">
												<span class="icon-uniE92D"></span> <label for="fileField"></label>
												<input type="file" name="imagetemplateupload"
													id="imagetemplateupload"
													class="choiceclass backgroundfileclass">
											</div>
											<div class=" pull-left set_backgroundimages_upload_prompt">
												<p>文件大小：支持上传3M内的图片</p>
												<p>文件格式：支持 .jpg .jpeg .gif .png .bmp图片格式</p>
											</div>
										</div>
									</div>
								</div>
								-------------form-item  end  --------------------

								-------------form item  --------------------
								<div class="set_item set_backgroundimages_item clearboth">
									<div class="item_keyname pull-left">模块内容：</div>
									<div class="pull-left  ">
										<textarea id='textareaimgmodule' name="" cols="" rows="8"
											class="form-w_8"></textarea>
									</div>
								</div>
								-------------form-item  end  --------------------
							</div>
							<div class="form-botton">
								<input type="button" name="btnimagemodulesubmit"
									id="btnimagemodulesubmit" value="确定提交" class="btn btn_a">
								<input type="reset" name="button" id="button" value="重置"
									class="btn btn_b">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div> -->

		<!------------------------  纯文 模块  -------------------------->
<!-- 		<div class="popup popupbg distable" id='imagefontmodulepop'
			style="display: none">
			<div class="distablediv">
				<div class="popupcontainer">
					<div class="poputitlee clearboth">
						<div class="pull-left poputitlee_name">纯文模块</div>
						<div class="pull-right ">
							<div class="close  icon-iconfont-guanbi"></div>
						</div>
					</div>
					<div class="popupcontent">
						<form action="" method="get" enctype="multipart/form-data">
							---------------------------------
							<div class="popup-modularsettings  clearboth">

								-------------form item  --------------------
								<div class="set_item clearboth">
									<div class="item_keyname pull-left">模块标题：</div>
									<div class=" pull-left form-marginrigt">
										<label for="textfield"></label> <input type="text"
											class="easyui-textbox" name="textimagefontmodulename"
											id="textimagefontmodulename"
											style="width: 300px; height: 30px"
											data-options="required:true">
									</div>
									<div class="pull-left cim_dun checkboxchoice_box">
										<div class="checkboxchoice_item clearboth">
											<span class="checkboxchoice_co pull-left"> <input
												type="checkbox" name="checkbox" id="checkbox"
												class="choiceclass">
											</span> <label class="checkboxchoice_name pull-left" for="checkbox">
												<span class="checkboxchoice_name_t">显示</span>
											</label>
										</div>
									</div>
								</div>
								-------------form-item  end  --------------------
								-------------form item  --------------------
								<div class="set_item clearboth">
									<div class="item_keyname pull-left">模块尺寸：</div>
									<div class=" pull-left t">
										<label for="numberimagefontwidth"></label> <input
											class="easyui-numberspinner" id="numberimagefontwidth"
											style="width: 100px; height: 25px"
											data-options="required:true"></input>
									</div>
									<div class=" pull-left form-marginrigt">
										<span class="dropdown-inlineblock"> <select
											class="easyui-combobox" name="dropimagefontwidth"
											style="width: 80px; height: 25px"
											data-options="required:true">
												<option value="April">像素</option>
												<option value="5">百分比</option>
										</select>
										</span>
									</div>
									<div class=" pull-left t">
										<label for="numberimagefontheight"></label> <input
											class="easyui-numberspinner" id="numberimagefontheight"
											style="width: 100px; height: 25px"
											data-options="required:true"></input>
																				<input type="number"
											name="textfield" id="textfield"
											class="form-control form-contro_style1 form-w_0">
									</div>
									<div class=" pull-left form-marginrigt">
										<span class="dropdown-inlineblock"> <select
											class="easyui-combobox" name="dropimagefontheight"
											style="width: 80px; height: 25px"
											data-options="required:true">
												<option value="April">像素</option>
												<option value="5">百分比</option>
										</select>
										</span>
									</div>
								</div>
								-------------form-item  end  --------------------

							</div>
							----------------内容设置 -----------------
							<div class="popup_main">
								-------------form item  --------------------
								<div class="set_item set_backgroundimages_item clearboth">
									<div class="item_keyname pull-left">模块内容：</div>
									<div class="pull-left  ">
										<textarea id='textareaimagefont' name="" cols="" rows="18"
											class="form-w_8"></textarea>
									</div>
								</div>
								-------------form-item  end  --------------------
							</div>
							<div class="form-botton">
								<input type="button" name="btnimagefontmodule"
									id="btnimagefontmodule" value="确定提交" class="btn btn_a">
								<input type="reset" name="button" id="button" value="重置"
									class="btn btn_b">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div> -->
		<!------------------------  文章列表 模块  -------------------------->
<!-- 		<div class="popup popupbg distable" id='imagearticlelistmodulepop'
			style="display: none">
			<div class="distablediv">
				<div class="popupcontainer">
					<div class="poputitlee clearboth">
						<div class="pull-left poputitlee_name">文章列表模块</div>
						<div class="pull-right ">
							<div class="close  icon-iconfont-guanbi"></div>
						</div>
					</div>
					<div class="popupcontent">
						<form action="" method="get" enctype="multipart/form-data">
							---------------------------------
							<div class="popup-modularsettings  clearboth">
								-------------form item  --------------------
								<div class="set_item clearboth">
									<div class="item_keyname pull-left">模块标题：</div>
									<div class=" pull-left form-marginrigt">
										<label for="textimagearticlelistmodulename"></label> <input
											type="text" class="easyui-textbox"
											name="textimagearticlelistmodulename"
											id="textimagearticlelistmodulename"
											style="width: 300px; height: 30px"
											data-options="required:true">
									</div>
									<div class="pull-left cim_dun checkboxchoice_box">
										<div class="checkboxchoice_item clearboth">
											<span class="checkboxchoice_co pull-left"> <input
												type="checkbox" name="checkbox" id="checkbox"
												class="choiceclass">
											</span> <label class="checkboxchoice_name pull-left" for="checkbox">
												<span class="checkboxchoice_name_t">显示</span>
											</label>
										</div>
									</div>
								</div>
								-------------form-item  end  --------------------
								-------------form item  --------------------
								<div class="set_item clearboth">
									<div class="item_keyname pull-left">模块尺寸：</div>
									<div class=" pull-left t">
										<label for="numberimagearticlelistwidth"></label> <input
											class="easyui-numberspinner" id="numberimagearticlelistwidth"
											style="width: 100px; height: 25px"
											data-options="required:true"></input>
									</div>
									<div class=" pull-left form-marginrigt">
										<span class="dropdown-inlineblock"> <select
											class="easyui-combobox" name="dropimagearticlelistwidth"
											style="width: 80px; height: 25px"
											data-options="required:true">
												<option value="0">像素</option>
												<option value="1">百分比</option>
										</select>
										</span>
									</div>
									<div class=" pull-left t">
										<label for="numberimagearticlelistheight"></label> <input
											class="easyui-numberspinner"
											id="numberimagearticlelistheight"
											style="width: 100px; height: 25px"
											data-options="required:true"></input>
									</div>
									<div class=" pull-left form-marginrigt">
										<span class="dropdown-inlineblock"> <select
											class="easyui-combobox" name="dropimagearticlelistheight"
											style="width: 80px; height: 25px"
											data-options="required:true">
												<option value="0">像素</option>
												<option value="1">百分比</option>
										</select>
										</span>
									</div>
								</div>
								-------------form-item  end  --------------------
							</div>
							<div class="set_articlelistab set_coltab">
								<ul class=" clearboth">
									<Li class=" pull-left text-center artive">内容</Li>
									<li class="pull-left text-center">设置</li>
								</ul>
							</div>
							----------------内容设置 -----------------
							<div class="popup_main">
								<div class="set_coltab_cont articlelist_cont">
									-------------form item  --------------------
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">显示内容：</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock form-w_2"> <select
												class="easyui-combobox" name="dropimagearticlelist"
												style="width: 130px; height: 25px"
												data-options="required:true">
													<option value="0">首页</option>
													<option value="1">文章列表</option>
													<option value="2">网站公告</option>
											</select>
											</span>
										</div>
										<div class=" pull-left form-marginrigt">
											<span class="dropdown-inlineblock form-w_2"> <select
												class="easyui-combobox" name="dropimagearticlelistmodule"
												style="width: 200px; height: 25px"
												data-options="required:true">
													<option value="0">公司新闻</option>
													<option value="1">行业动态</option>
													<option value="2">最新行情</option>
											</select>
											</span>
										</div>
									</div>
									-------------form-item  end  --------------------
									-------------form item  --------------------
									<div
										class="set_item set_backgroundimages_item clearboth picture_uploadlist set_finrom_table">
										<table id='tableimagearticle' width="100%" border="0"
											cellspacing="0" cellpadding="0">
											<tr>
												<th width="27%" align="left" scope="row"><span>标题</span>
													<a href="" class="icon-xiangxia "></a></th>
												<th width="20%" align="left" scope="row">链接</th>
												<th width="16%" align="left" scope="row">打开方式</th>
												<th width="22%" align="left" scope="row"><span>日期</span>
													<a href="" class="icon-xiangxia "></a></th>
												<th width="15%" scope="row">操作</th>
											</tr>
											--------------item    --------------------
											<tr id="articlelist1">
												<td><label for="textimagefontmoduleitem1"></label> <input
													type="text" class="easyui-textbox"
													name="textimagefontmoduleitem1"
													id="textimagefontmoduleitem1"
													style="width: 220px; height: 30px"></td>

												<td align="left"><label for="textimagefontlinkitem1"></label>
													<input type="text" class="easyui-validatebox textbox"
													name="textimagefontlinkitem1" id="textimagefontlinkitem1"
													style="width: 170px; height: 30px"
													data-options="prompt:'Enter your URL.',validType:'url'"></td>
												</td>
												<td><span class="dropdown-inlineblock form-w_1_5">
														<select class="easyui-combobox"
														name="dropimagearticlelistitem1"
														style="width: 150px; height: 25px"
														data-options="required:true">
															<option value="0">当前页面打开</option>
															<option value="1">新窗口打开</option>
													</select>
												</span></td>
												<td align="left"><label for="textfield"></label> <input
													type="text" class="easyui-datebox"
													name="textimagefontdateitem1" id="textimagefontdateitem1"
													editable=false style="width: 120px"></td>
												<td align="center"><a class="btn red"
													id='linkarticlelistdel1'>删除</a></td>
											</tr>

											--------------item    --------------------
											<tr id="articlelist2">
												<td><label for="textimagefontmoduleitem2"></label> <input
													type="text" class="easyui-textbox"
													name="textimagefontmoduleitem2"
													id="textimagefontmoduleitem2"
													style="width: 220px; height: 30px"></td>

												<td align="left"><label for="textfield"></label> <input
													type="text" class="easyui-validatebox textbox"
													name="textimagefontlinkitem2" id="textimagefontlinkitem2"
													style="width: 170px; height: 30px"
													data-options="prompt:'Enter your URL.',validType:'url'"></td>
												<td><span class="dropdown-inlineblock form-w_1_5">
														<select class="easyui-combobox"
														name="dropimagearticlelistitem2"
														style="width: 150px; height: 25px"
														data-options="required:true">
															<option value="April">当前页面打开</option>
															<option value="5">新窗口打开</option>
													</select>
												</span></td>
												<td align="left"><label for="textimagefontdateitem2"></label>
													<input type="text" class="easyui-datebox"
													name="textimagefontdateitem2" id="textimagefontdateitem2"
													editable=false style="width: 120px"></td>
												<td align="center"><a class="btn red"
													id='linkarticlelistdel2'>删除</a></td>
											</tr>
											--------------item    --------------------
											<tr id="articlelist3">
												<td><label for="textimagefontmoduleitem3"></label> <input
													type="text" class="easyui-textbox"
													name="textimagefontmoduleitem3"
													id="textimagefontmoduleitem3"
													style="width: 220px; height: 30px"></td>

												<td align="left"><label for="textimagefontlinkitem3"></label>
													<input type="text" class="easyui-validatebox textbox"
													name="textimagefontlinkitem3" id="textimagefontlinkitem3"
													style="width: 170px; height: 30px"
													data-options="prompt:'Enter your URL.',validType:'url'"></td>
												<td><span class="dropdown-inlineblock form-w_1_5">
														<select class="easyui-combobox"
														name="dropimagearticlelistitem3"
														style="width: 150px; height: 25px"
														data-options="required:true">
															<option value="0">当前页面打开</option>
															<option value="1">新窗口打开</option>
													</select>
												</span></td>
												<td align="left"><label for="textfield"></label> <input
													type="text" class="easyui-datebox"
													name="textimagefontdateitem3" id="textimagefontdateitem3"
													editable=false style="width: 120px"></td>
												<td align="center"><a class="btn red"
													id='linkarticlelistdel3'>删除</a></td>
											</tr>
											--------------item    --------------------
											<tr id="articlelist4">
												<td><label for="textimagefontmoduleitem4"></label> <input
													type="text" class="easyui-textbox"
													name="textimagefontmoduleitem4"
													id="textimagefontmoduleitem4"
													style="width: 220px; height: 30px"></td>

												<td align="left"><label for="textimagefontlinkitem4"></label>
													<input type="text" class="easyui-validatebox textbox"
													name="textimagefontlinkitem4" id="textimagefontlinkitem4"
													style="width: 170px; height: 30px"
													data-options="prompt:'Enter your URL.',validType:'url'"></td>
												<td><span class="dropdown-inlineblock form-w_1_5">
														<select class="easyui-combobox"
														name="dropimagearticlelistitem4"
														style="width: 150px; height: 25px"
														data-options="required:true">
															<option value="0">当前页面打开</option>
															<option value="1">新窗口打开</option>
													</select>
												</span></td>
												<td align="left"><label for="textfield"></label> <input
													type="text" class="easyui-datebox"
													name="textimagefontdateitem4" id="textimagefontdateitem4"
													editable=false style="width: 120px"></td>
												<td align="center"><a class="btn red"
													id='linkarticlelistdel4'>删除</a></td>
											</tr>
											--------------item    --------------------
											<tr id="articlelist5">
												<td><label for="textimagefontmoduleitem5"></label> <input
													type="text" class="easyui-textbox"
													name="textimagefontmoduleitem5"
													id="textimagefontmoduleitem5"
													style="width: 220px; height: 30px"></td>

												<td align="left"><label for="textimagefontlinkitem5"></label>
													<input type="text" class="easyui-validatebox textbox"
													name="textimagefontlinkitem5" id="textimagefontlinkitem5"
													style="width: 170px; height: 30px"
													data-options="prompt:'Enter your URL.',validType:'url'"></td>
												<td><span class="dropdown-inlineblock form-w_1_5">
														<select class="easyui-combobox"
														name="dropimagearticlelistitem5"
														style="width: 150px; height: 25px"
														data-options="required:true">
															<option value="0">当前页面打开</option>
															<option value="1">新窗口打开</option>
													</select>
												</span></td>
												<td align="left"><label for="textfield"></label> <input
													type="text" class="easyui-datebox"
													name="textimagefontdateitem5" id="textimagefontdateitem5"
													editable=false style="width: 120px"></td>
												<td align="center"><a class="btn red"
													id='linkarticlelistdel5'>删除</a></td>
											</tr>
											--------------item    --------------------
											<tr id="articlelist6">
												<td><label for="textfield"></label> <input type="text"
													class="easyui-textbox" name="textimagefontmoduleitem6"
													id="textimagefontmoduleitem6"
													style="width: 220px; height: 30px"></td>

												<td align="left"><label for="textimagefontlinkitem6"></label>
													<input type="text" class="easyui-validatebox textbox"
													name="textimagefontlinkitem6" id="textimagefontlinkitem6"
													style="width: 170px; height: 30px"
													data-options="prompt:'Enter your URL.',validType:'url'"></td>
												<td><span class="dropdown-inlineblock form-w_1_5">
														<select class="easyui-combobox"
														name="dropimagearticlelistitem6"
														style="width: 150px; height: 25px"
														data-options="required:true">
															<option value="0">当前页面打开</option>
															<option value="1">新窗口打开</option>
													</select>
												</span></td>
												<td align="left"><label for="textimagefontdateitem6"></label>
													<input type="text" class="easyui-datebox"
													name="textimagefontdateitem6" id="textimagefontdateitem6"
													editable=false style="width: 120px"></td>
												<td align="center"><a class="btn red"
													id='linkarticlelistdel6'>删除</a></td>
											</tr>
										</table>
									</div>
								</div>
								-------------设置   --------------------
								<div class="set_coltab_cont articlelist_cont none">
									-------------form item  --------------------
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">每页条数：</div>
										<div class=" pull-left form-marginrigt">
											<label for="textfield"></label> <input type="text"
												name="textfield" id="textfield"
												class="form-control form-contro_style1 form-w_1"> 页
										</div>
										<div class="pull-left cim_dun checkboxchoice_box">
											<div class="checkboxchoice_item clearboth">
												<span class="checkboxchoice_co pull-left"> <input
													type="checkbox" name="checkbox" id="checkbox"
													class="choiceclass">
												</span> <label class="checkboxchoice_name pull-left" for="checkbox">
													<span class="checkboxchoice_name_t">显示分页</span>
												</label>
											</div>
										</div>
									</div>
									-------------form-item  end  --------------------
									-------------form item  --------------------
									<div class="set_item set_item_e clearboth">
										<div class="item_keyname pull-left">显示日期：</div>
										<div class="set_picture_background_style radiochoice_box">
											<div class="pull-left radiochoice_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab1" id="templatetab1"
													class="form_choice choiceclass" />
												</span> <label for="templatetab1">是</label>
											</div>
											<div class="pull-left radiochoice_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab2" id="templatetab2"
													class="form_choice choiceclass" />
												</span> <label for="templatetab2">否</label>
											</div>
										</div>
									</div>
									-------------form-item  end  --------------------
									-------------form item  --------------------
									<div class="set_item clearboth">
										<div class="item_keyname pull-left">排列顺序：</div>
										<div class="pull-left radiochoice_item">
											<span class="dropdown-inlineblock form-w_2"> <select
												name="" tabindex="4" class="dropdown rimsn ">
													<option value="April">发布时间</option>
													<option value="5">标题首字母</option>
											</select>
											</span>
										</div>
									</div>
									-------------form-item  end  --------------------
									-------------form item  --------------------
									<div class="set_item set_item_e clearboth ">
										<div class="item_keyname pull-left">更多显示：</div>
										<div class="set_picture_background_style radiochoice_box">
											<div class="pull-left radiochoice_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab1" id="templatetab1"
													class="form_choice choiceclass" />
												</span> <label for="templatetab1">是</label>
											</div>
											<div class="pull-left radiochoice_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab2" id="templatetab2"
													class="form_choice choiceclass" />
												</span> <label for="templatetab2">否</label>
											</div>
										</div>
									</div>
									-------------form-item  end  --------------------
									-------------form item  --------------------
									<div class="set_item set_item_e clearboth ">
										<div class="item_keyname pull-left">自动更新：</div>
										<div class="set_picture_background_style radiochoice_box">
											<div class="pull-left radiochoice_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab1" id="templatetab1"
													class="form_choice choiceclass" />
												</span> <label for="templatetab1">是</label>
											</div>
											<div class="pull-left radiochoice_item">
												<span class="radiochoice_co"> <input type="radio"
													name="templatetab2" id="templatetab2"
													class="form_choice choiceclass" />
												</span> <label for="templatetab2">否</label>
											</div>
										</div>
									</div>
									-------------form-item  end  --------------------
								</div>
							</div>
							<div class="form-botton">
								<input type="button" name="btnimagearticlelistsubmit"
									id="btnimagearticlelistsubmit" value="确定提交" class="btn btn_a">
								<input type="reset" name="button" id="button" value="重置"
									class="btn btn_b">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
 -->
		<!------------------------  表格 模块  -------------------------->
<!-- 		<div class="popup popupbg distable" id='imagearticletablemodulepop'
			style="display: none">
			<div class="distablediv">
				<div class="popupcontainer">
					<div class="poputitlee clearboth">
						<div class="pull-left poputitlee_name">表格模块</div>
						<div class="pull-right ">
							<div class="close  icon-iconfont-guanbi"></div>
						</div>
					</div>
					<div class="popupcontent">
						<form action="" method="get" enctype="multipart/form-data">
							---------------------------------
							<div class="popup-modularsettings  clearboth">

								-------------form item  --------------------
								<div class="set_item clearboth">
									<div class="item_keyname pull-left">模块标题：</div>
									<div class=" pull-left form-marginrigt">
										<label for="textimagearticletablemodulename"></label> <input
											type="text" class="easyui-textbox"
											name="textimagearticletablemodulename"
											id="textimagearticletablemodulename"
											style="width: 300px; height: 30px"
											data-options="required:true">
									</div>
									<div class="pull-left cim_dun checkboxchoice_box">
										<div class="checkboxchoice_item clearboth">
											<span class="checkboxchoice_co pull-left"> <input
												type="checkbox" name="checkbox" id="checkbox"
												class="choiceclass">
											</span> <label class="checkboxchoice_name pull-left" for="checkbox">
												<span class="checkboxchoice_name_t">显示</span>
											</label>
										</div>
									</div>
								</div>
								-------------form-item  end  --------------------
								-------------form item  --------------------
								<div class="set_item clearboth">
									<div class="item_keyname pull-left">模块尺寸：</div>
									<div class=" pull-left t">
										<label for="numberimagearticletablewidth"></label> <input
											class="easyui-numberspinner"
											id="numberimagearticletablewidth"
											style="width: 100px; height: 25px"
											data-options="required:true"></input>
									</div>
									<div class=" pull-left form-marginrigt">
										<span class="dropdown-inlineblock"> <select
											class="easyui-combobox" name="dropimagearticletablewidth"
											style="width: 80px; height: 25px"
											data-options="required:true">
												<option value="0">像素</option>
												<option value="1">百分比</option>
										</select>
										</span>
									</div>
									<div class=" pull-left t">
										<label for="numberimagearticletableheight"></label> <input
											class="easyui-numberspinner"
											id="numberimagearticletableheight"
											style="width: 100px; height: 25px"
											data-options="required:true"></input>
									</div>
									<div class=" pull-left form-marginrigt">
										<span class="dropdown-inlineblock"> <select
											class="easyui-combobox" name="dropimagearticletableheight"
											style="width: 80px; height: 25px"
											data-options="required:true">
												<option value="0">像素</option>
												<option value="1">百分比</option>
										</select>
										</span>
									</div>
								</div>
								-------------form-item  end  --------------------
							</div>
							----------------内容设置 -----------------
							<div class="popup_main scrollInner popupmain_ptop">
								-------------form item  --------------------
								<div class="set_item clearboth">
									<div class="item_keyname pull-left">表格尺寸：</div>
									<div class=" pull-left t">
										<label for="textfield"></label> <input
											class="easyui-numberspinner"
											id="numberimagearticletabletablewidth"
											style="width: 100px; height: 25px"
											data-options="required:true"></input>
									</div>
									<div class=" pull-left form-marginrigt">
										<span class="dropdown-inlineblock"> <select
											class="easyui-combobox"
											name="dropimagearticletabletablewidth"
											style="width: 80px; height: 25px"
											data-options="required:true">
												<option value="0">像素</option>
												<option value="1">百分比</option>
										</select>
										</span>
									</div>
									<div class=" pull-left t">
										<label for="textfield"></label> <input
											class="easyui-numberspinner"
											id="numberimagearticletabletableheight"
											style="width: 100px; height: 25px"
											data-options="required:true"></input>
									</div>
									<div class=" pull-left form-marginrigt">
										<span class="dropdown-inlineblock"> <select
											class="easyui-combobox"
											name="dropimagearticletabletableheight"
											style="width: 80px; height: 25px"
											data-options="required:true">
												<option value="0">像素</option>
												<option value="0">百分比</option>
										</select>
										</span>
									</div>
								</div>
								-------------form-item  end  --------------------
								-------------form item  --------------------
								<div class="set_item clearboth">
									<div class="item_keyname pull-left">边框大小：</div>
									<div class=" pull-left t">
										<label for="numberimagearticletabletableborder"></label> <input
											class="easyui-numberspinner"
											id="numberimagearticletabletableborder"
											style="width: 100px; height: 25px"
											data-options="required:true"></input> 像素
									</div>

								</div>
								-------------form-item  end  --------------------
								-------------form item  --------------------
								<div class="set_item ">
									<a class="setadd_btn form-marginrigt "
										id='linkarticletableaddrow'>添加行</a> <a
										id='linkarticletableaddcolumn'
										class="setadd_btn form-marginrigt">添加列</a>
								</div>
								-------------form-item  end  --------------------
								-------------form item  --------------------
								<div class="set_item setbtaboc" id='articletablemoduletablediv'>
									<table width="100%" border="1" cellspacing="0" cellpadding="0"
										class="settablebox" id='articletablemoduletable'>
										<tr class="tablerow" id='articletablerow0'>
											<th width="30%" align="left" class="settable_ocmo"
												scope="row">
																								<div class="settable_operation">
													<i class="icon icon-2"></i>
													<ul class="settable_col">
														<li class="setom_itemwidth"><span>宽度</span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_w"></li>
														<li class="setom_itemheight"><span>高度 </span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_h"></li>
														<li class="setom_itemhdel dellir">删除</li>
													</ul>
												</div>
												<div>
													<input type="text" name="articletabletd1-0"
														id="articletabletd1-0"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 265px">
												</div>
											</th>
											<th width="22%" align="left" class="settable_ocmo"
												scope="row">
																								<div class="settable_operation">
													<i class="icon icon-2"></i>
													<ul class="settable_col">
														<li class="setom_itemwidth"><span>宽度</span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_w"></li>
														<li class="setom_itemheight"><span>高度 </span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_h"></li>
														<li class="setom_itemhdel">删除</li>
													</ul>
												</div>
												<div>
													<input type="text" name="articletabletd2-0"
														id="articletabletd2-0"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 180px">
												</div>
											</th>
											<th width="22%" align="left" class="settable_ocmo"
												scope="row">
																								<div class="settable_operation">
													<i class="icon icon-2"></i>
													<ul class="settable_col">
														<li class="setom_itemwidth"><span>宽度</span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_w"></li>
														<li class="setom_itemheight"><span>高度 </span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_h"></li>
														<li class="setom_itemhdel delhang">删除</li>
													</ul>
												</div>
												<div>
													<input type="text" name="articletabletd3-0"
														id="articletabletd3-0"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 180px">
												</div>
											</th>
											<th width="26%" align="left" class="settable_ocmo"
												scope="row">
																								<div class="settable_operation">
													<i class="icon icon-2"></i>
													<ul class="settable_col">
														<li class="setom_itemwidth"><span>宽度</span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_w"></li>
														<li class="setom_itemheight"><span>高度 </span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_h"></li>
														<li class="setom_itemhdel delhang">删除</li>
													</ul>
												</div>
												<div>
													<input type="text" name="articletabletd4-0"
														id="articletabletd4-0"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 220px">
												</div>
											</th>
										</tr>
										<tr class="tablerow" id='articletablerow1'>
											<th align="left" class="settable_ocmo" scope="row">
																								<div class="settable_operation">
													<i class="icon icon-2"></i>
													<ul class="settable_col">
														<li class="setom_itemwidth"><span>宽度</span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_w"></li>
														<li class="setom_itemheight"><span>高度 </span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_h"></li>
														<li class="setom_itemhdel delhang">删除</li>
													</ul>
												</div>
												<div>
													<input type="text" name="articletabletd1-1"
														id="articletabletd1-1"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 265px">
												</div>
											</th>
											<td align="left">
												<div>
													<input type="text" name="articletabletd2-1"
														id="articletabletd2-1"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 180px">
												</div>
											</td>
											<td align="left">
												<div>
													<input type="text" name="articletabletd3-1"
														id="articletabletd3-1"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 180px">
												</div>
											</td>
											<td align="left">
												<div>
													<input type="text" name="articletabletd4-1"
														id="articletabletd4-1"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 220px">
												</div>
											</td>
										</tr>
										<tr class="tablerow" id='articletablerow2'>
											<th align="left" class="settable_ocmo" scope="row">
																							<div class="settable_operation">
													<i class="icon icon-2"></i>
													<ul class="settable_col">
														<li class="setom_itemwidth"><span>宽度</span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_w"></li>
														<li class="setom_itemheight"><span>高度 </span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_h"></li>
														<li class="setom_itemhdel delhang">删除</li>
													</ul>
												</div>
												<div>
													<input type="text" name="articletabletd1-2"
														id="articletabletd1-2"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 265px">
												</div>
											</th>
											<td align="left">
												<div>
													<input type="text" name="articletabletd2-2"
														id="articletabletd2-2"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 180px">
												</div>
											</td>
											<td align="left">
												<div>
													<input type="text" name="articletabletd3-2"
														id="articletabletd3-2"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 180px">
												</div>
											</td>
											<td align="left">
												<div>
													<input type="text" name="articletabletd4-2"
														id="articletabletd4-2"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 220px">
												</div>
											</td>
										</tr>
										<tr class="tablerow" id='articletablerow3'>
											<th align="left" class="settable_ocmo" scope="row">
																								<div class="settable_operation">
													<i class="icon icon-2"></i>
													<ul class="settable_col">
														<li class="setom_itemwidth"><span>宽度</span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_w"></li>
														<li class="setom_itemheight"><span>高度 </span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_h"></li>
														<li class="setom_itemhdel delhang">删除</li>
													</ul>
												</div>
												<div>
													<input type="text" name="articletabletd1-3"
														id="articletabletd1-3"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 265px">
												</div>
											</th>
											<td align="left">
												<div>
													<input type="text" name="articletabletd2-3"
														id="articletabletd2-3"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 180px">
												</div>
											</td>
											<td align="left">
												<div>
													<input type="text" name="articletabletd3-3"
														id="articletabletd3-3"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 180px">
												</div>
											</td>
											<td align="left">
												<div>
													<input type="text" name="articletabletd4-3"
														id="articletabletd4-3"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 220px">
												</div>
											</td>
										</tr>
										<tr class="tablerow" id='articletablerow4'>
											<th align="left" class="settable_ocmo" scope="row">
																								<div class="settable_operation">
													<i class="icon icon-2"></i>
													<ul class="settable_col">
														<li class="setom_itemwidth"><span>宽度</span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_w"></li>
														<li class="setom_itemheight"><span>高度 </span><input
															type="number" name="textfield" id="textfield"
															class="form-control  form-w_0 sotun_bom settable_h"></li>
														<li class="setom_itemhdel delhang">删除</li>
													</ul>
												</div>
												<div>
													<input type="text" name="articletabletd1-4"
														id="articletabletd1-4"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 265px">
												</div>
											</th>
											<td align="left">
												<div>
													<input type="text" name="articletabletd2-4"
														id="articletabletd2-4"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 180px">
												</div>
											</td>
											<td align="left">
												<div>
													<input type="text" name="articletabletd3-4"
														id="articletabletd3-4"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 180px">
												</div>
											</td>
											<td align="left">
												<div>
													<input type="text" name="articletabletd4-4"
														id="articletabletd4-4"
														class="form-control form-contro_style1 form-w  settableformvin_bnan"
														style="width: 220px">
												</div>
											</td>
										</tr>
									</table>

								</div>
								-------------form-item  end  --------------------
							</div>
							<div class="form-botton">
								<input type="button" name="btnarticletablesubmit"
									id="btnarticletablesubmit" value="确定提交" class="btn btn_a">
								<input type="reset" name="button" id="button" value="重置"
									class="btn btn_b">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div> -->
		
		<!------------------------  公告栏模块  -------------------------->
<%--         //<jsp:include  page="article_notice.html"/> --%>
        <!------------------------  浮层文字模块  -------------------------->
<%--         //<jsp:include  page="article_layer.html"/> --%>
	</div>

	<!--     <div class="main-content" id="maincontent">
                <iframe id="iframeResult" width="100%" height="100%" contentEditable=true>
            
                </iframe>
                </div> --> <!------------------------  编辑设置  -------------------------->
	<div id="page-setup" class="popup popupbg distable"
		style="display: none;">
		<div class="distablediv">
			<div class="popupcontainer">
				<div class="poputitlee clearboth">
					<div class="pull-left poputitlee_name">编辑设置</div>
					<div class="pull-right ">
						<div class="close  icon-iconfont-guanbi"></div>
					</div>
				</div>
				<div class="popupcontent">
					<form action="" method="get" enctype="multipart/form-data">
						<!------------------------------------->

						<!------------------内容设置 ------------------->
						<div class="popup_main popupmain_ptop">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="item_keyname pull-left">站点名称：</div>
								<div class=" pull-left form-marginrigt">
									<input type="number" name="textfield" id="textfield"
										class="form-control form-contro_style1 form-w_5">
								</div>
							</div>
							<!---------------form-item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="item_keyname pull-left">备 案 号：</div>
								<div class=" pull-left ">
									<input type="number" name="textfield" id="textfield"
										class="form-control form-contro_style1 form-w_5 form-marginrigt">
								</div>
							</div>
							<!---------------form-item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item  set_item_e clearboth">
								<div class="item_keyname pull-left">页面生成：</div>
								<div
									class=" pull-left set_picture_background_style radiochoice_box setgeneratecodr">
									<div class="pull-left radiochoice_item on setgeneratecodr_item">
										<span class="radiochoice_co"> <input type="radio"
											name="templatetab1" id="templatetab1"
											class="form_choice choiceclass" />
										</span> <label for="templatetab1">生成动态</label>
									</div>
									<div class="pull-left radiochoice_item setgeneratecodr_item">
										<span class="radiochoice_co"> <input type="radio"
											name="templatetab2" id="templatetab2"
											class="form_choice choiceclass" />
										</span> <label for="templatetab2">生成静态 </label>
									</div>
									<div class="pull-left radiochoice_item setgeneratecodr_item">
										<span class="radiochoice_co"> <input type="radio"
											name="templatetab2" id="templatetab2"
											class="form_choice choiceclass" />
										</span> <label for="templatetab2">伪静态 </label>
									</div>
								</div>
							</div>
							<!---------------form-item  end  ---------------------->

						</div>
						<div class="form-botton">
							<input type="submit" name="button" id="button" value="确定提交"
								class="btn btn_a"> <input type="reset" name="button"
								id="button" value="重置" class="btn btn_b">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!------------------------  SEO设置  -------------------------->
	<div id="seo-setup" class="popup popupbg distable "
		style="display: none;">
		<div class="distablediv">
			<div class="popupcontainer">
				<div class="poputitlee clearboth">
					<div class="pull-left poputitlee_name">SEO设置</div>
					<div class="pull-right ">
						<div class="close  icon-iconfont-guanbi"></div>
					</div>
				</div>
				<div class="popupcontent">
					<form action="" method="get" enctype="multipart/form-data">
						<!------------------------------------->

						<!------------------内容设置 ------------------->
						<div class="popup_main popupmain_ptop">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="item_keyname pull-left">选择栏目：</div>
								<div class=" pull-left form-marginrigt">
									<span class="dropdown-inlineblock form-w_4"> <select
										name="" tabindex="4" class="dropdown rimsn ">
											<option value="April">首页</option>
									</select>
									</span>
								</div>
							</div>
							<!---------------form-item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="item_keyname pull-left">页面标题：</div>
								<div class=" pull-left form-marginrigt">
									<input type="number" name="textfield" id="textfield"
										class="form-control form-contro_style1 form-w_5">
								</div>
							</div>
							<!---------------form-item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="item_keyname pull-left">关 键 词：</div>
								<div class=" pull-left ">
									<input type="number" name="textfield" id="textfield"
										class="form-control form-contro_style1 form-w_5 form-marginrigt">
									以“，”分隔每组关键字
								</div>
							</div>
							<!---------------form-item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="item_keyname pull-left">页面描述：</div>
								<div class=" pull-left ">
									<textarea name="" cols="" rows="10" class="form-w_8"></textarea>
								</div>
							</div>
							<!---------------form-item  end  ---------------------->

						</div>
						<div class="form-botton">
							<input type="submit" name="button" id="button" value="确定提交"
								class="btn btn_a"> <input type="reset" name="button"
								id="button" value="重置" class="btn btn_b">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!------------------------  属性设置  -------------------------->
	<div id="attribute-setup" class="popup popupbg distable"
		style="display: none;">
		<div class="distablediv">
			<div class="popupcontainer">
				<div class="poputitlee clearboth">
					<div class="pull-left poputitlee_name">页面属性设置</div>
					<div class="pull-right ">
						<div class="close  icon-iconfont-guanbi"></div>
					</div>
				</div>
				<div class="popupcontent">
					<form action="" method="get" enctype="multipart/form-data">
						<!------------------------------------->

						<!------------------内容设置 ------------------->
						<div class="popup_main popupmain_ptop">
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="item_keyname pull-left">页面类型：</div>
								<div class=" pull-left form-marginrigt">
									<span class="dropdown-inlineblock form-w_4"> <select
										name="" tabindex="4" class="dropdown rimsn ">
											<option value="April">首页</option>
									</select>
									</span>
								</div>
							</div>
							<!---------------form-item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="item_keyname pull-left">页面标题：</div>
								<div class=" pull-left form-marginrigt">
									<input type="number" name="textfield" id="textfield"
										class="form-control form-contro_style1 form-w_5">
								</div>
							</div>
							<!---------------form-item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="item_keyname pull-left">父级页面：</div>
								<div class=" pull-left form-marginrigt">
									<span class="dropdown-inlineblock form-w_4"> <select
										name="" tabindex="4" class="dropdown rimsn ">
											<option value="April">首页</option>
									</select>
									</span>
								</div>
							</div>
							<!---------------form-item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item clearboth">
								<div class="item_keyname pull-left">子级页面：</div>
								<div class=" pull-left form-marginrigt">
									<span class="dropdown-inlineblock form-w_4 form-marginrigt">
										<select name="" tabindex="4" class="dropdown rimsn ">
											<option value="April">首页</option>
									</select>
									</span> <a href="" class="red">删除</a>
								</div>
							</div>
							<!---------------form-item  end  ---------------------->
							<!---------------form item  ---------------------->
							<div class="set_item asinaddon">
								<a href="" class="setadd_btn "><i class="icon-uniE92D"></i>添加</a>
							</div>

						</div>
						<div class="form-botton">
							<input type="submit" name="button" id="button" value="确定提交"
								class="btn btn_a"> <input type="reset" name="button"
								id="button" value="重置" class="btn btn_b">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	</main>

	<script>
		$("#butcolorclick").cxColor();
		$("#partsbox_setbordercolor").cxColor();
		$("#partsbox_ititleset_color").cxColor();
		$("#partsbox_settitlebackgoud_color").cxColor();
		$("#partsbox_fontsitmecolor").cxColor();
		$("#partsbox_Projectioncolor").cxColor();
		$("#partsbox_fontbackgroundcolor").cxColor();
		$("#partsbox_imgbordercolor").cxColor();
		$("#partsbox_img_Projectioncolor").cxColor();
		$("#partsbox_imgbackgroundcolor").cxColor();
	</script>


</body>

</html>

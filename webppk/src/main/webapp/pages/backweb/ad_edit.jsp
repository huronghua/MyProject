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
<script type="text/javascript">
$(document).ready(function(){
	var $tab_li = $('.ad_contmin_title ul li');
	$tab_li.click(function(){
		$(this).addClass('artive').siblings().removeClass('artive');
		var index = $tab_li.index(this);
		$('.ad_contmin_m > .ad_contmin_m_col').eq(index).show().siblings().hide();
	});	
});
</script>
</head>
<body class="navbady">
   <div class="current">
      <i class="icon-iconfont-shouye"></i>
      <span>管理首页</span>><span>基本设置</span>><span>广告管理</span>><span>编辑</span>
   </div>
   <div class="container_min">
      <div class="container_edit_title">编辑内容</div>
      <div class="container_edit_contaer">
         <div class="form-group">
            <form action="" method="get">
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>广告标识：</div>
                  <div class="pull-left">
                     <div class="fmtu distable">
                         <div class="distablediv">searchTopBanner</div>
                     </div>
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>用户名：</div>
                  <div class="pull-left">
                     <label for="textfield"></label>
                     <input type="text" name="textfield" class="form-control form-border form-contro_w_e editformv_control" id="textfield" value="admin" >
                     <p class=" cor-gray propmt">（使用英文或数字表示的简洁标识）</p>
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>广告分类：</div>
                  <div class="pull-left">
                     <label for="select"></label>
                     <select name="select" id="select" class="form-control form-border form-contro_w_c" >
                       <option value="默认">默认</option>
                       <option value="禁用">禁用</option>
                     </select>
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>广告投放范围：</div>
                  <div class="pull-left">
                     <label for="select"></label>
                     <select name="select" id="select" class="form-control form-border form-contro_w_e" >
                       <option value="整站">整站</option>
                       <option value="禁用">禁用</option>
                     </select>
                     <P class=" cor-gray propmt">（使用英文或数字表示的简洁标识）</P>
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>广告位名称：</div>
                  <div class="pull-left">
                     <label for="textfield"></label>
                     <input type="text" name="textfield" class="form-control form-border form-contro_w_e editformv_control" id="textfield" value="搜索页面顶部banner广告" >
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red"></b>广告内容：</div>
                  <div class="pull-left">
                      <div class="ad_contmin">
                         <div class="ad_contmin_title">
                            <ul class="clearboth">
                               <li class="artive">代码</li>
                               <li>文字</li>
                               <li>图片</li>
                               <li>Flash</li>
                            </ul>
                         </div>
                         <div class="ad_contmin_m">
                            <!----------------代码------------------>
                            <div class="ad_contmin_m_col ad_contmin_m_col_a ">
                               <div class="ad_contmin_m_col_a_tt"><b>广告代码：</b>请填写广告代码，支持html代码</div>
                               <div>
                                  <textarea name="" cols="" rows="6" class="col-w-12"></textarea>
                               </div>
                            </div> 
                            <!----------------文字------------------>
                            <div class="ad_contmin_m_col">
                               <div class="from_item clearboth">
                                  <div class=" pull-left editform_t"2><b class="red">"</b>文字内容：</div>
                                  <div class="pull-left">
                                     <label for="textfield"></label>
                                     <input type="text" name="textfield" class="form-control form-border form-contro_w_e editformv_control" id="textfield" value="" >
                                  </div>
                               </div>
                               <div class="from_item clearboth">
                                  <div class=" pull-left editform_t"2><b class="red">*</b>文字链接：</div>
                                  <div class="pull-left">
                                     <label for="textfield"></label>
                                     <input type="text" name="textfield" class="form-control form-border form-contro_w_e editformv_control" id="textfield" value="" >
                                  </div>
                               </div>
                            </div> 
                             <!----------------图片------------------>
                            <div class="ad_contmin_m_col">
                               <div class="from_item clearboth">
                                  <div class=" pull-left editform_t"2><b class="red">"</b>图片地址：</div>
                                  <div class="pull-left">
                                     <label for="textfield"></label>
                                     <input type="text" name="textfield" class="form-control form-border form-contro_w_e editformv_control" id="textfield" value="" >
                                  </div>
                               </div>
                               <div class="from_item clearboth">
                                  <div class=" pull-left editform_t"2><b class="red">*</b>图片链接：</div>
                                  <div class="pull-left">
                                     <label for="textfield"></label>
                                     <input type="text" name="textfield" class="form-control form-border form-contro_w_e editformv_control" id="textfield" value="" >
                                  </div>
                               </div>
                               <div class="from_item clearboth">
                                  <div class=" pull-left editform_t"2><b class="red">*</b>图片宽度：</div>
                                  <div class="pull-left">
                                     <label for="textfield"></label>
                                     <input type="text" name="textfield" class="form-control form-border form-contro_w_a editformv_control" id="textfield" value="" > PX
                                  </div>
                               </div>
                               <div class="from_item clearboth">
                                  <div class=" pull-left editform_t"2><b class="red">*</b>图片高度：</div>
                                  <div class="pull-left">
                                     <label for="textfield"></label>
                                     <input type="text" name="textfield" class="form-control form-border form-contro_w_a editformv_control" id="textfield" value="" > PX
                                  </div>
                               </div>
                            </div> 
                             <!----------------Flash------------------>
                            <div class="ad_contmin_m_col">
                               <div class="from_item clearboth">
                                  <div class=" pull-left editform_t"2><b class="red">"</b>Flash地址：</div>
                                  <div class="pull-left">
                                     <label for="textfield"></label>
                                     <input type="text" name="textfield" class="form-control form-border form-contro_w_e editformv_control" id="textfield" value="" >
                                  </div>
                               </div>
                               <div class="from_item clearboth">
                                  <div class=" pull-left editform_t"2><b class="red">*</b>Flash宽度：</div>
                                  <div class="pull-left">
                                     <label for="textfield"></label>
                                     <input type="text" name="textfield" class="form-control form-border form-contro_w_a editformv_control" id="textfield" value="" > PX
                                  </div>
                               </div>
                               <div class="from_item clearboth">
                                  <div class=" pull-left editform_t"2><b class="red">*</b>Flash高度：</div>
                                  <div class="pull-left">
                                     <label for="textfield"></label>
                                     <input type="text" name="textfield" class="form-control form-border form-contro_w_a editformv_control" id="textfield" value="" > PX
                                  </div>
                               </div>
                            </div> 
                         </div>
                      </div>
                  </div>
               </div>
               <div class="form_btn">
                    <input type="submit" name="button" id="button" value="提交"  class="btn form-contro_w_b btn-primary" />
                    <input type="reset" name="button" id="button" value="重 置" class="btn form-contro_w_b  btn-reset" />
               </div>
            </form>
         </div>
         
      </div>
   </div>
</body>
</html>
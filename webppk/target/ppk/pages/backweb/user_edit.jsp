<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>用户管理</title>
 <!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="css/global.css">
<link href="css/layout.css" rel="stylesheet">
<link href="css/fonticon.css" rel="stylesheet">

</head>
<body class="navbady">
   <div class="current">
      <i class="icon-iconfont-shouye"></i>
      <span>管理首页</span>><span>基本设置</span>><span>用户管理</span>><span>编辑</span>
   </div>
   <div class="container_min">
      <div class="container_edit_title">编辑内容</div>
      <div class="container_edit_contaer">
         <div class="form-group">
            <form action="" method="get">
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>用户名：</div>
                  <div class="pull-left">
                     <label for="textfield"></label>
                     <input type="text" name="textfield" class="form-control form-border form-contro_w_e editformv_control" id="textfield">
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>姓名：</div>
                  <div class="pull-left">
                     <label for="textfield"></label>
                     <input type="text" name="textfield" class="form-control form-border form-contro_w_e editformv_control" id="textfield">
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>联系电话：</div>
                  <div class="pull-left">
                     <label for="textfield"></label>
                     <input type="text" name="textfield" class="form-control form-border form-contro_w_e editformv_control" id="textfield">
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>邮箱：</div>
                  <div class="pull-left">
                     <label for="textfield"></label>
                     <input type="text" name="textfield" class="form-control form-border form-contro_w_e editformv_control" id="textfield">
                  </div>
               </div>
               <div class="from_item clearboth">
                  <div class=" pull-left editform_t"2><b class="red">*</b>用户状态：</div>
                 <div class="pull-left">
                   <label for="select"></label>
                     <select name="select" id="select" class="form-control form-border form-contro_w_e" >
                       <option value="正常">正常</option>
                       <option value="禁用">禁用</option>
                     </select>
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

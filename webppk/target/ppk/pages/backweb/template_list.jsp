<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>角色管理</title>
 <!-- Bootstrap -->
<link rel="stylesheet" href="css/global.css">
<link href="css/layout.css" rel="stylesheet">
<link href="css/fonticon.css" rel="stylesheet">

</head>
<body class="navbady">
   <div class="current">
      <i class="icon-iconfont-shouye"></i>
      <span>管理首页</span>><span>基本设置</span>><span>模板管理</span>
   </div>
   <div class="container_min">
    <div class="listoperation clearboth">
                    <a href="template_details.jsp" class=" pull-left listoperation_add">
                    <i class="icon-iconfont-add"></i> 添加模板
                </a>
       <div class=" pull-left listoperation_search form-group">
          <form action="" method="get">
           <div class="pull-left form_item_inline">
           <label for="textfield">模板名称：</label>
           <input type="text" name="textfield" class="form-control form-border form-contro_w_b" id="textfield">
           </div>
           <div class="pull-left form_item_inline">
              <label for="textfield">类型：</label>
              <select name="select" id="select" class="form-control form-border form-contro_w_b form-controlselect" >
                  <option value="全部">全部</option>
                  <option value="企业">企业</option>
                  <option value="个人">个人</option>
           </select>
           </div>
           <div class="pull-left form_item_inline">
              <label for="textfield">排序：</label>
              <select name="select" id="select" class="form-control form-border form-contro_w_b form-controlselect" >
                 <option value="默认">默认</option>
                 <option value="时间排序">时间排序</option>
           </select>
           </div>
           <div class="pull-left">
             <input type="submit" name="button" id="button" class="btn btn-primary " value="提交">
           </div>
         </form>
       </div>       
      </div>
      <div class="templatelist">
           <ul class="templatelist_grep clearboth">
              <!--------------------------------item-------------------------------->
              <li class="templatelist_item pull-left">
                 <div class="templatelist_item_min">
                    <div class="img"><img src="images/tep_img1.jpg" ></div>
                    <div class="title">企业简约时尚商业网站</div>
                    <div class="info clearboth">
                       <div class=" pull-left text-hidden">编号：5232520</div>
                       <div class=" pull-left text-hidden">状态：<b class="red">启用</b></div>
                       <div class=" pull-left text-hidden">类型：PC版+移动版</div>
                       <div class=" pull-left text-hidden">用途：商业网站</div>
                    </div>
                    <div class="tbtm clearboth">
                       <a  href="template_details.html" class="btn pull-left">详情 </a>
                       <a  href="" class="btn blue pull-left">禁用 </a>
                       <a  href="" class="btn  red pull-left">删除 </a>
                    </div>
                 </div>
               </li>
               <!--------------------------------item-------------------------------->
              <li class="templatelist_item pull-left">
                 <div class="templatelist_item_min">
                    <div class="img"><img src="images/tep_img2.jpg"></div>
                    <div class="title">企业简约时尚商业网站</div>
                    <div class="info clearboth">
                       <div class=" pull-left text-hidden">编号：5232520</div>
                       <div class=" pull-left text-hidden">状态：<b class="red">启用</b></div>
                       <div class=" pull-left text-hidden">类型：PC版+移动版</div>
                       <div class=" pull-left text-hidden">用途：商业网站</div>
                    </div>
                    <div class="tbtm clearboth">
                       <a  href="template_details.html" class="btn pull-left">详情 </a>
                       <a  href="" class="btn blue pull-left">禁用 </a>
                       <a  href="" class="btn  red pull-left">删除 </a>
                    </div>
                 </div>
               </li>
               <!--------------------------------item-------------------------------->
              <li class="templatelist_item pull-left">
                 <div class="templatelist_item_min">
                    <div class="img"><img src="images/tep_img2.jpg"></div>
                    <div class="title">企业简约时尚商业网站</div>
                    <div class="info clearboth">
                       <div class=" pull-left text-hidden">编号：5232520</div>
                       <div class=" pull-left text-hidden">状态：<b class="red">启用</b></div>
                       <div class=" pull-left text-hidden">类型：PC版+移动版</div>
                       <div class=" pull-left text-hidden">用途：商业网站</div>
                    </div>
                    <div class="tbtm clearboth">
                       <a  href="template_details.html" class="btn pull-left">详情 </a>
                       <a  href="" class="btn blue pull-left">禁用 </a>
                       <a  href="" class="btn  red pull-left">删除 </a>
                    </div>
                 </div>
               </li>
                <!--------------------------------item-------------------------------->
              <li class="templatelist_item pull-left">
                 <div class="templatelist_item_min">
                    <div class="img"><img src="images/tep_img2.jpg"></div>
                    <div class="title">企业简约时尚商业网站</div>
                    <div class="info clearboth">
                       <div class=" pull-left text-hidden">编号：5232520</div>
                       <div class=" pull-left text-hidden">状态：<b class="red">启用</b></div>
                       <div class=" pull-left text-hidden">类型：PC版+移动版</div>
                       <div class=" pull-left text-hidden">用途：商业网站</div>
                    </div>
                    <div class="tbtm clearboth">
                       <a  href="template_details.html" class="btn pull-left">详情 </a>
                       <a  href="" class="btn blue pull-left">禁用 </a>
                       <a  href="" class="btn  red pull-left">删除 </a>
                    </div>
                 </div>
               </li>
                <!--------------------------------item-------------------------------->
              <li class="templatelist_item pull-left">
                 <div class="templatelist_item_min">
                    <div class="img"><img src="images/tep_img2.jpg"></div>
                    <div class="title">企业简约时尚商业网站</div>
                    <div class="info clearboth">
                       <div class=" pull-left text-hidden">编号：5232520</div>
                       <div class=" pull-left text-hidden">状态：<b class="red">启用</b></div>
                       <div class=" pull-left text-hidden">类型：PC版+移动版</div>
                       <div class=" pull-left text-hidden">用途：商业网站</div>
                    </div>
                    <div class="tbtm clearboth">
                       <a  href="template_details.html" class="btn pull-left">详情 </a>
                       <a  href="" class="btn blue pull-left">禁用 </a>
                       <a  href="" class="btn  red pull-left">删除 </a>
                    </div>
                 </div>
               </li>
                <!--------------------------------item-------------------------------->
              <li class="templatelist_item pull-left">
                 <div class="templatelist_item_min">
                    <div class="img"><img src="images/tep_img2.jpg" width="320" height="240"></div>
                    <div class="title">企业简约时尚商业网站</div>
                    <div class="info clearboth">
                       <div class=" pull-left text-hidden">编号：5232520</div>
                       <div class=" pull-left text-hidden">状态：<b class="red">启用</b></div>
                       <div class=" pull-left text-hidden">类型：PC版+移动版</div>
                       <div class=" pull-left text-hidden">用途：商业网站</div>
                    </div>
                    <div class="tbtm clearboth">
                       <a  href="template_details.html" class="btn pull-left">详情 </a>
                       <a  href="" class="btn blue pull-left">禁用 </a>
                       <a  href="" class="btn  red pull-left">删除 </a>
                    </div>
                 </div>
               </li>
                <!--------------------------------item-------------------------------->
              <li class="templatelist_item pull-left">
                 <div class="templatelist_item_min">
                    <div class="img"><img src="images/tep_img2.jpg" width="320" height="240"></div>
                    <div class="title">企业简约时尚商业网站</div>
                    <div class="info clearboth">
                       <div class=" pull-left text-hidden">编号：5232520</div>
                       <div class=" pull-left text-hidden">状态：<b class="red">启用</b></div>
                       <div class=" pull-left text-hidden">类型：PC版+移动版</div>
                       <div class=" pull-left text-hidden">用途：商业网站</div>
                    </div>
                    <div class="tbtm clearboth">
                       <a  href="template_details.html" class="btn pull-left">详情 </a>
                       <a  href="" class="btn blue pull-left">禁用 </a>
                       <a  href="" class="btn  red pull-left">删除 </a>
                    </div>
                 </div>
               </li>
                <!--------------------------------item-------------------------------->
              <li class="templatelist_item pull-left">
                 <div class="templatelist_item_min">
                    <div class="img"><img src="images/tep_img2.jpg" width="320" height="240"></div>
                    <div class="title">企业简约时尚商业网站</div>
                    <div class="info clearboth">
                       <div class=" pull-left text-hidden">编号：5232520</div>
                       <div class=" pull-left text-hidden">状态：<b class="red">启用</b></div>
                       <div class=" pull-left text-hidden">类型：PC版+移动版</div>
                       <div class=" pull-left text-hidden">用途：商业网站</div>
                    </div>
                    <div class="tbtm clearboth">
                       <a  href="template_details.html" class="btn pull-left">详情 </a>
                       <a  href="" class="btn blue pull-left">禁用 </a>
                       <a  href="" class="btn  red pull-left">删除 </a>
                    </div>
                 </div>
               </li>
           </ul> 
           <div class="listpaging ">
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
        </div>
      </div>
        
        
    </div>
</body>
</html>

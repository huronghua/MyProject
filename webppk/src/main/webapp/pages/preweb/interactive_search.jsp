<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>交互模块-搜索模块</title>
 <!-- Bootstr ap -->

<link href="css/fontsico.css" rel="stylesheet">
<link rel="stylesheet" href="css/jquery.cxcolor.css">
<link rel="stylesheet" href="css/global.css">
<link href="css/layout.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="js/style.js"></script>
<script src="js/jquery.cxcolor.min.js"></script>
<script src="js/jquery.easydropdown.js"></script>
<link rel="stylesheet" href="css/easydropdown.css"/>
</head>
<body>


<!------------------------  搜索模块 模块  -------------------------->
<div class="popup popupbg distable" >
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
                   <label for="textfield"></label>
                   <input type="text" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_3">
                 </div>
                 <div class="pull-left cim_dun checkboxchoice_box">
                   <div class="checkboxchoice_item clearboth">
                       <span class="checkboxchoice_co pull-left">
                          <input type="checkbox" name="checkbox" id="checkbox" class="choiceclass">
                       </span>
                       <label class="checkboxchoice_name pull-left" for="checkbox"> 
                          <span class="checkboxchoice_name_t">显示</span></label>
                   </div>
               </div>
            </div>  
            <!---------------form-item  end  ---------------------->
            <!---------------form item  ---------------------->
             <div class="set_item clearboth">
                 <div class="item_keyname pull-left">模块尺寸：</div>
                 <div class=" pull-left t">
                     <label for="textfield"></label>
                     <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_0">
                 </div>
                 <div class=" pull-left form-marginrigt">
                   <span class="dropdown-inlineblock" >
                     <select name=""  tabindex="4" class="dropdown rimsn ">
                        <option value="April">像素</option>
                        <option value="5">百分比</option>
                      </select>
                    </span>
                  </div>
                  <div class=" pull-left t">
                     <label for="textfield"></label>
                     <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_0">
                 </div>
                 <div class=" pull-left form-marginrigt">
                   <span class="dropdown-inlineblock" >
                     <select name=""  tabindex="4" class="dropdown rimsn ">
                        <option value="April">像素</option>
                        <option value="5">百分比</option>
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
                    <div class="checkboxchoice_item clearboth">
                       <span class="checkboxchoice_co pull-left">
                          <input type="checkbox" name="seachfanwei_qi" id="seachfanwei_qi" class="choiceclass">                       </span>
                        <label class="checkboxchoice_name pull-left" for="seachfanwei_qi"> 
                          <span class="checkboxchoice_name_t">全部</span></label>
                   </div>
                   <div class=" clearboth setseach_colgroup">
                      <ul class="clearboth">
                        <li class=" pull-left checkboxchoice_item ">
                           <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="seachfanwei_1" id="seachfanwei_1" class="choiceclass">                       </span>
                           <label class="checkboxchoice_name pull-left" for="seachfanwei_1"> 
                              <span class="checkboxchoice_name_t">关于我们</span></label>
                         </li>
                         <li class=" pull-left checkboxchoice_item ">
                           <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="seachfanwei_2" id="seachfanwei_2" class="choiceclass">                       </span>
                           <label class="checkboxchoice_name pull-left" for="seachfanwei_2"> 
                              <span class="checkboxchoice_name_t">新闻动态</span></label>
                         </li>
                         <li class=" pull-left checkboxchoice_item ">
                           <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="seachfanwei_3" id="seachfanwei_3" class="choiceclass">                       </span>
                           <label class="checkboxchoice_name pull-left" for="seachfanwei_3"> 
                              <span class="checkboxchoice_name_t">网站公告</span></label>
                         </li>
                         <li class=" pull-left checkboxchoice_item ">
                           <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="seachfanwei_4" id="seachfanwei_4" class="choiceclass">                       </span>
                           <label class="checkboxchoice_name pull-left" for="seachfanwei_4"> 
                              <span class="checkboxchoice_name_t">产品展示</span></label>
                         </li>
                         <li class=" pull-left checkboxchoice_item ">
                           <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="seachfanwei_5" id="seachfanwei_5" class="choiceclass">                       </span>
                           <label class="checkboxchoice_name pull-left" for="seachfanwei_5"> 
                              <span class="checkboxchoice_name_t">行业快报</span></label>
                         </li>
                         <li class=" pull-left checkboxchoice_item ">
                           <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="seachfanwei_6" id="seachfanwei_6" class="choiceclass">                       </span>
                           <label class="checkboxchoice_name pull-left" for="seachfanwei_6"> 
                              <span class="checkboxchoice_name_t">客户服务</span></label>
                         </li>
                      </ul>
                   </div>
               </div>
            </div>  
            <!---------------form-item  end  ---------------------->
              <!---------------form item  ---------------------->
             <div class="set_item clearboth">
                 <div class="item_keyname pull-left">搜索提示：</div>
                 <div class=" pull-left form-marginrigt">
                   <label for="textfield"></label>
                   <input type="text" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_3">
                 </div>
                 <div class="pull-left cim_dun checkboxchoice_box">
                   <div class="checkboxchoice_item clearboth">
                       <span class="checkboxchoice_co pull-left">
                          <input type="checkbox" name="checkbox" id="checkbox" class="choiceclass">                       </span>
                   </div>
               </div>
            </div>  
            <!---------------form-item  end  ---------------------->
            <!---------------form item  ---------------------->
             <div class="set_item clearboth">
                 <div class="item_keyname pull-left">关 键 字：</div>
                 <div class=" pull-left form-marginrigt">
                   <label for="textfield"></label>
                   <input type="text" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_3">
                   <p class="sermgupai_prompyt">每个关键字以“，“分隔</p>
                 </div>
                 <div class="pull-left cim_dun checkboxchoice_box">
                   <div class="checkboxchoice_item clearboth">
                       <span class="checkboxchoice_co pull-left">
                          <input type="checkbox" name="checkbox" id="checkbox" class="choiceclass">                       
                       </span>
                       <label class="checkboxchoice_name pull-left" for="checkbox"> 
                          <span class="checkboxchoice_name_t">显示</span></label>
                   </div>
               </div>
            </div>  
            <!---------------form-item  end  ---------------------->
          </div>
         <div class="form-botton">
              <input type="submit" name="button" id="button" value="确定提交" class="btn btn_a">
              <input type="reset" name="button" id="button" value="重置" class="btn btn_b">
         </div>
         
         </form>
         </div>
         <div class="pull-left promptpreview">
            <div class="promptpreview_title text-center">效果预览</div>
            <div class="promptpreview_con  distable text-center">
               <div class="distablediv text-left">
                  <div class="mod_search">
                      <div class=" clearboth">
                      <form action="" method="get">
                          <div class="s_ftom"><input name="" type="text" class="s_a"></div>
                          <div class="s_brn"><input name="" type="button" class="s_b" value="搜索"></div>
                       </form>
                      </div>
                      <div class="mod_seach_key">
                         <b>关键字：</b><a href="">企业发展</a><a href="">优质服务</a><a href="">创新</a><a href="">工程社工</a><a href="">行情资讯</a>
                      </div>
                  </div>
                  
               </div>
            </div>
         </div>
      </div>
   </div>
   </div>
</div>
<script>
$("#bgcolor").cxColor();
</script>
<script type="text/javascript" src="js/jquery.nicescroll.js"></script>
</body>

</html>

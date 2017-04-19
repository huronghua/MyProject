<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>交互模块-会员模块</title>
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


<!------------------------  会员模块 模块  -------------------------->
<div class="popup popupbg distable" >
   <div class="distablediv">
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
             <div class="set_item set_item_e clearboth">
                 <div class="item_keyname pull-left">注册按钮：</div>
                 <div class=" pull-left set_picture_background_style radiochoice_box setgeneratecodr">
                  <div class="pull-left radiochoice_item on setgeneratecodr_item">
                     <span class="radiochoice_co">
                     <input type="radio" name="templatetab1" id="templatetab1" class="form_choice choiceclass" />
                     </span>
                     <label for="templatetab1">显示</label>
                  </div>
                 <div class="pull-left radiochoice_item setgeneratecodr_item">
                     <span class="radiochoice_co">
                     <input type="radio" name="templatetab2" id="templatetab2" class="form_choice choiceclass" />
                     </span>
                     <label for="templatetab2">不显示</label>
                 </div>
               </div>
            </div>  
            <!---------------form-item  end  ---------------------->
            <!---------------form item  ---------------------->
             <div class="set_item set_item_e clearboth">
                 <div class="item_keyname pull-left">找回密码：</div>
                 <div class=" pull-left set_picture_background_style radiochoice_box setgeneratecodr">
                  <div class="pull-left radiochoice_item on setgeneratecodr_item">
                     <span class="radiochoice_co">
                     <input type="radio" name="templatetab1" id="templatetab1" class="form_choice choiceclass" />
                     </span>
                     <label for="templatetab1">显示</label>
                  </div>
                 <div class="pull-left radiochoice_item setgeneratecodr_item">
                     <span class="radiochoice_co">
                     <input type="radio" name="templatetab2" id="templatetab2" class="form_choice choiceclass" />
                     </span>
                     <label for="templatetab2">不显示</label>
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
                  <div class="modlogin">
                  <form action="" method="get">
                     <div class="modlogin_title">会员登录</div>
                     <div class="modlogin_group">
                        <div class="modlogin_item clearboth">
                           <div class="modlogin_ico modlogin_ico_a"><i></i></div>
                           <div class="modlogin_con">
                              <input name="username" type="text" id="username" class="mudusm_cim">
                           </div>
                        </div>
                        <div class="modlogin_item clearboth">
                           <div class="modlogin_ico modlogin_ico_b"><i></i></div>
                           <div class="modlogin_con">
                              <input name="username" type="text" id="username" class="mudusm_cim">
                           </div>
                        </div>
                     </div>
                     <div class="modlogin_button">
                        <p class=" clearboth">
                           <span class="modlogin_btnleft"><a href="">忘记登录密码</a></span>
                           <span class="modlogin_btnright"><a href="" class="red">免费注册</a></span>
                        </p>
                        <div><input type="button" id="" name="" class="modlogin_btn"  value="登  录"/></div>
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
<script>
$("#bgcolor").cxColor();
</script>
<script type="text/javascript" src="js/jquery.nicescroll.js"></script>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>交互模块-分享模块</title>
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


<!------------------------  分享 模块  -------------------------->
<div class="popup popupbg distable" >
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
          <div class="popup_main popupmain_ptop">
             <!---------------form item  ---------------------->
             <div class="set_item clearboth">
                 <div class="item_keyname pull-left">分享内容：</div>
                 <div class=" pull-left form-marginrigt">
                   <span class="dropdown-inlineblock form-w_2" >
                     <select name=""  tabindex="4" class="dropdown rimsn ">
                        <option value="April">整站</option>
                        <option value="5">文章列表</option>
                      </select>
                    </span>
                  </div>
            </div>  
            <!---------------form-item  end  ----------------------> 
            <!---------------form item  ---------------------->
             <div class="set_item clearboth">
                 <div class="item_keyname pull-left">分享说明：</div>
                 <div class=" pull-left form-marginrigt">
                   <label for="textfield"></label>
                   <input type="text" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_4" placeholder="输入说明文字">
                 </div>
            </div>  
            <!---------------form-item  end  ---------------------->
            <!---------------form item  ---------------------->
             <div class="set_item clearboth">
                 <div class="item_keyname pull-left">分享渠道：</div>
                 <div class=" pull-left ">
                   <div class="cim_dun checkboxchoice_box">
                       <div class="checkboxchoice_item clearboth">
                           <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="checkbox" id="checkbox" class="choiceclass">
                           </span>
                           <label class="checkboxchoice_name pull-left" for="checkbox"> 
                              <span class="checkboxchoice_name_t">全部</span></label>
                       </div>
                   </div>
                   <div class="set_sharelist">
                     <ul class="checkboxchoice_box clearboth">
                      <!----- item  ------->
                       <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_1" id="share_1" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_1"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>QQ空间
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                             <input type="checkbox" name="share_2" id="share_2" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_2"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>新浪微博
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                             <input type="checkbox" name="share_3" id="share_3" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_3"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>腾讯微博
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_4" id="share_4" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_4"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>微信
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_5" id="share_5" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_5"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>网易微博
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_6" id="share_6" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_6"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>一键通
                              </span>
                           </label>
                         </li>
                        <!----- item  ------->
                       <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_7" id="share_7" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_7"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>手机快传
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                             <input type="checkbox" name="share_8" id="share_8" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_8"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>搜狐微博
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                             <input type="checkbox" name="share_9" id="share_9" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_9"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>新华微博
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_10" id="share_10" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_10"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>天涯
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_11" id="share_11" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_11"> 
                              <span class="checkboxchoice_name_t">
                                <i class="shareimg shareimg_1 "></i>凤凰微博
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_12" id="share_12" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_12"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>朋友圈
                              </span>
                           </label>
                         </li>
                         
                         <!----- item  ------->
                       <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_13" id="share_13" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_13"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>豆瓣
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                             <input type="checkbox" name="share_14" id="share_14" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_14"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>QQ好友
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                             <input type="checkbox" name="share_15" id="share_15" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_15"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>人民微博
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_16" id="share_16" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_16"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>百度空间
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_17" id="share_17" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_17"> 
                              <span class="checkboxchoice_name_t">
                                <i class="shareimg shareimg_1 "></i>有道笔记
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_18" id="share_18" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_18"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>豆瓣
                              </span>
                           </label>
                         </li>
                         
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_19" id="share_19" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_19"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>朋友圈
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_20" id="share_20" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_20"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>麦库记事
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_21" id="share_21" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_21"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>百度搜藏
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_22" id="share_22" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_22"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>Gmail邮箱
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_23" id="share_23" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_23"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>搜狐微博
                              </span>
                           </label>
                         </li>
                         <!----- item  ------->
                         <li class="checkboxchoice_item">
                             <span class="checkboxchoice_co pull-left">
                              <input type="checkbox" name="share_24" id="share_24" class="choiceclass">
                            </span>
                           <label class="checkboxchoice_name pull-left" for="share_24"> 
                              <span class="checkboxchoice_name_t">
                                 <i class="shareimg shareimg_1 "></i>朋友圈
                              </span>
                           </label>
                         </li>
                         
                     </ul>
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
      </div>
   </div>
   </div>
</div>
<script>
$("#bgcolor").cxColor();
</script>
</body>

</html>

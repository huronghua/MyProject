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
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>图片模块-背景模块</title>
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


<!------------------------  图文 模块  -------------------------->
<div class="popup popupbg distable" >
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
         <div class="popup_main">
            <!---------------form item  ---------------------->
             <div class="set_item  popupmain_setitem clearboth">
                 <div class="item_keyname pull-left">图文排列：</div>
                 <div class=" pull-left set_miustyle set_inagestext ">
                    <ul class="clearboth">
                       <li class="pull-left  form-marginrigt set_inagestext_a artive "></li>
                       <li class="pull-left  form-marginrigt set_inagestext_b "></li>
                       <li class="pull-left  form-marginrigt set_inagestext_c "></li>
                       <li class="pull-left  form-marginrigt set_inagestext_d "></li>
                       
                    </ul>
                 </div>
            </div>  
            <!---------------form-item  end  ---------------------->
            <!---------------form item  ---------------------->
             <div class="set_item clearboth">
                 <div class="item_keyname pull-left">图片尺寸：</div>
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
                  <div class="pull-left cim_dun checkboxchoice_box">
                   <div class="checkboxchoice_item clearboth">
                       <span class="checkboxchoice_co pull-left">
                          <input type="checkbox" name="checkbox2" id="checkbox2" class="choiceclass">
                       </span>
                       <label class="checkboxchoice_name pull-left" for="checkbox2"> 
                          <span class="checkboxchoice_name_t">默认</span></label>
                   </div>
               </div>
            </div>  
            <!---------------form-item  end  ---------------------->
            <!---------------form item  ---------------------->
             <div class="set_item set_backgroundimages_item clearboth">
                 <div class="item_keyname pull-left">图片文件：</div>
                 <div class="pull-left set_imagestextupload_c form-marginrigt"></div>
                 <div class="pull-left  checkboxchoice_box " >
                   <div class=" clearboth set_backgroundimages_upload backgcarousel_upload">
                     <div class="pull-left form-marginrigt   set_backgroundimages_upload_btn">
                        <span class="icon-uniE92D"></span>
                        <label for="fileField"></label>
                        <input type="file" name="fileField" id="fileField" class="choiceclass backgroundfileclass">
                     </div>
                     <div class=" pull-left set_backgroundimages_upload_prompt">
                      <p>文件大小：支持上传3M内的图片</p>
                      <p>文件格式：支持 .jpg .jpeg .gif .png .bmp图片格式</p>
                   </div>
                   </div>
               </div>
            </div>  
            <!---------------form-item  end  ---------------------->
            
           <!---------------form item  ---------------------->
             <div class="set_item set_backgroundimages_item clearboth">
                 <div class="item_keyname pull-left">模块内容：</div>
                 <div class="pull-left  " >
                   <textarea name="" cols="" rows="8" class="form-w_8"></textarea>
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
<script>
$("#bgcolor").cxColor();
</script>
</body>

</html>

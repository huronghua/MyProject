<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>交互模块-按钮模块</title>
 <!-- Bootstr ap -->

<link href="../../static/css/fontsico.css" rel="stylesheet">
<link rel="stylesheet" href="../../static/css/jquery.cxcolor.css">
<link rel="stylesheet" href="../../static/css/global.css">
<link href="../../static/css/layout.css" rel="stylesheet">
<script type="text/javascript" src="../../static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="../../static/js/style.js"></script>
<script src="../../static/js/jquery.cxcolor.min.js"></script>
<script src="../../static/js/jquery.easydropdown.js"></script>
<link rel="stylesheet" href="../../static/css/easydropdown.css"/>
<link rel="stylesheet" href="../../static/css/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui/themes/icon.css">
<script type="text/javascript" src="../../static/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../static/jquery-easyui/jquery.easyui.mobile.js"></script>
<script type="text/javascript" src="../../static/js/jquery.tips.js"></script>
<script type="text/javascript">

$(document).ready(function () {

	var bgstyle = '';
	$(".bg_red").click(function(){
		bgstyle = ";background:" + $(".bg_red").css("background-color");
	});
	
	$(".bg_blue").click(function(){
		bgstyle = ";background:" + $(".bg_blue").css("background-color");
	});
	
	$(".bg_black").click(function(){
		bgstyle = ";background:" + $(".bg_black").css("background-color");
	});
	
	$(".bg_orange").click(function(){
		bgstyle = ";background:" + $(".bg_orange").css("background-color");
	});
	
	$(".bg_violet").click(function(){
		bgstyle = ";background:" + $(".bg_violet").css("background-color");
	});
	
	$(".bg_gray").click(function(){
		bgstyle = ";background:" + $(".bg_gray").css("background-color");
	});
	
	$(".bg_darkred").click(function(){
		bgstyle = ";background:" + $(".bg_darkred").css("background-color");
	});
	
	$(".bg_green").click(function(){
		bgstyle = ";background:" + $(".bg_green").css("background-color");
	});
	
	$("#btnsubmit").hide();
	$("#btnpreview").show();

	$("#btnpreview").click(function(){
		if ($("#form1").form('validate'))
		{
			var url = '';
			var btnstyle = '';
			if ($("#texturl").val()!='')
			{
				if ($('#dropopentype').combobox('getValue')=='0')
					{
					
				   url = "onclick=javascript:window.location.href='" + $("#texturl").val() + "'";
				   }
				else
				{
				   url = "onclick=javascript:window.open('" + $("#texturl").val() + "')";
				}
			}
			
			if (bgstyle != '')
                btnstyle = " style='height:" + $("#textwidth").val() + "px" + " ;width:" + $("#textheight").val() + "px" + " " + bgstyle + ";'";
			else
				btnstyle = " style='height:" + $("#textwidth").val() + "px" + " ;width:" + $("#textheight").val() + "px" + ";'";

            var btnuse = "<input type='button'" + btnstyle + " id='testBtn'" + url + " value=" + $('#textdisplayfont').val() + ">";
		    var btn=$(btnuse);
	        $("#distablediv").append(btn);
	        //addBtnEvent("testBtn");
	    	$("#btnsubmit").show();
	    	$("#btnpreview").hide();
		}
	});
});

function addBtnEvent(id){
    $("#"+id).bind("click",function(){
        alert("Test");
    });
}
//确定提交


</script>
</head>
<body>


<!------------------------  按钮 模块  -------------------------->
<div class="popup popupbg distable" >
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
         <form id='form1' action="" method="get" enctype="multipart/form-data">
          <!------------------------------------->
          <div class="popup-modularsettings  clearboth">
          
             <!---------------form item  ---------------------->
             <div class="set_item clearboth">
                 <div class="item_keyname pull-left">模块标题：</div>
                 <div class=" pull-left form-marginrigt">
                   <label for="textbtnname"></label>
                   <input class="easyui-textbox" name="textbtnname" id="textbtnname" style="width:300px;height:25px" data-options="required:true">
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
                     <!-- <label for="textwidth"></label> -->
                     <input class="easyui-numberspinner" id="textwidth" style="width:100px;height:25px" data-options="required:true"></input>

                 </div>
                 <div class=" pull-left form-marginrigt">
                   <span class="dropdown-inlineblock" >
                     <select class="easyui-combobox" name="dropwidth" style="width:80px;height:25px" data-options="required:true">
                        <option value="April">像素</option>
                        <option value="5">百分比</option>
                     </select>
<!--                      <select name=""  tabindex="4" class="dropdown rimsn ">
                        <option value="April">像素</option>
                        <option value="5">百分比</option>
                      </select> -->
                    </span>
                  </div>
                  <div class=" pull-left t">
                     <label for="textheight"></label>
<!--                      <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_0"> -->
                     <input class="easyui-numberspinner" id="textheight" style="width:100px;height:25px;" data-options="required:true"></input>
                 </div>
                 <div class=" pull-left form-marginrigt">
                   <span class="dropdown-inlineblock" >
                    <select class="easyui-combobox" name="dropheight" style="width:80px;height:25px" data-options="required:true">
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
                       <li class="template_colorclick artive"></li>
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
                   <input class="easyui-textbox" id="textdisplayfont" style="width:300px;height:25px" data-options="required:true">
                 </div>
            </div>  
            <!---------------form-item  end  ---------------------->
             <!---------------form item  ---------------------->
             <div class="set_item clearboth">
                 <div class="item_keyname pull-left">跳转链接：</div>
                 <div class=" pull-left form-marginrigt">
                   <label for="texturl"></label>
<!--                    <input type="text" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_3"> -->
                   <input class="easyui-textbox" id="texturl" style="width:300px;height:25px" data-options="validType:'url'">
                 </div>
            </div>  
            <!---------------form-item  end  ---------------------->
            <!---------------form item  ---------------------->
             <div class="set_item clearboth">
                 <div class="item_keyname pull-left">打开方式：</div>
                 <div class=" pull-left form-marginrigt">
                   <span class="dropdown-inlineblock form-w_2" >
<!--                      <select name=""  tabindex="4" class="dropdown rimsn ">
                        <option value="April">当前页面打开</option>
                        <option value="5">新窗口打开</option>
                      </select> -->
                      <select class="easyui-combobox" id="dropopentype" name="dropopentype" style="width:150px;height:25px" data-options="required:true">
                        <option value="0">当前页面打开</option>
                        <option value="1">新窗口打开</option>
                     </select>
                    </span>
                   
                 </div>
            </div>  
            <!---------------form-item  end  ---------------------->
          </div>
         <div class="form-botton">
              <input type="button" name="btnpreview" id="btnpreview" value="预览" class="btn btn_a">
              <input type="button" name="btnsubmit" id="btnsubmit" value="确定提交" class="btn btn_a">
              <input type="reset" name="button" id="button" value="重置" class="btn btn_b">
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
<!-- <script>
$("#bgcolor").cxColor();
</script> -->
</body>

</html>

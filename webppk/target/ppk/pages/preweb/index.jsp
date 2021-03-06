<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>首页</title>
 <!-- Bootstrap -->
<link href="../ppk/static/preweb/css/main.css" rel="stylesheet">
<link rel="stylesheet" href="../ppk/static/preweb/css/global.css">
<link href="../ppk/static/preweb/css/layout.css" rel="stylesheet">
<link href="../ppk/static/preweb/css/fontsico.css" rel="stylesheet">
<script type="text/javascript" src="../ppk/static/preweb/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="../ppk/static/preweb/js/style.js"></script>
<script src="../ppk/static/preweb/js/jquery.easydropdown.js"></script>
<link rel="stylesheet" href="../ppk/static/preweb/css/easydropdown.css"/>
<script type="text/javascript" src="../ppk/static/preweb/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../ppk/static/preweb/js/jquery.range.js"></script>
<script type="text/javascript" src="../ppk/static/preweb/js/jquery.cxcolor.min.js"></script>
<link href="../ppk/static/preweb/css/jquery.range.css" rel="stylesheet">
<link rel="stylesheet" href="../ppk/static/preweb/css/jquery.cxcolor.css">

<script>
    $(function(){
       $("#auxiliary-btn").toggle(
         function(){
            $(".main-content").addClass("grid");
         },
         function(){
            $(".main-content").removeClass("grid");
         }
       );
      
      $("#fullScreen-btn").toggle(
         function(){
           fullScreen();
          },function(){
           exitFullScreen();
          }
      );
      
      $("#page-setup-btn").click(function(){$("#page-setup").show();});
      $("#seo-btn").click(function(){$("#seo-setup").show();});
      $("#attribute-btn").click(function(){$("#attribute-setup").show();});
      
    });
    
    
    
    
    
    
    //全屏模式
    function fullScreen() {
        var el = document.documentElement,
        rfs = el.requestFullScreen || el.webkitRequestFullScreen || el.mozRequestFullScreen || el.msRequestFullScreen,
        wscript;
        
        if(typeof rfs != "undefined" && rfs) {
            rfs.call(el);
            return;
        }
        
        if(typeof window.ActiveXObject != "undefined") {
            wscript = new ActiveXObject("WScript.Shell");
            if(wscript) {
                wscript.SendKeys("{F11}");
            }
        }
    }
//退出全屏
function exitFullScreen() {
    var el = document,
    cfs = el.cancelFullScreen || el.webkitCancelFullScreen || el.mozCancelFullScreen || el.exitFullScreen,
    wscript;
    
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
</script>


</head>
<body>
<header>
  <div class="topwrap clearboth">
     <div class="toplogo pull-left"><img src="../ppk/static/preweb/images/logo.png" ></div>
     <div class=" pull-right topnav-btn">
        <p><a href="#" id="fullScreen-btn" class=" btn">全屏</a>
          <a href="" class=" btn">帮助</a>
          <a href="" class=" btn">消息</a>
          <a href="" class=" btn">联系客服</a>
         <span>欢迎您！: admin</span>
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
                     <i class=" pull-left icon icon-iconfont-c-templatecon"></i>
                     <span class="pull-left" onClick="window.location.href='tep.html'">模板</span> 
                  </div>
               </li>
               <!--布局 -->
               <li class="functionnav_item">
                  <div class="functionnav_intmmeun clearboth">
                     <i class=" pull-left icon icon-iconfont-moban"></i>
                     <span class="pull-left">布局</span>
                  </div>
                  <!--选择模块-->
                  <div class="functionnav_item_main">
                      <div class="functionnav_item_title">布局模块</div>
                      <div class="functionnav_item_text">点击布局，为您的网站增加一行内容模块</div>
                      <div class="assembly_layout_group">
                         <ul class="clearboth">
                            <li class="pull-left" ></li>
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
                               <Li class="pull-left">
                                  网站<br />
                                  顶部
                               </Li>
                               <Li class="pull-left">
                                  头部<br />
                                  区域
                               </Li>
                               <Li class="pull-left">
                                  LOGO
                               </Li>
                               <Li class="pull-left">
                                  网站<br />
                                  底部
                               </Li>
                            </ul>
                       </div>
                    </div>
                 </div>
                  <!--选择模块 end  -->
               </li>
               <!--图片 -->
               <li class="functionnav_item">
                  <div class="functionnav_intmmeun clearboth">
                     <i class=" pull-left icon icon-iconfont-tupian"></i>
                     <span class="pull-left">图片</span>
                  </div>
                  <!--选择模块-->
                  <div class="functionnav_item_main">
                      <div class="functionnav_item_title">图片模块</div>
                      <div class="functionnav_item_text">点击为您的网站增加一行内容模块</div>
                      <div class="currency_group currency_picture">
                         <ul class="clearboth">
                             <Li class="pull-left" id='picture-inagestext-btn' onClick="window.location.href='picture_inagestext.html'">
                                <div></div>
                                <p>图文模块11111</p>
                             </Li>
                             <Li class="pull-left" onClick="window.location.href='picture_carousel.html'">
                                <div></div>
                                <p>轮播图模块</p>
                             </Li>
                             <Li class="pull-left" onClick="window.location.href='picture_single.html'">
                                <div></div>
                                <p>单图模块</p>
                             </Li>
                             <Li class="pull-left" onClick="window.location.href='picture_atlas.html'">
                                <div></div>
                                <p>图册模块</p>
                             </Li>
                             <Li class="pull-left" onClick="window.location.href='picture_background.html'">
                                <div></div>
                                <p>背景模块</p>
                             </Li>
                             <Li class="pull-left" onClick="window.location.href='picture_layer.html'">
                                <div></div>
                                <p>浮层图片</p>
                             </Li>
                         </ul>
                      </div>
                  </div>
                  <!--选择模块 end -->
               </li>
               <!--文章 -->
               <li class="functionnav_item">
                  <div class="functionnav_intmmeun clearboth">
                     <i class=" pull-left icon icon-iconfont-wenzhang"></i>
                     <span class="pull-left">文章</span>
                  </div>
                  <!--选择模块-->
                  <div class="functionnav_item_main">
                      <div class="functionnav_item_title">文章模块</div>
                      <div class="functionnav_item_text">点击为您的网站增加一行内容模块</div>
                      <div class="currency_group currency_article ">
                         <ul class="clearboth">
                             <Li class="pull-left" onClick="window.location.href='article_inagestext.html'">
                                <div></div>
                                <p>图文模块22222</p>
                             </Li>
                             <Li class="pull-left" onClick="window.location.href='article_text.html'">
                                <div></div>
                                <p>纯文模块</p>
                             </Li>
                             <Li class="pull-left" onClick="window.location.href='article_articlelist.html'">
                                <div></div>
                                <p>文章列表</p>
                             </Li>
                             <Li class="pull-left" onClick="window.location.href='article_table.html'">
                                <div></div>
                                <p>表格模块</p>
                             </Li>
                             <Li class="pull-left" onClick="window.location.href='article_notice.html'">
                                <div></div>
                                <p>公告栏</p>
                             </Li>
                             <Li class="pull-left" onClick="window.location.href='article_layer.html'">
                                <div></div>
                                <p>浮层文字</p>
                             </Li>
                         </ul>
                      </div>
                  </div>
                  <!--选择模块-->
               </li>
               <!--交互 -->
               <li class="functionnav_item">
                  <div class="functionnav_intmmeun clearboth">
                     <i class=" pull-left icon icon-iconfont-iconfontwanyouxi"></i>
                     <span class="pull-left">交互</span>
                  </div>
                   <!--选择模块-->
                  <div class="functionnav_item_main">
                      <div class="functionnav_item_title">交互模块</div>
                      <div class="functionnav_item_text">点击为您的网站增加一行内容模块</div>
                      <div class="currency_group currency_interactive">
                         <ul class="clearboth">
                             <Li class="pull-left"  onClick="window.location.href='interactive_button.html'">
                                <div></div>
                                <p>按钮模块</p>
                             </Li>
                             <Li class="pull-left"  onClick="window.location.href='interactive_member.html'">
                                <div></div>
                                <p>会员登录</p>
                             </Li>
                             <Li class="pull-left"  onClick="window.location.href='interactive_search.html'">
                                <div></div>
                                <p>搜索模块</p>
                             </Li>
                             <Li class="pull-left"  onClick="window.location.href='interactive_code.html'">
                                <div></div>
                                <p>二维码</p>
                             </Li>
                             <Li class="pull-left"  onClick="window.location.href='interactive_share.html'">
                                <div></div>
                                <p>分享网站</p>
                             </Li>
                             <Li class="pull-left"  onClick="window.location.href='interactive_message.html'">
                                <div></div>
                                <p>提交留言</p>
                             </Li>
                         </ul>
                      </div>
                  </div>
                  <!--选择模块-->
               </li>
               <!--高级 -->
               <li class="functionnav_item">
                  <div class="functionnav_intmmeun clearboth">
                     <i class=" pull-left icon icon-iconfont-img-type"></i>
                     <span class="pull-left">高级</span>
                  </div>
                  <!--选择模块-->
                  <div class="functionnav_item_main">
                      <div class="functionnav_item_title">高级模块</div>
                      <div class="functionnav_item_text">点击为您的网站增加一行内容模块</div>
                      <div class="currency_group currency_senior">
                         <ul class="clearboth">
                             <Li class="pull-left"   onClick="window.location.href='senior_column.html'">
                                <div></div>
                                <p>导航菜单</p>
                             </Li>
                             <Li class="pull-left"   onClick="window.location.href='senior_flash.html'">
                                <div></div>
                                <p>Flash</p>
                             </Li>
                             <Li class="pull-left"   onClick="window.location.href='senior_video.html'">
                                <div></div>
                                <p>视频</p>
                             </Li>
                             <Li class="pull-left"   onClick="window.location.href='senior_map.html'">
                                <div></div>
                                <p>在线地图</p>
                             </Li>
                             <Li class="pull-left"   onClick="window.location.href='senior_link.html'">
                                <div></div>
                                <p>友情链接</p>
                             </Li>
                             <Li class="pull-left"   onClick="window.location.href='senior_html.html'">
                                <div></div>
                                <p>HTML代码</p>
                             </Li>
                         </ul>
                      </div>
                  </div>
                  <!--选择模块-->
               </li>
            </ul>
        </div>
     </div>
     <!--左侧功能菜单 end-->
     <div class="pull-left functionnav_main_left">
        <div class=" pull-left switchpage_nav">
           <span class="dropdown-inlineblock dropdown—h form-w_1_5" >
                     <select name=""  tabindex="4" class="dropdown dropdown—h switchpage_navtiem " style="">
                        <option value="April">首页</option>
                        <option value="5">关于我们</option>
           </select>
          </span>
        </div>
        <a href="#" id="page-setup-btn" class=" pull-left btn btn-default" >编辑</a>
        <a href="#" id="seo-btn" class=" pull-left btn btn-default">SEO</a>
        <a href="#" id="attribute-btn" class=" pull-left btn btn-default">属性</a>
     </div>
     <div class=" pull-right functionnav_main_right">
        <a href="#" class="pull-left btn"><i class="icon-align-vertical-middle"></i>自动对齐</a>
        <a href="#" class="pull-left btn" id="auxiliary-btn"><i class="icon-iconfont-shuxuebiaochi"></i>辅助标尺</a>
        <a href="" class="pull-left btn"><i class="icon-iconfont-qianjin"></i>前进</a>
        <a href="" class="pull-left btn"><I class="icon-iconfont-houtui"></I>后退</a>
        <a href="" class="pull-left btn"><i class="icon-iconfont-pc"></i>PC</a>
        <a href="" class="pull-left btn"><i class="icon-shoujii"></i>移动</a>
        <a href="" class="pull-left btn btn-test preview"><b>预览</b></a>
        <a href="" class="pull-left btn btn-primary keep"><b>保存</b></a>
     </div>
  </div>
</header>
<main>
    <div class="main-content">
    
    
    
    </div>
    
    <!------------------------  编辑设置  -------------------------->
    <div id="page-setup" class="popup popupbg distable" style="display:none;" >
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
                                    <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_5">
                                        </div>
                            </div>
                            <!---------------form-item  end  ---------------------->
                            <!---------------form item  ---------------------->
                            <div class="set_item clearboth">
                                <div class="item_keyname pull-left">备 案 号：</div>
                                <div class=" pull-left ">
                                    <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_5 form-marginrigt">
                                        </div>
                            </div>
                            <!---------------form-item  end  ---------------------->
                            <!---------------form item  ---------------------->
                            <div class="set_item  set_item_e clearboth">
                                <div class="item_keyname pull-left">页面生成：</div>
                                <div class=" pull-left set_picture_background_style radiochoice_box setgeneratecodr">
                                    <div class="pull-left radiochoice_item on setgeneratecodr_item">
                                        <span class="radiochoice_co">
                                            <input type="radio" name="templatetab1" id="templatetab1" class="form_choice choiceclass" />
                                        </span>
                                        <label for="templatetab1">生成动态</label>
                                    </div>
                                    <div class="pull-left radiochoice_item setgeneratecodr_item">
                                        <span class="radiochoice_co">
                                            <input type="radio" name="templatetab2" id="templatetab2" class="form_choice choiceclass" />
                                        </span>
                                        <label for="templatetab2">生成静态 </label>
                                    </div>
                                    <div class="pull-left radiochoice_item setgeneratecodr_item">
                                        <span class="radiochoice_co">
                                            <input type="radio" name="templatetab2" id="templatetab2" class="form_choice choiceclass" />
                                        </span>
                                        <label for="templatetab2">伪静态 </label>
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
    
    
    <!------------------------  SEO设置  -------------------------->
    <div id="seo-setup" class="popup popupbg distable " style="display:none;" >
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
                                    <span class="dropdown-inlineblock form-w_4" >
                                        <select name=""  tabindex="4" class="dropdown rimsn ">
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
                                    <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_5">
                                        </div>
                            </div>
                            <!---------------form-item  end  ---------------------->
                            <!---------------form item  ---------------------->
                            <div class="set_item clearboth">
                                <div class="item_keyname pull-left">关  键 词：</div>
                                <div class=" pull-left ">
                                    <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_5 form-marginrigt"> 以“，”分隔每组关键字
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
                            <input type="submit" name="button" id="button" value="确定提交" class="btn btn_a">
                                <input type="reset" name="button" id="button" value="重置" class="btn btn_b">
                                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    
    <!------------------------  属性设置  -------------------------->
    <div id="attribute-setup" class="popup popupbg distable" style="display:none;" >
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
                                    <span class="dropdown-inlineblock form-w_4" >
                                        <select name=""  tabindex="4" class="dropdown rimsn ">
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
                                    <input type="number" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_5">
                                        </div>
                            </div>
                            <!---------------form-item  end  ---------------------->
                            <!---------------form item  ---------------------->
                            <div class="set_item clearboth">
                                <div class="item_keyname pull-left">父级页面：</div>
                                <div class=" pull-left form-marginrigt">
                                    <span class="dropdown-inlineblock form-w_4" >
                                        <select name=""  tabindex="4" class="dropdown rimsn ">
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
                                    <span class="dropdown-inlineblock form-w_4 form-marginrigt" >
                                        <select name=""  tabindex="4" class="dropdown rimsn ">
                                            <option value="April">首页</option>
                                        </select>
                                    </span>
                                    <a href="" class="red">删除</a>
                                </div>
                            </div>  
                            <!---------------form-item  end  ---------------------->
                            <!---------------form item  ---------------------->
                            <div class="set_item asinaddon">
                                <a href="" class="setadd_btn "><i class="icon-uniE92D"></i>添加</a>
                            </div>
                            
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
    
    
</main>






</body>

</html>

$(document).ready(function(){
	//公告栏点击事件
    $("#imagearticlelayermodule").click(function(){
        $("#articlelayermodulepop").show();
      });
	
    //公告栏提交事件
    $("#btnarticlelayersubmit").click(function(){
	    if (tagi == 0 || tagi==null) {
		    tagi += 1;
		}
	    
	    var articlelayeruse = '';
	    articlelayeruse += '<div class="easyui-draggable"';
	    articlelayeruse += '<span>'	+ $('#textarticlenoticename').val() + '</span>';
	    articlelayeruse += '<div style=width:' + $('#numberarticlelayerwidth').numberbox('getValue') + 'px';
	    articlelayeruse += ';height='+ $('#numberarticlelayerheight').numberbox('getValue') + 'px;overflow:auto;white-space:normal;word-wrap:break-word>';
	    articlelayeruse += '<a href='+ $('#textarticlelayerurl').val() + '>';
	    articlelayeruse += $('#textareaarticlelayer').val() + '</div>';
	    articlelayeruse += '</a>';
	    articlelayeruse += '</div>';
		$("#box" + tagi).append($(articlelayeruse));
	    
    });
});
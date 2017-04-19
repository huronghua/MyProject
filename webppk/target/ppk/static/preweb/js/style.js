$(document).ready(function(){
  $(".popup .close").click(function(){
    $(this).parents(".popup").fadeOut(1000);
  });
});

$(document).ready(function(){
	var $tab_li = $('.set_coltab li');
	$tab_li.click(function(){
		$(this).addClass('artive').siblings().removeClass('artive');
		var index = $tab_li.index(this);
		$('body .set_coltab_cont').eq(index).show().siblings().hide();
	});	
});


$(document).ready(function(){
	var $tab_li = $('.template_colorlitem li');
	$tab_li.click(function(){
		$(this).addClass('artive').siblings().removeClass('artive');
	});	
});
$(document).ready(function(){
	var $tab_li = $('.template_listgroup_contar ul li');
	$tab_li.click(function(){
		$(this).addClass('artive').siblings().removeClass('artive');
	});	
});

/*radio  美化*/
$(document).ready(function(){
	var $radio_tb = $('.radiochoice_box .radiochoice_item');
	$radio_tb.click(function(){
		$(this).addClass('on').siblings().removeClass('on');
	});	
});
/*checkbox  美化*/
$(document).ready(function(){
	var $checkboxchoice = $('.checkboxchoice_box .checkboxchoice_item ');
	$checkboxchoice.click(function(){
		$(this).hasClass("on_check")? $(this).removeClass("on_check"):$(this).addClass("on_check");

	});	
});
$(document).ready(function(){
	var $checkboxchoice = $('.checkboxchoice_box .checkboxchoice_item .checkboxchoice_name ');
	$checkboxchoice.click(function(){
		$(this).parents(".checkboxchoice_item").toggleClass("on_check");

	});	
});

/*背脊上传按钮  美化
$(document).ready(function(){
	$(".set_backgroundimages_upload_btn").on("change","input[type='file']",function(){
    var filePath=$(this).val();
    if(filePath.indexOf("jpg")!=-1 || filePath.indexOf("png")!=-1){
        $(".fileerrorTip").html("").hide();
        var arr=filePath.split('\\');
        var fileName=arr[arr.length-1];
        $(".showFileName").html(fileName);
    }else{
        $(".showFileName").html("");
        $(".fileerrorTip").html("您未上传文件，或者您上传文件类型有误！").show();
        return false 
    }
})
});*/


/*背景图片显示方式 */
$(document).ready(function(){
	var $tien_xm = $('.set_backgroundimages_mode a');
	$tien_xm.click(function(){
		$(this).addClass('artive').siblings().removeClass('artive');
	});	
});

/*背景图片显示方式 */
$(document).ready(function(){
	var $tien_xm = $('.set_miustyle li');
	$tien_xm.click(function(){
		$(this).addClass('artive').siblings().removeClass('artive');
	});	
});


$(document).ready(function(){
	var $generatecodr = $('.setgeneratecodr .setgeneratecodr_item');
	$generatecodr.click(function(){
		$(this).addClass('on').siblings().removeClass('on');
		var index = $generatecodr.index(this);
		$('.generatecodr_bax .generatecodr_coim').eq(index).show().siblings().hide();
	});	
});
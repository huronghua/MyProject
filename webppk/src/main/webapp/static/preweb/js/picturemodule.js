	var ppkGenerator = (function(obj){
		
		//单图地址
		obj.singlePicUrl = "";
		obj.pictureInagestextUrl = "";
		obj.pictureCarouselImags = [];
		
		//单图模块
		obj.createSinglePicture = function(idStr){
			if (obj.singlePicUrl == ""){alert("请选择图片文件！");return false};
			var widthStr = $("#picture-single-mod-width").val() ;
			var heightStr = $("#picture-single-mod-height").val();
			var imgWidthStr = $("#picture-single-width").val();
			var imgHeightStr = $("#picture-single-height").val();
			var imgUrl = $("#picture-single-url").val();
			imgUrl = imgUrl.length == 0?"#":imgUrl;
			var imgTitle =  $("#picture-single-title").val();
			var ifShowTitle = $("#picture-single-show-title").hasClass("on_check");
			var ifDefaultImgSize = $("#picture-single-img-default").hasClass("on_check");
			var htmlTitleStr =  ifShowTitle?"<div> " + imgTitle+ "</div>":"";
			var htmlImgSizeStr = ifDefaultImgSize?"":" style=\"width:" + imgWidthStr +"px;height:" + imgHeightStr + "px;\"";
			$(".main-content").append("<div class=\"cp-container\" id='" + idStr +"' style=\"width:" + widthStr+"px;height:" + heightStr+ "px;\"> " +htmlTitleStr+"<div><a href=\"" + imgUrl +"\"><img "+htmlImgSizeStr+" src='" +  ppkGenerator.singlePicUrl + "'/></a></div></div>");
//			$(".main-content").append("<div class=\"cp-container\" id='" + idStr +"' style=\"width:" + widthStr+"px;height:" + heightStr+ "px;\"> " +htmlTitleStr+"<div><img "+htmlImgSizeStr+" src='" +  ppkGenerator.singlePicUrl + "'/></div></div>");
			$("#"+ idStr).draggabilly();
			setSeled(idStr);
			selComp($("#"+ idStr));
			mainobj.ids.push(idStr);
			obj.singlePicUrl = ""; 
			return true;
		};
		
		//图文模块
		obj.createPictureInagestext = function(idStr){
			var widthStr = $("#picture-inagestext-mod-width").val() ;
			var heightStr = $("#picture-inagestext-mod-height").val();
			var imgWidthStr = $("#picture-inagestext-img-width").val();
			var imgHeightStr = $("#picture-inagestext-img-height").val();
			var imgUrl = this.pictureInagestextUrl;
			var imgTitle =  $("#picture-inagestext-title").val();
			var ifShowTitle = $("#picture-inagestext-show-title").hasClass("on_check");
			var ifDefaultImgSize = $("#picture-inagestext-img-default").hasClass("on_check");
			var inagestext = $("#picture-inagestext-context").val();
			var htmlTitleStr =  ifShowTitle?"<div> " + imgTitle+ "</div>":"";
			var htmlImgSizeStr = ifDefaultImgSize?"":" style=\"width:" + imgWidthStr +"px;height:" + imgHeightStr + "px;\"";
			var htmlStr = "";
			switch($(".inagestext-layout.artive").attr("data-val"))
			{
				case "0":
					htmlStr = "<div id='" + idStr +"' style=\"width:" + widthStr+"px;height:" + heightStr+ "px;\"> " +htmlTitleStr+"<div><img "+htmlImgSizeStr+" src='" + imgUrl + "'/></div><div><p>" + inagestext + "</p></div></div>";
					break;
				case "1":
					htmlStr = "<div id='" + idStr +"' style=\"width:" + widthStr+"px;height:" + heightStr+ "px;\"> " +htmlTitleStr+"<div style=\"float:left;\"><img "+htmlImgSizeStr+" src='" + imgUrl + "'/></div><div ><p>" + inagestext + "</p></div></div>";
					break;
				case "2":
					var pwidth = widthStr - imgWidthStr;
					htmlStr = "<div id='" + idStr +"' style=\"width:" + widthStr+"px;height:" + heightStr+ "px;\"> " +htmlTitleStr+"<div style=\"float:left;width:" + pwidth +"px;\"><p>" + inagestext + "</p></div><div style=\"float:left;\"><img "+htmlImgSizeStr+" src='" + imgUrl + "'/></div></div>";
					break;
				case "3":
					htmlStr = "<div id='" + idStr +"' style=\"width:" + widthStr+"px;height:" + heightStr+ "px;\"> " +htmlTitleStr+"<div><p>" + inagestext + "</p></div><div><img "+htmlImgSizeStr+" src='" + imgUrl + "'/></div></div>";
					break;
			}
			$(".main-content").append(htmlStr);
			$("#"+ idStr).draggabilly();
			setSeled(idStr);
			selComp($("#"+ idStr));
			mainobj.ids.push(idStr);
		};
		
		//轮播图册模块
		obj.createCarouselPicture = function(idStr){
			var widthStr = $("#picture-carousel-mod-width").val() ;
			var heightStr = $("#picture-carousel-mod-height").val();
			var imgWidthStr = $("#picture-carousel-width").val();
			var imgHeightStr = $("#picture-carousel-height").val();
			//var imgUrl = $("#picture-carousel-url").val();
			//临时占位图
			imgUrl = pImg;
			var imgTitle =  $("#picture-carousel-title").val();
			var ifShowTitle = $("#picture-carousel-show-title").hasClass("on_check");
			var ifDefaultImgSize = $("#picture-carousel-img-default").hasClass("on_check");
			var htmlTitleStr =  ifShowTitle?"<div> " + imgTitle+ "</div>":"";
			var htmlImgSizeStr = ifDefaultImgSize?"":" style=\"width:" + imgWidthStr +"px;height:" + imgHeightStr + "px;\"";
			var imgsStr = "";
			if (this.pictureCarouselImags.length>0){
				for(var i=0;i<this.pictureCarouselImags.length;i++){
					imgsStr = imgsStr + "<li style=\"width:100%;height:100%;\"><img style=\"width:100%;height:100%;\" src=\"" + this.pictureCarouselImags[i] +"\"></li>";
				}
			}
			var htmlSliderStr = "<div class=\"slider-banner\" id=\"slider-" + idStr +"\"><ul>"+imgsStr+"</ul></div>";
			$(".main-content").append("<div id='" + idStr +"' style=\"width:" + widthStr+"px;height:" + heightStr+ "px;\"> " +htmlTitleStr+htmlSliderStr +"</div>");
			$(".slider-banner").unslider({
			  autoplay:true,
			  speed: 500,
			  delay: 3000,
			  complete: function() {}, 
			  keys: true,
			  dots: true,
			  fluid: false,
			  arrows:false
			});
			$("#"+ idStr).draggabilly();
			setSeled(idStr);
			selComp($("#"+ idStr));
			mainobj.ids.push(idStr);
		};
		return obj;
	})(ppkGenerator||{});
	
    $(function(){
    	// 百度地图API功能
    	var map = new BMap.Map("map-example");    // 创建Map实例
    	map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  // 初始化地图,设置中心点坐标和地图级别
    	map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
    	map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
    	map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    	
       //辅助标线
       $("#auxiliary-btn").toggle(
         function(){
            $(".main-content").addClass("grid");
         },
         function(){
            $(".main-content").removeClass("grid");
         }
       );
      
      //全屏切换
      $("#fullScreen-btn").toggle(
         function(){
           fullScreen();
          },function(){
           exitFullScreen();
          }
      );
      
      //按钮点击
      $("#page-setup-btn").click(function(){$("#page-setup").show();});
      $("#seo-btn").click(function(){$("#seo-setup").show();});
      $("#attribute-btn").click(function(){$("#attribute-setup").show();});
	  $("#picture-single-btn").click(function(){$("#picture-single-mod").show();});
	  $("#picture-inagestext-btn").click(function(){alert('123');$("#picture-inagestext-mod").show();});
	  $("#picture-carousel-btn").click(function(){$("#picture-carousel-mod").show();});
	  $("#senior-map-btn").click(function(){$("#senior-map-mod").show();})
	  //单图模块 提交按钮
	  $("#picture-single-submit").click(function(){
		   if (ppkGenerator.createSinglePicture(uuid(16,16))){
			   $("#picture-single-reset").click()
			   $("#picture-single-mod").hide();			   
		   }
	  });
	  
	  //图文模块 提交按钮
	  $("#picture-inagestext-submit").click(function(){
			ppkGenerator.createPictureInagestext(uuid(16,16));
			$("#picture-inagestext-reset").click()
		    $("#picture-inagestext-mod").hide();
	  });
	  
	  //轮播图模块 
	  $("#picture-carousel-submit").click(function(){
			ppkGenerator.createCarouselPicture(uuid(16,16));
			$("#picture-carousel-reset").click();
		    $("#picture-carousel-mod").hide();
	  });
	  
	  //预览按钮
	  $("#preview-btn").click(function(){
		 $(".main-content").width();
		 $(".main-content").height();
		 var openWindow=window.open("", "newwin", "height=" +$(".main-content").height()+", width=" +$(".main-content").width()+",toolbar=no ,scrollbars="+scroll+",menubar=no,location=no,status=no"); 
		 openWindow.document.write($(".main-content").html());
	  });
	  
	  //设置图片上传
	  uploadSet($('#fileList'),'#single-pic-upload',ppkGenerator,"singlePicUrl");
	  uploadSet($('#picture-inagestext-fileList'),'#picture-inagestext-upload',ppkGenerator,"pictureInagestextUrl");
	  uploadSetMul($('#picture-carousel-img-table'),'#picture-carousel-upload',ppkGenerator,"pictureCarouselImags");

	  function uploadSet($list,idStr,targetObj,categroyStr){
	      // 优化retina, 在retina下这个值是2
	      var ratio = window.devicePixelRatio || 1,
	      // 缩略图大小
	      thumbnailWidth = 150 * ratio,
	      thumbnailHeight = 150 * ratio;
		  //上传
		  var uploader = WebUploader.create({
			    // 选完文件后，是否自动上传。
			    auto: true,
			    // swf文件路径
			    swf: BASE_URL + 'pages/static/preweb/js/Uploader.swf',
			    // 文件接收服务端。
			    server: BASE_URL + 'preweb/uploadSinglePic',
			    // 选择文件的按钮。可选。
			    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
			    pick: idStr,
			    // 只允许选择图片文件。
			    accept: {
			        title: 'Images',
			        extensions: 'gif,jpg,jpeg,bmp,png',
			        mimeTypes: 'image/*'
			    }
			});
		  
		 	// 当有文件添加进来的时候
		    uploader.on( 'fileQueued', function(file) {
		        var $li = $(
		                '<div id="' + file.id + '" class="file-item thumbnail">' +
		                    '<img>' +
		                '</div>'
		                ),
		            $img = $li.find('img');
		        $list.html( $li );
		        // 创建缩略图
		        uploader.makeThumb( file, function( error, src ) {
		            if ( error ) {
		                $img.replaceWith('<span>不能预览</span>');
		                return;
		            }
		            $img.attr( 'src', src );
		        }, thumbnailWidth, thumbnailHeight );
		    });
		 	
		 	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
		    uploader.on( 'uploadSuccess', function( file,response ) {
		    	targetObj[categroyStr] = response.fileName;
		    });
	  }
    });
    
    function uploadSetMul($list,idStr,targetObj,categroyStr){
	      // 优化retina, 在retina下这个值是2
	      var ratio = window.devicePixelRatio || 1,
	      // 缩略图大小
	      thumbnailWidth = 150 * ratio,
	      thumbnailHeight = 150 * ratio;
		  //上传
		  var uploader = WebUploader.create({
			    // 选完文件后，是否自动上传。
			    auto: true,
			    // swf文件路径
			    swf: BASE_URL + 'pages/static/preweb/js/Uploader.swf',
			    // 文件接收服务端。
			    server: BASE_URL + 'preweb/uploadSinglePic',
			    // 选择文件的按钮。可选。
			    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
			    pick: idStr,
			    // 只允许选择图片文件。
			    accept: {
			        title: 'Images',
			        extensions: 'gif,jpg,jpeg,bmp,png',
			        mimeTypes: 'image/*'
			    }
			});
		  
		 	// 当有文件添加进来的时候
		    uploader.on( 'fileQueued', function(file) {
		        var $li = $(
		        		'<tr>'+
						'	<td>'+
						'       <div class="p-img distable">'+
						'          <div  class="distablediv">'+
						'            <img src="pages/static/preweb/images/ind.jpg">'+
						'          </div>'+
						'      </div>'+
						'    </td>'+
						'    <td align="left">'+
						'       <label for="textfield"></label>'+
						'       <input type="text" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_1_5">'+
						'    </td>'+
						'    <td align="left"><label for="textfield"></label>'+
						'        <input type="text" name="textfield" id="textfield" class="form-control form-contro_style1 form-w_1_5"></td>'+
						'    <td>'+
						'      <span class="dropdown-inlineblock form-w_1_5" >'+
						'         <select name=""  tabindex="4" class="dropdown rimsn ">'+
						'            <option value="April">当前页面打开</option>'+
						'            <option value="5">新窗口打开</option>'+
						'         </select>'+
						'        </span>'+
						'    </td>'+
						'    <td>'+
						'       <div class="eon">'+
						'          <a href="javascript:void(0);" onclick="downImg(this);" class="  icon-xiangxia"></a>'+
						'          <a href="javascript:void(0);" onclick="upImg(this);" class=" icon-iconfont-xiangshang"></a>'+
						'       </div>'+
						'    </td>'+
						'    <td><a href="javascript:void(0);" onclick="delMultImg(this);"  class="btn red">删除</a></td>'+
						'</tr>'
		                ),
		        $img = $li.find('img');
		        $list.append( $li );
		        $dd = $li.find('.dropdown');
		        $dd.easyDropDown();
		        
		        // 创建缩略图
		        uploader.makeThumb( file, function( error, src ) {
		            if ( error ) {
		                $img.replaceWith('<span>不能预览</span>');
		                return;
		            }
		            $img.attr( 'src', src );
		        }, thumbnailWidth, thumbnailHeight );
		    });
		 	
		 	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
		    uploader.on( 'uploadSuccess', function( file,response ) {
		    	targetObj[categroyStr].push(response.fileName);
		    });
	  }
    
    //删除按钮
    function delMultImg(obj){
    	$(obj).parents("tr").remove();
    }
    
    function delComp(obj){
    	 $(obj).parent().parent().remove();
    }
    
    function upImg(a){
    	var father = $(a).parents("tr");
    	if (father && father.prev()){
    		father.prev().insertAfter(father);
    	}
    }
    
    function downImg(a){
    	var father = $(a).parents("tr");
    	if (father && father.next()){
    		father.next().insertBefore(father);
    	}
    }
  

	//点击选中组件
	function setSeled(idStr){
		$("#"+idStr).mousedown(function(){
			if($(".seldObj").attr("id") == this.id && $(this).hasClass("seldObj"))return;
			selComp($(this));
		});
	}
	
	function selComp(obj){
		$(".seldObj").removeClass("seldObj");
		$(".selBox").remove();
		obj.addClass("seldObj");
		$(".seldObj").append("<div id='selBox' class='selBox' ></div>");
		$("#selBox").append("<input class=\"delCompBtn\" onclick=\"delComp(this);\" type='button' value='删除'>");
		var paper = new Raphael("selBox", $("#selBox").width(), $("#selBox").height());
		var rect = paper.rect(0,0,$("#selBox").width(), $("#selBox").height());
		rect.attr({
	            "stroke": "#336699",
	            "stroke-dasharray":"-",
	            "stroke-width": 3
	    });
	}
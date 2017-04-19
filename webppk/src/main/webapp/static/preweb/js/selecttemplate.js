$(document).ready(
		function() {
			/* <!------------------------ 精选模板 模块 --------------------------> */
			// 模板清理
			inittemplate(0);
			$('#selecttemplatepop').hide();

			var templatetype = 0;

			/* getData(1, 12,"","","",templatetype); */
			$('#templateclick').click(
					function() {
						$('#selecttemplatepop').show();

						$("#texttemplatesearch").val('');

						$('#rbtradiotypepc').attr('class',
								'pull-left radiochoice_item on');
						var totalcount = 0;
						var bolpage = false;
						var pageindex = 0;
						var pagesize = 0;
						$.ajax({
							type : "GET",
							url : 'template_count',
							dataType : 'json',
							cache : false,
							error : function(XMLHttpRequest, textStatus,
									errorThrown) {
								alert(XMLHttpRequest.status);
							},
							success : function(data) {
								totalcount = data;
								var page = 1;
								var rows = 12;
								$("#pagecontrol").pagination(
										{
											total : totalcount,
											pageSize : 12,
											pageList : [ 12, 24, 36 ],
											onSelectPage : function(pageNumber,
													pageSize) {
												bolpage = true;
												pageindex = pageNumber;
												pagesize = pageSize;

											}
										});

								getData(0, 12, "", 0, "", templatetype);
							}
						});
					});

			// pc手机模板
			$('#rbtradiotypepc').click(
					function() {
						inittemplate(templatetype);
						getData(0, 12, $("#texttemplatesearch").val(), 0, "",
								templatetype);
					});

			// 移动端
			$('#rbtradiotypemobile').click(
					function() {
						inittemplate(templatetype);
						getData(0, 12, $("#texttemplatesearch").val(), 1, "",
								templatetype);
					});

			// PC+移动端
			$('#rbtradiotypeall').click(
					function() {
						inittemplate(templatetype);
						getData(0, 12, $("#texttemplatesearch").val(), 2, "",
								templatetype);
					});

			// 商城
			$('#usetypeshop').click(function() {
				inittemplate(0);
				templatetype = 0;
				getData(0, 12, $("#texttemplatesearch").val(), 0, "", 0);

			});

			// 门户
			$('#usetypedoor').click(function() {
				inittemplate(1);
				templatetype = 1;
				getData(0, 12, $("#texttemplatesearch").val(), 0, "", 1);
			});

			// 企业
			$('#usetypeenterprise').click(function() {
				inittemplate(2);
				getData(0, 12, $("#texttemplatesearch").val(), 0, "", 2);
			});

			// 个人
			$('#usetypepersonal').click(function() {
				inittemplate(3);
				templatetype = 3;
				getData(0, 12, $("#texttemplatesearch").val(), 0, "", 3);
			});

			// 论坛
			$('#usetypebbs').click(function() {
				inittemplate(4);
				templatetype = 4;
				getData(0, 12, $("#texttemplatesearch").val(), 0, "", 4);

			});

			// 资讯
			$('#usetypeinformation').click(function() {
				inittemplate(5);
				templatetype = 5;
				getData(0, 12, $("#texttemplatesearch").val(), 0, "", 5);
			});

			// 图片点击事件
			$('#template_listgroup_contar img')
					.click(
							function() {
								if ($(this).attr('src') == null)
									return;
								/* alert($(this).parent().parent().children("input").val()); */
								$('#templatename').html(
										$(this).parent().parent().children("p")
												.html());
								$('#template_img0').attr('src',
										$(this).attr('src'));
								gethtmlData($(this).parent().parent().children(
										"input").val());
							});

			$('#template_listgroup_contar1 img')
					.click(
							function() {
								
								if ($(this).attr('src') == null)
									return;
								$('#templatename').html(
										$(this).parent().parent().children("p")
												.html());
								$('#template_img0').attr('src',
										$(this).attr('src'));
								gethtmlData($(this).parent().parent().children(
										"input").val());
							});

			$('#template_listgroup_contar2 img')
					.click(
							function() {
								if ($(this).attr('src') == null)
									return;
								$('#templatename').html(
										$(this).parent().parent().children("p")
												.html());
								$('#template_img0').attr('src',
										$(this).attr('src'));
								gethtmlData($(this).parent().parent().children(
										"input").val());
							});

			$('#template_listgroup_contar3 img')
					.click(
							function() {
								if ($(this).attr('src') == null)
									return;
								$('#templatename').html(
										$(this).parent().parent().children("p")
												.html());
								$('#template_img0').attr('src',
										$(this).attr('src'));
								gethtmlData($(this).parent().parent().children(
										"input").val());
							});

			$('#template_listgroup_contar4 img')
					.click(
							function() {
								if ($(this).attr('src') == null)
									return;
								$('#templatename').html(
										$(this).parent().parent().children("p")
												.html());
								$('#template_img0').attr('src',
										$(this).attr('src'));
								gethtmlData($(this).parent().parent().children(
										"input").val());
							});

			$('#template_listgroup_contar5 img')
					.click(
							function() {
								if ($(this).attr('src') == null)
									return;
								$('#templatename').html(
										$(this).parent().parent().children("p")
												.html());
								$('#template_img0').attr('src',
										$(this).attr('src'));
								gethtmlData($(this).parent().parent().children(
										"input").val());
							});

			// 模板查询
			$('#btntemplatesearch').click(
					function() {
						$('#selecttemplatepop').show();

						// $("#texttemplatesearch").val('');
						inittemplate(templatetype);
						$('#rbtradiotypepc').attr('class',
								'pull-left radiochoice_item on');
						var totalcount = 0;
						var bolpage = false;
						var pageindex = 0;
						var pagesize = 0;
						$.ajax({
							type : "GET",
							url : 'template_count',
							dataType : 'json',
							cache : false,
							error : function(XMLHttpRequest, textStatus,
									errorThrown) {
								alert(XMLHttpRequest.status);
							},
							success : function(data) {
								totalcount = data;
								var page = 1;
								var rows = 12;
								$("#pagecontrol").pagination(
										{
											total : totalcount,
											pageSize : 12,
											pageList : [ 12, 24, 36 ],
											onSelectPage : function(pageNumber,
													pageSize) {
												bolpage = true;
												pageindex = pageNumber;
												pagesize = pageSize;
											}
										});

								getData(0, 12, $("#texttemplatesearch").val(),
										0, "", templatetype);
							}
						});
					});
		});

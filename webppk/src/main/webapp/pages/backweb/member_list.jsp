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
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>角色管理</title>
 <!-- Bootstrap -->
<link rel="stylesheet" href="static/backweb/css/global.css">
<link href="static/backweb/css/layout.css" rel="stylesheet">
<link href="static/backweb/css/fonticon.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="static/jquery-easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="static/jquery-easyui/themes/icon.css">
<script src="static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="static/jquery-easyui/jquery.min.js"></script>
<script type="text/javascript" src="static/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/jquery-easyui/jquery.easyui.mobile.js"></script>
<script type="text/javascript" src="static/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<style>.datagrid-cell{line-height:40px}</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#membertable')
								.datagrid(
										{
											url : 'getmember',
											method : 'POST',
											width : 1430,
											fit : true,
											columns : [ [
													{
														field : 'ck',
														checkbox : true,
														align : 'center',
														id : 'selectall',
														hidden: true
													},
													{field: 'ID', title: '会员', width: 270, align: 'center', hidden: true},
													{
														field : 'LogName',
														title : '登录名',
														width : 270,
														align : 'center',
													},
													{
														field : 'Email',
														title : 'email',
														width : 150,
														align : 'center'
													},
													{
														field : 'Type',
														title : '会员类型',
														width : 150,
														align : 'center',
														formatter:function(value){
															if(value==1)
																return '企业';
																else
																return '个人';
																}
													},
													{
														field : 'LastLoginTime',
														title : '最后登录时间',
														width : 270,
														align : 'center'
													},
													{
														field : 'LastLoginIp',
														title : '最后登录IP',
														width : 250,
														align : 'center'
													},
													{
														field : 'operate',
														title : '操作',
														width : 250,
														align : 'center',
														formatter : function(
																value, row,index) {
															var e = '<a onclick="editmember(' + index + ')" class="blue btn">编辑</a> ';

															var d = '<a style="width:50px; padding:0; margin:0;" onclick="deleteRow('
																	+ index
																	+ ')" class="red btn" >删除</a>';
															return e + d;
														}
													} ] ],
											rownumbers : true,
											showPageList : false,
											pageSize : 10,
											//pageList: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
											fit : true, //使表格自适应
											fitColumns : false, //当使用冻结列：frozenColumms的时候必须设置为false或者不写
											nowrap : false, //表格中的文字可以换行
											border : true,
											idFeild : 'id', //标识
											pagination : true,
											checkOnSelect : false,
											onLoadSuccess : function(data) {
												//遍历grid
												//var rows  = $('#styletable').datagrid("getRows"); 
												var row = $('#membertable')
														.datagrid('getRows');
												var columns = $('#membertable')
														.datagrid("options").columns;
												$('.pagination-page-list')
														.hide();
												//alert(row[5].operate);
											}
										});

						// 查询
						$("#btnsearch").click(function() {
							var membername = $("#membername").val();
							var type = $("#type").val();
							var order = $("#order").val();							
							$('#membertable').datagrid('load',{
								membername: membername,
								type: type,
								order:order
		                	});
		                	$('#membertable').datagrid('reload');
		                });
		                
		            });
						// 全选
						$("#btnCheckAll")
								.click(
										function() {
											if ($("#btnCheckAll")
													.is(':checked')) {
												$("#membertable")
														.parent()
														.find(
																"div .datagrid-header-check")
														.children(
																"input[type='checkbox']")
														.eq(0).attr("checked",
																true);
												$('#tbList').datagrid(
														'checkAll');
												//$('#styletable').datagrid("selectAll");
											} else {
												$('#membertable').datagrid(
														"unselectAll");
											}
										});

						$("#delall").click(
								function() {
									$.ajax({
										type : "POST",
										url : 'member_delall',
										data : {
											'ID' : row[index].ID,
											'USE' : row[index].Status1,
										},
										dataType : 'json',
										cache : false,
										error : function(XMLHttpRequest,
												textStatus, errorThrown) {
											alert(XMLHttpRequest.status);
										},
										success : function(data) {

											if ("success" == data) {
												$('#membertable').datagrid(
														'reload');
											}
										}
									});
								});
	// 编辑数据
	function editmember(index) {
		var row = $('#membertable').datagrid('getRows');
		window.location.href = "pages/backweb/member_edit.jsp?memberid="
				+ row[index].ID;
	}

	// 删除数据
	function deleteRow(index) {
		var row = $('#membertable').datagrid('getRows');
		console.log(row[index]);
		$.ajax({
			type : "POST",
			url : 'member_delete',
			data : {
				'ID' : row[index].ID
			},
			dataType : 'json',
			cache : false,
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(textStatus);
				alert(errorThrown);
			},
			success : function(data) {
				if ("success" == data) {
					$('#membertable').datagrid('reload');
				}
			}
		});
	}
</script>
</head>
<body class="navbady">
   <div class="current">
      <i class="icon-iconfont-shouye"></i>
      <span>管理首页</span>><span>基本设置</span>><span>会员管理</span>
   </div>
   <div class="container_min">
    <div class="listoperation clearboth">
       <div class=" pull-left listoperation_search form-group">
          <form action="" method="get">
           <div class="pull-left form_item_inline">
           <label for="textfield">会员名：</label>
           <input type="text" name="membername" id="membername" class="form-control form-border form-contro_w_b" id="textfield">
           </div>
           <div class="pull-left form_item_inline">
              <label for="textfield">类型：</label>
              <select name="type" id=type class="form-control form-border form-contro_w_b form-controlselect" >
                  <option value="0">全部</option>
                  <option value="1">企业</option>
                  <option value="2">个人</option>
           </select>
           </div>
           <div class="pull-left form_item_inline">
              <label for="textfield">排序：</label>
              <select name="order" id="order" class="form-control form-border form-contro_w_b form-controlselect" >
                 <option value="0">默认</option>
                 <option value="1">时间倒序</option>
           </select>
           </div>
           <div class="pull-left">
             <input type="button" name="btnsearch" id="btnsearch" class="btn btn-primary " value="提交">
           </div>
         </form>
       </div>       
      </div>
        <div class="listtable">
           <table width="100%" border="0" cellspacing="0" cellpadding="0" class="easyui-datagrid" id="membertable" style="width:1430px;height:500px;">
           </table>
        <div class="tacpem">
<!--              <label for="checkbox">
                <input type="checkbox" name="checkbox" id="checkbox">
                 <a href="" class="btn">全选</a>
                 <a href="#" class=" btn">删除</a>
             </label> -->
             
        </div>
    </div>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn">
    <head>
        <base href="<%=basePath%>">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <title>管理员管理</title>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="static/backweb/css/global.css">
        <link href="static/backweb/css/layout.css" rel="stylesheet">
        <link href="static/backweb/css/fonticon.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="static/jquery-easyui/themes/icon.css">
        <script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
        <script type="text/javascript" src="static/jquery-easyui/jquery.min.js"></script>
        <script type="text/javascript" src="static/jquery-easyui/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="static/jquery-easyui/jquery.easyui.mobile.js"></script>
        <script type="text/javascript" src="static/js/jquery.tips.js"></script>
        <link rel="stylesheet" type="text/css" href="static/jquery-easyui/themes/default/easyui.css">
        <script type="text/javascript" src="static/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
        <style>.datagrid-cell{line-height:40px}</style>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#styletable').datagrid({
                    url: 'getuser',
                    method: 'GET',
                    width: 1430,
                    fit: true,
                    columns: [[
                            {field: 'ck', checkbox: true, align: 'center', id: 'selectall',hidden: true },
                            {field: 'UserName', title: '用户名', width: 200, align: 'center'},
                            {field: 'Name', title: '姓名', width: 150, align: 'center'},
                            {field: 'Mobile', title: '手机号码', width: 150, align: 'center'},
                            {field: 'Email', title: '邮箱', width: 250, align: 'center'},
                            {field: 'Status1', title: '用户状态', width: 150, align: 'center'},
                            {field: 'RoleType', title: '角色名称', width: 200, align: 'center',
                            	formatter:function(value){
								if(value==0)
									return '超级管理员';
							    if(value==1)
									return '系统管理员';
							    if(value==2)
									return '内容管理员';
							    if(value==3)
									return '广告管理员';
									}},
                            {
                                field: 'operate',
                                title: '操作',
                                width: 250,
                                align: 'center',
                                formatter: function (value, row, index) {
                                    //var e = '<a href='javascript:editstyle(row);' class="blue btn">编辑</a> ';
                                    var e = '<a class="btn" style="width:50px;  padding:0; margin:0;" onclick="editstyle(' + index + ')" >编辑</a> ';
                                    var f = '';
                                    var use1 = '';
                                    //alert(row.StatusMode1);
                                    if (row.Status1 == '不启用')
                                    {
                                        use1 = '启用';
                                        f = '<a id="use" class="blue btn" style="width:50px;  padding:0; margin:0;"  onclick="editUse(' + index + ')">启用</a>';
                                    } else
                                    {
                                        use1 = '不启用';
                                        f = '<a id="use" class="blue btn" style="width:50px; padding:0; margin:0;" onclick="editUse(' + index + ')">不启用</a>';
                                    }

                                    var d = '<a style="width:50px; padding:0; margin:0;" onclick="deleteRow(' + index + ')" class="red btn" >删除</a>';
                                    return e + f + d;
                                }
                            }
                        ]],
                    rownumbers: true,
                    showPageList: false,
                    pageSize: 10,
                    //pageList: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
                    fit : true, //使表格自适应
                            fitColumns: false, //当使用冻结列：frozenColumms的时候必须设置为false或者不写
                    nowrap: false, //表格中的文字可以换行
                    border: true,
                    idFeild: 'id', //标识
                    pagination: true,
                    checkOnSelect: false,
                    onLoadSuccess: function (data) {
                        //遍历grid
                        var row = $('#styletable').datagrid('getRows');
                        var columns = $('#styletable').datagrid("options").columns;
                        $('.pagination-page-list').hide();
                        //alert(row[5].operate);
                    }
                
                });
                
                // 查询
                $("#btnsearch").click(function () {
                	var username = $("#username").val();
                	$('#styletable').datagrid('load',{
                		username: username,
                	});
                	$('#styletable').datagrid('reload');
                });
                
                // 全选
                $("#btnCheckAll").click(function () {
                    if ($("#btnCheckAll").is(':checked'))
                    {
                    	$("#styletable").parent().find("div .datagrid-header-check").children("input[type='checkbox']").eq(0).attr("checked", true);
                    	$('#tbList').datagrid('checkAll');
                        //$('#styletable').datagrid("selectAll");
                    }
                    else {
                        $('#styletable').datagrid("unselectAll");
                    }
                });
                
                $("#delall").click(function () {
        			$.ajax({
        				type : "POST",
        				url : 'user_delall',
        				data : {
        					'ID' : row[index].ID,
        					'USE' : row[index].Status1,
        				},
        				dataType : 'json',
        				cache : false,
        				error : function(XMLHttpRequest, textStatus, errorThrown) {
        					alert(XMLHttpRequest.status);
        				},
        				success : function(data) {

        					if ("success" == data) {
        						$('#styletable').datagrid('reload');  
        					}
        				}
        			});
                });
                
            });

            // 启用状态编辑
            function editUse(index) {
                var row = $('#styletable').datagrid('getRows');
                console.log(row[index]);
    			$.ajax({
    				type : "POST",
    				url : 'user_use',
    				data : {
    					'ID' : row[index].ID,
    					'USE' : row[index].Status1,
    				},
    				dataType : 'json',
    				cache : false,
    				error : function(XMLHttpRequest, textStatus, errorThrown) {
    					alert(XMLHttpRequest.status);
    				},
    				success : function(data) {
    					if ("success" == data) {
    						$('#styletable').datagrid('reload');  
    					}
    				}
    			});
            }
            
            // 编辑数据
            function editstyle(index){
                var row = $('#styletable').datagrid('getRows');
                window.location.href = "pages/backweb/user_edit.jsp?userid=" + row[index].ID;
            }
            
            // 删除数据
            function deleteRow(index){
                var row = $('#styletable').datagrid('getRows');
    			$.ajax({
    				type : "POST",
    				url : 'user_delete',
    				data : {
    					'id' : row[index].ID
    				},
    				dataType : 'json',
    				cache : false,
    				error : function(XMLHttpRequest, textStatus, errorThrown) {
/*     					alert(XMLHttpRequest.status); */
    					alert(textStatus);
    					alert(errorThrown);
    				},
    				success : function(data) {
     					if ("success" == data) {
    						$('#styletable').datagrid('reload');  
    					}
    				}
    			});
            }
        </script>
    </head>
    <body class="navbady">
        <div class="current">
            <i class="icon-iconfont-shouye"></i>
            <span>管理首页</span>><span>基本设置</span>><span>管理员管理</span>
        </div>
        <div class="container_min">
            <div class="listoperation clearboth">
                <a href="/ppk/pages/backweb/user_edit.jsp" class=" pull-left listoperation_add">
                    <i class="icon-iconfont-add"></i> 添加用户
                </a>
                <div class=" pull-left listoperation_search form-group">
                    <form action="" method="post">
                        <div class="pull-left form_item_inline">
                            <label for="textfield"></label>
                            <input type="text" name="username" class="form-control form-border form-contro_w_e" style="height:auto;" id="username">
                        </div>
                        <div class="pull-left">
                            <input type="button" name="btnsearch" id="btnsearch" class="btn btn-primary " value="查询">
                        </div>
                    </form>
                </div>    
            </div>
            <div class="listtable">
                <table border="0" cellspacing="0" cellpadding="0" class="easyui-datagrid" id="styletable" style="width:1430px;height:500px;">
                    <tr>
                        <th width="3%" scope="row"></th>
                        <th width="17%">用户名</th>
                        <th width="10%">姓名</th>
                        <th width="17%">手机号码</th>
                        <th width="22%">邮箱</th>
                        <th width="14%">用户状态</th>
                        <th width="17%"> 操作</th>
                    </tr>
                </table>
            </div>
<!--             <div class="tacpem">
                <label for="checkbox">
                    <a class="btn" id="delall">删除</a>
                </label>             
            </div> -->
        </div>
    </body>
</html>
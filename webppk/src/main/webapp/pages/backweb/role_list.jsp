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
        <title>权限管理</title>
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

                $('#roletable').datagrid({
                    url: 'get_role',
                    method: 'GET',
                    width: 1430,
                    fit: true,
                    columns: [[
                            {field: 'ck', checkbox: true, align: 'center', id: 'selectall',hidden: true},
                            {field: 'ID', title: '角色', width: 270, align: 'center', hidden: true},
                            {field: 'RoleName', title: '角色名称', width: 270, align: 'center'},
                            {field: 'Status1', title: '状态', width: 150, align: 'center'},
                            {field: 'CreatUser', title: '创建人', width: 150, align: 'center'},
                            {field: 'CreatTime', title: '创建时间', width: 250, align: 'center'},
                            {
                                field: 'operate',
                                title: '操作',
                                width: 250,
                                align: 'center',
                                formatter: function (value, row, index) {
                                    //var e = '<a href='javascript:editstyle(row);' class="blue btn">编辑</a> ';
                                    var e = '<a class="btn" style="width:50px;  padding:0; margin:0;" onclick="editrole(' + index + ')" class="blue btn">编辑</a> ';
                                    var f = '';
                                    var use1 = '';
                                    if (row.Status1 == '不启用')
                                    {
                                        use1 = '启用';
                                        f = '<a class="blue btn" style="width:50px;  padding:0; margin:0;" id="use" onclick="editUse(' + index + ')">启用</a>';
                                    } else
                                    {
                                        use1 = '不启用';
                                        f = '<a class="blue btn" style="width:50px;  padding:0; margin:0;" id="use" onclick="editUse(' + index + ')">不启用</a>';
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
                        //var rows  = $('#styletable').datagrid("getRows"); 
                        var row = $('#styletable').datagrid('getRows');
                        var columns = $('#styletable').datagrid("options").columns;
                        $('.pagination-page-list').hide();
                        alert(row[5].operate);
                    }
                });

                $("#btnsearch").click(function () {
                    var rolename = $("#textrole").val();
                    var creater = $("#textcreater").val();
                    $('#roletable').datagrid('load', {
                        RoleName: rolename,
                        CreatUser: creater
                    });
                    $('#roletable').datagrid('reload');
                });
                
                // 删除
                $("#btnDeleteAll").click(function () {
                    if ($("#btnCheckAll").is(':checked'))
                    {
                        $.ajax({
                            type: "POST",
                            url: 'role_deleteall',
                            dataType: 'json',
                            cache: false,
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                alert(XMLHttpRequest.status);
                            },
                            success: function (data) {
                                if ("success" == data) {
                                    window.location.href = "pages/backweb/role_list.jsp";
                                }
                            }
                        });
                    }
                });
            });

            //启用状态编辑
            function editUse(index) {
                var row = $('#roletable').datagrid('getRows');
                console.log(row[index].Status1);
                $.ajax({
                    type: "POST",
                    url: 'role_use',
                    data: {
                        'ID': row[index].ID,
                        'USE': row[index].Status1,
                    },
                    dataType: 'json',
                    cache: false,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status);
                    },
                    success: function (data) {
                        if ("success" == data) {
                            $('#roletable').datagrid('reload');
                        }
                    }
                });
            }
            // 编辑数据
            function editrole(index) {
                var row = $('#roletable').datagrid('getRows');
                window.location.href = "pages/backweb/role_edit.jsp?roleid=" + row[index].ID;
            }
            // 删除数据
            function deleteRow(index){
            	
                var row = $('#roletable').datagrid('getRows');
    			$.ajax({
    				type : "POST",
    				url : 'role_delete',
    				data : {
    					'ID' : row[index].ID
    				},
    				dataType : 'json',
    				cache : false,
    				error : function(XMLHttpRequest, textStatus, errorThrown) {
    					alert(XMLHttpRequest.status);
    				},
    				success : function(data) {

    					if ("success" == data) {
    						$('#roletable').datagrid('reload');  
    					}
    				}
    			});
            }
        </script>
    </head>
    <body class="navbady">
        <div class="current">
            <i class="icon-iconfont-shouye"></i>
            <span>管理首页</span>><span>基本设置</span>><span>权限管理</span>
        </div>
        <div class="container_min">
            <div class="listoperation clearboth">
                <a href="/ppk/pages/backweb/role_edit.jsp" class=" pull-left listoperation_add">
                    <i class="icon-iconfont-add"></i> 添加角色
                </a>
                <div class=" pull-left listoperation_search form-group">
                    <form action="" method="get">
                        <div class="pull-left form_item_inline">
                            <label for="textfield">角色名：</label>
                            <input type="text" name="textrole" class="form-control form-border form-contro_w_b" id="textrole">
                        </div>
                        <div class="pull-left form_item_inline">
                            <label for="textfield">创建人：</label>
                            <input type="text" name="textcreater" class="form-control form-border form-contro_w_b" id="textcreater">
                        </div>
                        <div class="pull-left">
                            <input type="button" name="btnsearch" id="btnsearch" class="btn btn-primary " value="查询">
                        </div>
                    </form>
                </div>       
            </div>
            <div class="listtable">
                <table border="0" cellspacing="0" cellpadding="0" class="easyui-datagrid" id="roletable" style="width:1430px;height:500px;">
                    <thead>
                        <tr>
                            <th width="3%" field="order">序号</th>
                            <th width="17%" field="order">角色</th>
                            <th width="10%" field="stylename">状态</th>
                            <th width="17%" field="status">人数</th>
                            <th width="22%" field="creatuser">创建人</th>
                            <th width="14%" field="applycontrol">创建时间</th>
                            <th width="17%" field="creattime">操作</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
<!--             <div class="tacpem">
                <label for="checkbox">
                    <a name="btnDeleteAll" id="btnDeleteAll" class="btn">删除</a>
                </label>

            </div> -->
        </div>
    </body>
</html>

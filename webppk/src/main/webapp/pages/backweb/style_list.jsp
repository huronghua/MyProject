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
        <script type="text/javascript">
            $(document).ready(function () {
                $('#styletable').datagrid({
                    url: 'getstyle',
                    method: 'GET',
                    width: 1430,
                    fit: true,
                    columns: [[
                            {field: 'ck', checkbox: true, align: 'center', id: 'selectall',hidden: true},
                            {field: 'ID', title: '样式名1', width: 270, align: 'center',hidden:true},
                            {field: 'StyleName', title: '样式名', width: 270, align: 'center'},
                            {field: 'StatusMode1', title: '状态', width: 150, align: 'center'},
                            {field: 'CreatUser', title: '创建人', width: 150, align: 'center'},
                            {field: 'ApplyControl', title: '适用组件', width: 270, align: 'center'},
                            {field: 'CreatTime', title: '创建时间', width: 250, align: 'center'},
                            {
                                field: 'operate',
                                title: '操作',
                                width: 250,
                                align: 'center',
                                formatter: function (value, row, index) {
                                    //var e = '<a href='javascript:editstyle(row);' class="blue btn">编辑</a> ';
                                    var e = '<a onclick="editstyle(' + index + ')" class="blue btn">编辑</a> ';
                                    var f = '';
                                    var use1 = '';
                                    if (row.StatusMode1 == '不启用')
                                    {
                                        use1 = '启用';
                                        f = '<a id="use" class="blue btn" style="width:50px;  padding:0; margin:0;" onclick="editUse(' + index + ')">启用</a>';
                                    } else
                                    {
                                        use1 = '不启用';
                                        f = '<a id="use" class="blue btn" style="width:50px;  padding:0; margin:0;" onclick="editUse(' + index + ')">不启用</a>';
                                    }

                                    var d = '<a style="width:50px;  padding:0; margin:0;" onclick="deleteRow(' + index + ')" class="red btn" >删除</a>';
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
                        //alert(row[5].operate);
                    }
                }); 

                // 全选
                $("#btnCheckAll").click(function () {
                    if ($("#btnCheckAll").is(':checked'))
                        $('#styletable').datagrid("selectAll");
                    else {
                        $('#styletable').datagrid("unselectAll");
                    }
                });

                // 删除
                $("#btnDeleteAll").click(function () {
                    if ($("#btnCheckAll").is(':checked'))
                    {
                        $.ajax({
                            type: "POST",
                            url: 'style_deleteall',
                            dataType: 'json',
                            cache: false,
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                alert(XMLHttpRequest.status);
                            },
                            success: function (data) {
                                if ("failed" == data) {

                                }

                                if ("success" == data) {
                                    window.location.href = "style_list.jsp";
                                }
                            }
                        });
                    }
                });
                
                // 查询
                $("#btnsearch").click(function () {
                	var stylename = $("#txtstylename").val();
                	var stylemode = $("#selectstatusmode").val();
                	$('#styletable').datagrid('load',{
                		StyleName: stylename,
                		StatusMode1: stylemode
                	});
                	$('#styletable').datagrid('reload');
                });
                
            });

            // 启用状态编辑
            function editUse(index) {
                var row = $('#styletable').datagrid('getRows');
    			$.ajax({
    				type : "POST",
    				url : 'style_use',
    				data : {
    					'ID' : row[index].ID,
    					'USE' : row[index].StatusMode1,
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
                window.location.href = "pages/backweb/style_edit.jsp?styleid=" + row[index].ID;
            }
            
            // 删除数据
            function deleteRow(index){
            	
                var row = $('#styletable').datagrid('getRows');
    			$.ajax({
    				type : "POST",
    				url : 'style_delete',
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
            <span>管理首页</span>><span>基本设置</span>><span>样式管理</span>
        </div>
        <div class="container_min">
            <div class="listoperation clearboth">
                <a href="/ppk/pages/backweb/style_edit.jsp" class=" pull-left listoperation_add">
                    <i class="icon-iconfont-add"></i> 添加样式
                </a>
                <div class=" pull-left listoperation_search form-group">
                    <form action="" method="get">
                        <div class="pull-left form_item_inline">
                            <label id="lblstyle" name="lblstyle" for="txtstylename">样式名称：</label>
                            <input type="text" name="txtstylename" id="txtstylename" class="form-control form-border form-contro_w_b">
                        </div>
                        <div class="pull-left form_item_inline">
                            <label id="lblselect" name="lblselect" for="select">使用样式：</label>
                            <select name="selectstatusmode" id="selectstatusmode" class="form-control form-border form-contro_w_b form-controlselect" >
                                <option value="0">Lobal</option>
                                <option value="1">企业</option>
                                <option value="2">个人</option>
                            </select>
                        </div>
                        <div class="pull-left">
                            <input type="button" name="btnsearch" id="btnsearch" class="btn btn-primary " value="提交">
                        </div>
                    </form>
                </div>       
            </div>
            <div class="listtable">
                <table border="0" cellspacing="0" cellpadding="0" class="easyui-datagrid" id="styletable" style="width:1430px;height:500px;">
                    <thead>
                        <tr>
                            <th width="50" field="order">序号</th>
                            <th width="50" field="stylename">样式名</th>
                            <th width="150" field="status">状态</th>
                            <th width="150" field="creatuser">创建人</th>
                            <th width="150" field="applycontrol">适用组件</th>
                            <th width="150" field="creattime">创建时间</th>
                            <th width="200" field="operate">操作</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
<!--             <div class="listpaging ">
                <ul>
                    <li class="previous">上一页</li>
                    <li class="artive">1</li>
                    <li><a href="">2</a></li>
                    <li><a href="">3</a></li>
                    <li><a href="">4</a></li>
                    <li><a href="">5</a></li>
                    <li><a href="">6</a></li>
                    <li><a href="">7</a></li>
                    <li><a href="">8</a></li>
                    <li><a href="">9</a></li>
                    <li class="next"><a href="">下一页</a></li>
                </ul>
            </div> -->
<!--             <div class="tacpem">
                <label for="checkbox">
                    <input type="checkbox" name="btnCheckAll" id="btnCheckAll">
                    <a href="" class="btn">全选</a>
                    <a href="#" class=" btn" name="btnDeleteAll" id="btnDeleteAll">删除</a>
                </label>

            </div> -->
        </div>
    </body>
</html>

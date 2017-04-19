<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>角色管理</title>
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
<script type="text/javascript">
	$(document).ready(function() {
        $('#dynamictable').datagrid({
            url: 'get_dynamic',
            method: 'GET',
            width: 1430,
            fit: true,
            columns: [[
                    {field: 'ck', checkbox: true, align: 'center', id: 'selectall',hidden: true},
                    {field: 'id', title: '动态效果id', width: 270, align: 'center',hidden:true},
                    {field: 'dynamicname', title: '动态名称', width: 270, align: 'center'},
                    {field: 'dynamictype', title: '类型', width: 150, align: 'center'},
                    {field: 'dynamicdescribe', title: '描述', width: 150, align: 'center'},
                    {field: 'status1', title: '状态', width: 150, align: 'center'},
                    {field: 'creatuser', title: '创建人', width: 150, align: 'center'},
                    {field: 'creattime', title: '创建时间', width: 250, align: 'center'},
                    {
                        field: 'operate',
                        title: '操作',
                        width: 250,
                        align: 'center',
                        formatter: function (value, row, index) {
                            //var e = '<a href='javascript:editstyle(row);' class="blue btn">编辑</a> ';
                            var e = '<a onclick="editdynamic(' + index + ')" class="blue btn">编辑</a> ';
                            var f = '';
                            var use1 = '';
                            if (row.status1 == '不启用')
                            {
                                use1 = '启用';
                                f = '<a id="status" class="blue btn" style="width:50px;  padding:0; margin:0;" onclick="editdynamicstatus(' + index + ')">启用</a>';
                            } else
                            {
                                use1 = '不启用';
                                f = '<a id="status" class="blue btn" style="width:50px;  padding:0; margin:0;" onclick="editdynamicstatus(' + index + ')">不启用</a>';
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
            fitColumns: true, //当使用冻结列：frozenColumms的时候必须设置为false或者不写
            nowrap: true, //表格中的文字可以换行
            border: true,
            idFeild: 'id', //标识
            pagination: true,
            checkOnSelect: false,
            onLoadSuccess: function (data) {
                //遍历grid
                var row = $('#dynamictable').datagrid('getRows');
                var columns = $('#dynamictable').datagrid("options").columns;
                $('.pagination-page-list').hide();
            }
        });
        
        // 查询
        $("#btnsearch").click(function () {
        	var dynamicname = $("#dynamicname").val();
        	var selecttype = $("#selecttype").val();
        	$('#dynamictable').datagrid('load',{
        		dynamicname: dynamicname,
        		selecttype: selecttype
        	});
        	$('#dynamictable').datagrid('reload');
        });
        
        $("#delall").click(function () {
        	/* var rows = $('#dynamictable').datagrid('getRows');
        	for(i=0;rows.length;i++){
        		var row = $('#dynamictable').datagrid('getData').rows[i];
        		alert(row.ck);
        	} */
        	
        	var checkedItems = $('#dynamictable').datagrid('getChecked'); 
        	$.each(checkedItems,  function (index, item){
         		$.ajax({
        			type : "POST",
        			url : 'dynamic_delete',
        			data : {
        				'ID' : item.id
        			},
        			dataType : 'json',
        			cache : false,
        			error : function(XMLHttpRequest, textStatus, errorThrown) {
        				alert(XMLHttpRequest.status);
        			},
        			success : function(data) {
        				if ("success" == data) {
        					$('#dynamictable').datagrid('reload');  
        				}
        			}
        		}); 
            });
        });
	});

    //启用状态编辑
    function editdynamicstatus(index) {
        var row = $('#dynamictable').datagrid('getRows');
        $.ajax({
            type: "POST",
            url: 'dynamic_status',
            data: {
                'ID': row[index].id,
                'Status': row[index].status1,
            },
            dataType: 'json',
            cache: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
            },
            success: function (data) {
                if ("success" == data) {
                    $('#dynamictable').datagrid('reload');
                }
            }
        });
    }
    
    // 编辑动态效果
    function editdynamic(index) {
        var row = $('#dynamictable').datagrid('getRows');
        window.location.href = "pages/backweb/dynamic_details.jsp?id=" + row[index].id;
    }
    
    // 删除数据
    function deleteRow(index){
    	var row = $('#dynamictable').datagrid('getRows');
 		$.ajax({
			type : "POST",
			url : 'dynamic_delete',
			data : {
				'ID' : row[index].id
			},
			dataType : 'json',
			cache : false,
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
			},
			success : function(data) {

				if ("success" == data) {
					$('#dynamictable').datagrid('reload');  
				}
			}
		}); 
    }
    
	//初始化网页
	function initpage() {
		$("#img1").attr('src', "");
		$("#title1").html('');
		$("#spanid1").html('');
		$("#img2").attr('src', "");
		$("#title2").html('');
		$("#spanid2").html('');
		$("#img3").attr('src', "");
		$("#title3").html('');
		$("#spanid3").html('');
		$("#img4").attr('src', "");
		$("#title4").html('');
		$("#spanid4").html('');
		$("#img5").attr('src', "");
		$("#title5").html('');
		$("#spanid5").html('');
		$("#img6").attr('src', "");
		$("#title6").html('');
		$("#spanid6").html('');
		$("#img7").attr('src', "");
		$("#title7").html('');
		$("#spanid7").html('');
		$("#img8").attr('src', "");
		$("#title8").html('');
		$("#spanid8").html('');
		$("#img9").attr('src', "");
		$("#title9").html('');
		$("#spanid9").html('');
	}
</script>
</head>
<body class="navbady">
	<div class="current">
		<i class="icon-iconfont-shouye"></i> <span>管理首页</span>><span>基本设置</span>><span>模板管理</span>
	</div>
	<div class="container_min">
		<div class="listoperation clearboth">
			<a href="/ppk/pages/backweb/dynamic_details.jsp"
				class=" pull-left listoperation_add"> <i
				class="icon-iconfont-add"></i> 上传动态
			</a>
			<div class=" pull-left listoperation_search form-group">
				<form action="" method="get">
					<div class="pull-left form_item_inline">
						<label for="dynamicname">动态名称：</label> <input type="text"
							name="dynamicname" class="form-control form-border form-contro_w_b"
							id="dynamicname">
					</div>
					<div class="pull-left form_item_inline">
						<label for="textfield">类型：</label> <select name="selecttype"
							id="selecttype"
							class="form-control form-border form-contro_w_b form-controlselect">
							<option value="0">载入效果</option>
							<option value="1">悬停效果</option>
						</select>
					</div>
					<div class="pull-left">
						<input type="button" name="btnsearch" id="btnsearch"
							class="btn btn-primary " value="查询">
					</div>
				</form>
			</div>
		</div>
		<div class="listtable">
		    <table class="easyui-datagrid" id="dynamictable" style="width:1430px;height:500px;">
				<tbody>

				</tbody>
			</table>
		</div>
		
<!-- 		<div class="tacpem">
            <label for="checkbox">
                <a class="btn" id="delall">删除</a>
            </label>             
        </div> -->
	</div>
</body>
</html>

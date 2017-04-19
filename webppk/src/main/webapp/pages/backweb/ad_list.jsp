<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
        $('#adtable').datagrid({
            url: 'get_ad',
            method: 'GET',
            width: 1430,
            fit: true,
            columns: [[
                    {field: 'ck', checkbox: true, align: 'center', id: 'selectall'},
                    {field: 'id', title: '', width: 270, align: 'center', hidden: true},
                    {field: 'status', title: '状态', width: 270, align: 'center'},
                    {field: 'classification', title: '分类', width: 150, align: 'center'},
                    {field: 'advertisementName', title: '广告名称', width: 150, align: 'center'},
                    {field: 'creattime', title: '时间', width: 250, align: 'center'},
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
            border: false,
            idFeild: 'id', //标识
            pagination: true,
            checkOnSelect: false,
            onLoadSuccess: function (data) {
                //遍历grid
                var row = $('#adtable').datagrid('getRows');
                var columns = $('#adtable').datagrid("options").columns;
                $('.pagination-page-list').hide();
            }
        });
        
        // 全选
        $("#btnCheckAll").click(function () {
            if ($("#btnCheckAll").is(':checked'))
                $('#adtable').datagrid("selectAll");
            else {
                $('#adtable').datagrid("unselectAll");
            }
        });

        // 删除
        $("#btnDeleteAll").click(function () {
            if ($("#btnCheckAll").is(':checked'))
            {
                $.ajax({
                    type: "POST",
                    url: 'ad_deleteall',
                    dataType: 'json',
                    cache: false,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status);
                    },
                    success: function (data) {
                        if ("failed" == data) {

                        }

                        if ("success" == data) {
                            window.location.href = "ad_list.jsp";
                        }
                    }
                });
            }
        });
        
        // 查询
        $("#btnsearch").click(function () {
        	var adname = $("#adname").val();
        	var adtype = $("#adtype").val();
        	$('#adtable').datagrid('load',{
        		Adname: adname,
        		Adtype: adtype
        	});
        	$('#adtable').datagrid('reload');
        });
    });
    
 // 启用状态编辑
    function editUse(index) {
        var row = $('#adtable').datagrid('getRows');
		$.ajax({
			type : "POST",
			url : 'ad_use',
			data : {
				'ID' : row[index].ID,
				'USE' : row[index].status,
			},
			dataType : 'json',
			cache : false,
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
			},
			success : function(data) {

				if ("success" == data) {
					$('#adtable').datagrid('reload');  
				}
			}
		});
    }
    
    // 编辑数据
    function editstyle(index){
        var row = $('#adtable').datagrid('getRows');
        window.location.href = "pages/backweb/ad_edit.jsp?adid=" + row[index].ID;
    }
    
    // 删除数据
    function deleteRow(index){
    	
        var row = $('#adtable').datagrid('getRows');
		$.ajax({
			type : "POST",
			url : 'ad_delete',
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
					$('#adtable').datagrid('reload');  
				}
			}
		});
    }
</script>
</head>
<body class="navbady">
   <div class="current">
      <i class="icon-iconfont-shouye"></i>
      <span>管理首页</span>><span>基本设置</span>><span>广告管理</span>
   </div>
   <div class="container_min">
    <div class="listoperation clearboth">
       <a href="/ppk/pages/backweb/ad_edit.jsp" class=" pull-left listoperation_add">
          <i class="icon-iconfont-add"></i> 添加广告
       </a>
       <div class=" pull-left listoperation_search form-group">
          <form action="" method="get">
           <div class="pull-left form_item_inline">
           <label for="adname">广告名称：</label>
           <input type="text" name="adname" class="form-control form-border form-contro_w_b" id="adname">
           </div>
           <div class="pull-left form_item_inline">
              <label for="textfield">类型：</label>
              <select name="adtype" id="adtype" class="form-control form-border form-contro_w_b form-controlselect" >
                  <option value="全部">全部</option>
           </select>
           </div>
           <div class="pull-left">
             <input type="submit" name="btnsearch" id="btnsearch" class="btn btn-primary " value="提交">
           </div>
         </form>
       </div>       
      </div>
        <div class="listtable">
           <table width="100%" border="0" cellspacing="0" cellpadding="0" class="easyui-datagrid" id="adtable" style="width:1430px;height:500px;">
              <!---------------------------- item  ------------------------------>
              <tr>
                <td align="center" scope="row">
                    <input type="checkbox" name="checkbox" id="checkbox">
                    <label for="checkbox"></label>
                </td>
                <td align="center">2</td>
                <td align="center">启用</td>
                <td align="center">默认分类</td>
                <td align="center">内容顶部导航大图</td>
                <td align="center">2015/03/28</td>
                <td align="center" colspan="cpemw">
                   <a href="ad_adit.html" class="blue btn">编辑</a>
                   <a href="#" class="btn">禁用</a>
                   <a href="#" class="red btn">删除</a>
               </td>
              </tr>
            </table>
        </div>
        <div class="tacpem">
             <label for="checkbox">
                <input type="checkbox" name="btnCheckAll" id="btnCheckAll">
<!--                 <a href="" class="blue btn">全部</a>
                <a href="" class="btn">启用</a>
                <a href="" class="btn">禁用</a> -->
                <a href="#" class="btn" name="btnDeleteAll" id="btnDeleteAll">删除</a>
             </label>
             
        </div>
    </div>
</body>
</html>

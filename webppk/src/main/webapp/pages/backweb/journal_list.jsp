<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>日志管理</title>
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
    $(document).ready(function () {
        $('#journaltable').datagrid({
            url: 'get_journal',
            method: 'POST',
            width: 1430,
            fit: true,
            columns: [[
                    {field: 'id', title: '', width: 270, align: 'center', hidden: true},
                    {field: 'user', title: '操作者', width: 270, align: 'center'},
                    {field: 'columnname', title: '操作栏目', width: 180, align: 'center'},
                    {field: 'operater', title: '类型', width: 180, align: 'center'},
                    {field: 'ipaddress', title: 'IP地址', width: 180, align: 'center'},
                    {field: 'creattime', title: '创建时间', width: 250, align: 'center'}
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
                var row = $('#journaltable').datagrid('getRows');
                var columns = $('#journaltable').datagrid("options").columns;
                $('.pagination-page-list').hide();
                //alert(row[5].operate);
            }
        });
        
        // 查询
        $("#btnsearch").click(function () {
        	var user = $("#txtoperator").val();
        	var operater = $("#operationtype").val();
        	$('#journaltable').datagrid('load',{
        		user: user,
        		operater: operater
        	});
        	
/*         	$('#journaltable').datagrid('reload'); */
        });
    });
</script>
</head>
<body class="navbady">
   <div class="current">
      <i class="icon-iconfont-shouye"></i>
      <span>管理首页</span>><span>基本设置</span>><span>日志管理</span>
   </div>
   <div class="container_min">
    <div class="listoperation clearboth">
		<div class=" pull-left listoperation_search form-group">
          <form  action="" method="get">
           <div class="pull-left form_item_inline">
           <label for="textfield">操作者：</label>
           <input type="text" name="txtoperator" style="height:30" class="form-control form-border form-contro_w_b" id="txtoperator">
           </div>
           <div class="pull-left form_item_inline">
           <label for="textfield">操作类型：</label>
           <select name="operationtype" id="operationtype" class="form-control form-border form-contro_w_b form-controlselect" >
          			   <option value="全部">全部</option>
                       <option value="添加">添加</option>
                       <option value="编辑">编辑</option>
                       <option value="启用">启用</option>
                       <option value="不启用">不启用</option>
                       <option value="删除">删除</option>
           </select>
           </div>
           <div class="pull-left">
             <input type="button" name="btnsearch" id="btnsearch" class="btn btn-primary " value="查询">
           </div>
         </form>
       </div>       
      </div>
        <div class="listtable">
           <table border="0" cellspacing="0" cellpadding="0" class="easyui-datagrid" id="journaltable" style="width:1430px;height:500px;">
           </table>
        </div>
		<!-- <div class="tacpem">
             <label for="checkbox">
                <input type="checkbox" name="checkbox" id="checkbox">
                <a href="" class="btn">全选</a>
                <a href="" class="btn">删除</a>
             </label>
        </div> -->
  
    </div>
</body>
</html>

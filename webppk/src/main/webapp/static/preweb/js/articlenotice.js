$(document).ready(function(){
	var articlenoticeindex = 0;
    var rarticlenoticerowindex = 0;
    $("#numberarticlenoticewidth").numberbox('setValue', 400);
    $("#numberarticlenoticeheight").numberbox('setValue', 300);
    // 公告栏点击事件
    $("#imagearticlenoticemodule").click(function(){
    	$("#articlenoticemodulepop").css("visibility","visible");
    });
    
    // 添加公告
    $("#linkarticlenotice").click(function(){
    	articlenoticeindex += 1;
    	$('#tablearticlenoticemodule').datagrid('insertRow',{
    	    index: articlenoticeindex,  // 索引从5开始
    	    height:30,
    	    row: {
    	    	item1: ' ',
    	    	item2: ' ',
    	    	item3: ' ',
    	    	item4: ' ',
    	    	item5: '<a href="#" onclick="deleteRow()" class="red btn" >删除</a>'
    	    }
    	});
    });

	// 提交事件
	$('#btnarticlenoticesubmit').click(function() {
		endEditing();
		var rows = $("#tablearticlenoticemodule").datagrid("getRows");
		
	    if (tagi == 0 || tagi==null) {
		  tagi += 1;
		}
	    var articlenoticeuse = '';
	    articlenoticeuse = '<div class="easyui-draggable">';
	    articlenoticeuse += '<span>'	+ $('#textarticlenoticename').val() + '</span>';
	    articlenoticeuse += '<div style=width:' + $('#numberarticlenoticewidth').val() + '';
	    articlenoticeuse += ';height='+ $('#numberimagearticletableheight').val() + '>';
	    articlenoticeuse += '<table>';
	    
	    
	    for(var i=0;i<rows.length;i++)
	    {
	      if (rows[i]['item1']!="" && rows[i]['item1']!=null)
	      {
	    	  articlenoticeuse += '<tr>';
	    	  articlenoticeuse += '<td>';
	    	  alert(rows[i]['item3']);
	          if (rows[i]['item3']=="新窗口打开")
	              articlenoticeuse += '<a href=' + rows[i]['item2'] + '  target="_blank">';
	          else
	              articlenoticeuse += '<a href=' + rows[i]['item2'] + '>';

              articlenoticeuse += rows[i]['item1'];
              articlenoticeuse += '</a>';
              articlenoticeuse += '</td>';
              articlenoticeuse += '</tr>';
	      }
	    }
	    
	    
	    articlenoticeuse += '</table>';
	    articlenoticeuse += '</div>';
	    articlenoticeuse += '</div>';

		$("#box" + tagi).append($(articlenoticeuse));
	});
	
	
	$("#tablearticlenoticemodule").datagrid({
	    total: 2000,
	    fit: true,        // 自动大小
	    fitColumns: true, // 自适应列宽
		columns: [[  
	               { field: 'item1',title: '内容', width: 120,editor:{ type: 'text', options: { required: true },panelHeight:'auto'}},  
	               { field: 'item2',title: '链接', width: 120,editor:{ type: 'text', options: { validType:'url' },panelHeight:'auto'}},  
	               { field: 'item3', title:'打开方式', width: 120,editor:{type:'combobox',options:{data:[{value:'当前页面打开',text:'当前页面打开','selected':'true'},{value:'新窗口打开',text:'新窗口打开'}],panelHeight:'auto'}}
	               }, 
	               { field: 'item4', title:'所属栏目', width: 120,editor:'text'},
	               { field: 'item5', title:'操作', width: 100}
	               ]],
	    singleSelect: true,
	    onClickCell:function (rowIndex, field, value) {
	    	onClickCell(rowIndex,field);
	    },
	});

	articlenoticeindex += 1;
	$('#tablearticlenoticemodule').datagrid('insertRow',{
	    index: 0,  // 索引从0开始
	    height:30,
	    row: {
	    	item1: ' ',
	    	item2: ' ',
	    	item3: ' ',
	    	item4: ' ',
	    	item5: '<a href="#" onclick="deleteRow()" class="red btn" >删除</a>'
	    }
	});
	
	articlenoticeindex += 1;
	$('#tablearticlenoticemodule').datagrid('insertRow',{
	    index: 1,  // 索引从1开始
	    height:30,
	    row: {
	    	item1: ' ',
	    	item2: ' ',
	    	item3: ' ',
	    	item4: ' ',
	    	item5: '<a href="#" onclick="deleteRow()" class="red btn" >删除</a>'
	    }
	});
	
	articlenoticeindex += 1;
	$('#tablearticlenoticemodule').datagrid('insertRow',{
	    index: 2,  // 索引从2开始
	    height:30,
	    row: {
	    	item1: ' ',
	    	item2: ' ',
	    	item3: ' ',
	    	item4: ' ',
	    	item5: '<a href="#" onclick="deleteRow()" class="red btn" >删除</a>'
	    }
	});
	
	articlenoticeindex += 1;
	$('#tablearticlenoticemodule').datagrid('insertRow',{
	    index: 3,  // 索引从3开始
	    height:30,
	    row: {
	    	item1: ' ',
	    	item2: ' ',
	    	item3: ' ',
	    	item4: ' ',
	    	item5: '<a href="#" onclick="deleteRow()" class="red btn" >删除</a>'
	    }
	});
	
	articlenoticeindex += 1;
	$('#tablearticlenoticemodule').datagrid('insertRow',{
	    index: 4,  // 索引从4开始
	    height:30,
	    row: {
	    	item1: ' ',
	    	item2: ' ',
	    	item3: ' ',
	    	item4: ' ',
	    	item5: '<a href="#" onclick="deleteRow()" class="red btn" >删除</a>'
	    }
	});

	$('#tablearticlenoticemodule').datagrid('insertRow',{
	    index: 5,  // 索引从5开始
	    height:30,
	    row: {
	    	item1: ' ',
	    	item2: ' ',
	    	item3: ' ',
	    	item4: ' ',
	    	item5: '<a href="#" onclick="deleteRow()" class="red btn" >删除</a>'
	    }
	});
	
});


$.extend($.fn.datagrid.methods, {
	editCell: function(jq,param){
		return jq.each(function(){
			var opts = $(this).datagrid('options');
			var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
			
			for(var i=0; i<fields.length; i++){
				var col = $(this).datagrid('getColumnOption', fields[i]);
				col.editor1 = col.editor;
				if (fields[i] != param.field){
					col.editor = null;
				}
			}
			
			$(this).datagrid('beginEdit', param.index);
			for(var i=0; i<fields.length; i++){
				var col = $(this).datagrid('getColumnOption', fields[i]);
				col.editor = col.editor1;
			}
		});
	}
});

var editIndex = undefined;
function endEditing(){
	if (editIndex == undefined){return true}
	if ($('#tablearticlenoticemodule').datagrid('validateRow', editIndex)){
		$('#tablearticlenoticemodule').datagrid('endEdit', editIndex);
		editIndex = undefined;
		return true;
	} else {
		return false;
	}
}
function onClickCell(index, field){
	if (endEditing()){
		$('#tablearticlenoticemodule').datagrid('selectRow', index)
				.datagrid('editCell', {index:index,field:field});
		editIndex = index;
	}
}

//删除数据
function deleteRow(){
	
	var row = $('#tablearticlenoticemodule').datagrid('getSelected');
	if (row) {
	         var rowIndex = $('#tablearticlenoticemodule').datagrid('getRowIndex', row);
	         $('#tablearticlenoticemodule').datagrid('deleteRow', rowIndex);  
	 }
}


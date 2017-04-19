// JavaScript Document
//初始化页面中ln-pic-item 的zindex
function zindexInit()
{
  var _l = $(".ln-pic-item").length;
  var i;
  var Zindex = 800;
	  for(i=0;i<_l;i++)
	  {
		  $(".ln-pic-item").eq(i).css('z-index',Zindex);
		  Zindex--;
	  }
	  
	  
  var _tabz = $(".ui-tab-tag li").length;
  var i;
  var Zindex_tab = 90;
	  for(i=0;i<_tabz;i++)
	  {
		  $(".ui-tab-tag li").eq(i).css('z-index',Zindex_tab);
		  Zindex_tab--;
	  }
	  
}

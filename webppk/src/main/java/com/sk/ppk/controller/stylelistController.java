package com.sk.ppk.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sk.ppk.model.Styleinformation;
import com.sk.ppk.service.StyleinformationService;

@Controller
public class stylelistController
{
	@Resource(name="styleinformationService")
	private StyleinformationService styleinformationService;
	
	
	/**样式查詢�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getstyle",method = RequestMethod.GET,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map getstyle(HttpServletRequest request, HttpServletResponse response,Integer page,Integer rows) throws Exception{
		
		response.setContentType("text/javascript");
		response.setCharacterEncoding("utf-8");

		//response.setContentType("application/json;charset=UTF-8");//防止数据传递乱码
		page = Integer.valueOf(request.getParameter("page"));
		String strpageindex = request.getParameter("page");
		String strpagesize = request.getParameter("rows");
		
		int startindex = (page-1)*rows;

		
		String stylename = "";
		if (request.getParameter("StyleName")!=null)
		{
			stylename = String.valueOf(request.getParameter("StyleName"));
		}
		
		int stylemode = 0;
		if (request.getParameter("StatusMode1")!=null)
		{
			if (request.getParameter("StatusMode1")!="0")
			{
			   stylemode = Integer.valueOf(request.getParameter("StatusMode1"));
			}
		}
		
		Map pagemap = new HashMap();
		pagemap.put("page", startindex);
		pagemap.put("rows", rows);
		if (stylename != "")
		{
			pagemap.put("stylename", stylename);
		}
		
		if (stylemode != 0)
		{
			pagemap.put("stylemode", stylemode);
		}
		
		//response.setHeader("Cache-Control", "no-cache");   
        //response.setContentType("text/json;charset=UTF-8");  
        //response.setCharacterEncoding("UTF-8");  
        
		
		List<Styleinformation> styleinformation = styleinformationService.selectAllstyleinfo(pagemap);
		
		Map map = new HashMap();
		map.put("rows",styleinformation);
        map.put("total", styleinformationService.selectCount(pagemap));
        return map;
	}
	
	/**状态更改�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/style_use",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String edituse(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
        
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8"); 
		
		String ID = request.getParameter("ID").trim();
		String USE = request.getParameter("USE").trim();
		
		Styleinformation style = new Styleinformation();
		style.setId(Integer.valueOf(ID));

		if (USE.equals("启用"))
		{
			style.setStatus("1");
		}
		else
		{
			style.setStatus("0");
		}
		
		styleinformationService.updateByPrimaryKeySelective(style);
		strreturn = "success";
		Gson gson = new Gson();
		
		return gson.toJson(strreturn);
	}
	
	/**详细数据取得�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/style_detail",method = RequestMethod.POST)
	@ResponseBody
	public Styleinformation getdetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("UTF-8"); 
		
		int intid = Integer.valueOf(request.getParameter("ID").trim());
		Styleinformation stylemodel = new Styleinformation();
		stylemodel.setId(intid);
		
		stylemodel = styleinformationService.selectByPrimaryKey(intid);	//查询用户
		
		return stylemodel;
	}
	

	/**样式删除�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/style_delete",method = RequestMethod.POST)
	@ResponseBody
	public String styledelete(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
        
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8"); 
		
		int intid = Integer.valueOf(request.getParameter("ID").trim());
		try {  
			styleinformationService.deleteByPrimaryKey(intid);	//
			strreturn = "success";
		} catch (Exception e) {  
	        System.out.println("catch");
		}
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	
	/**样式全删除�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/style_deleteall",method = RequestMethod.GET)
	@ResponseBody
	public String delallstyle(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
        
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8"); 
		
		try {  
			styleinformationService.deleteAllStyle();	//
			strreturn = "success";
		} catch (Exception e) {  
	        System.out.println("catch");
		}
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	
}

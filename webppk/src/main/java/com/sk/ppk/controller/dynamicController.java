package com.sk.ppk.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.sk.ppk.model.Dynamicinformation;
import com.sk.ppk.service.DynamicService;
import com.sk.ppk.util.PathUtil;

@Controller
public class dynamicController
{
    @Resource(name = "dynamicService")
    private DynamicService dynamicService;   
	
	MultipartHttpServletRequest multipartRequesttemplate;
	MultipartHttpServletRequest multipartRequesttemplateimg;
	MultipartFile file;
	
	static String struploaddynamic = "";
	static String struploaddynamicimg = "";
	static String struploaddynamicold = "";
	static String struploaddynamicimgold = "";
	
	/**动态效果添加�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dynamic_add",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String adddynamic(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
		
		String DYNAMICNAME = request.getParameter("dynamicname").trim();
		String DYNAMICTYPE = request.getParameter("dynamictype").trim();
		String IMAGEPATH = struploaddynamicimg;
		String DYNAMICDESCRIBE = request.getParameter("dynamicdescribe").trim();
		Gson gson = new Gson();
		Dynamicinformation dynamicinformation = new Dynamicinformation();
		if(null == request.getSession().getAttribute("creatuser")){   
			strreturn = "sessiontimeout";
            return gson.toJson(strreturn);
        }
		else
		{
			dynamicinformation.setCreatuser(request.getSession().getAttribute("creatuser").toString());
		}
		
		Date date=new Date();
		dynamicinformation.setCreattime(date);
		dynamicinformation.setDynamicname(DYNAMICNAME);
		dynamicinformation.setDynamictype(DYNAMICTYPE);
		dynamicinformation.setDynamicimage(IMAGEPATH);
		dynamicinformation.setDynamicdescribe(DYNAMICDESCRIBE);
		dynamicinformation.setStatus(1);
		try{
			dynamicService.insert(dynamicinformation);
			strreturn = "success";
			
		} catch(Exception e){
	        System.out.println(e.getMessage());
		}
		
		return gson.toJson(strreturn);
	}
	
	/**动态效果图片�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dynamic_img",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String dynamicimg(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception{
		String strreturn = "failed";
		
		//创建一个通用的多部分解析器  
		multipartRequesttemplateimg = request;
		
        java.util.Date dt = new java.util.Date(System.currentTimeMillis());
        SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        
        MultipartFile fileimg = request.getFile("selectfile");
        PathUtil util = new PathUtil();
        String filename = fileimg.getOriginalFilename();
        
        String pathdynamicimg   =  request.getServletContext().getRealPath("/") + "static/dynamicimg/" + util.getFileNameNoEx(filename) + fmt.format(dt) + "." + util.getExtensionName(filename).toString();
        
        File localFile = new File(pathdynamicimg); 
        if(util.getFileNameNoEx(filename) != "")
            struploaddynamicimg = "static/dynamicimg/" + util.getFileNameNoEx(filename) + fmt.format(dt) + "." + util.getExtensionName(filename).toString();
        
        if (fileimg != null)
        {
    		try {
    			fileimg.transferTo(localFile);
    			strreturn = struploaddynamicimg;
    		} catch (Exception e) {  
    	        System.out.println(e.getMessage());
    		}
        }
		Gson gson = new Gson();
        return gson.toJson(strreturn);
	}
	
	/**取得动态数据�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/get_dynamic",method = RequestMethod.GET,produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getdynamic(HttpServletRequest request, HttpServletResponse response,Integer page,Integer rows) throws Exception{
		response.setContentType("text/javascript");
		response.setCharacterEncoding("utf-8");

		//response.setContentType("application/json;charset=UTF-8");//防止数据传递乱码
		page = Integer.valueOf(request.getParameter("page"));
		String strpageindex = request.getParameter("page");
		String strpagesize = request.getParameter("rows");
		int startindex = (page-1)*rows;

		String dynamicname = "";
		if (request.getParameter("dynamicname")!=null)
		{
			dynamicname = String.valueOf(request.getParameter("dynamicname"));
		}
		String selecttype = "";
		if (request.getParameter("selecttype")!=null)
		{
			selecttype = request.getParameter("selecttype");
		}
		
		Map pagemap = new HashMap();
		pagemap.put("page", startindex);
		pagemap.put("rows", rows);
		if (dynamicname != "")
		{
			pagemap.put("dynamicname", dynamicname);
		}
		
		if (selecttype != "")
		{
			pagemap.put("selecttype", selecttype);
		}
		
		List<Dynamicinformation> dynamicinformation = dynamicService.selectAlldynamicinfo(pagemap);
		
		Map map = new HashMap();
		map.put("rows",dynamicinformation);
        map.put("total", dynamicService.selectCount(pagemap));
        return map;
		
	}
	
	/**取得详细数据�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dynamic_detail",method = RequestMethod.GET,produces = "application/json; charset=utf-8")
	@ResponseBody
	public Dynamicinformation dynamicdetail(HttpServletRequest request, HttpServletResponse response,Integer page,Integer rows) throws Exception{
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8"); 
		
		int intid = Integer.valueOf(request.getParameter("ID").trim());
		
		Dynamicinformation dynamicinformation = new Dynamicinformation();

		dynamicinformation = dynamicService.selectByPrimaryKey(intid);	//查询用户
		
		return dynamicinformation;
	}
	
	/**保存角色�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dynamic_save",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String savedynamic(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
        
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id").trim();
		String dynamicname = request.getParameter("dynamicname").trim();
		String dynamictype = request.getParameter("dynamictype").trim();
		String dynamicimage = struploaddynamicimg;
		
		String dynamicdescribe = request.getParameter("dynamicdescribe").trim();
		
		Dynamicinformation dynamicinformation = new Dynamicinformation();
		dynamicinformation.setId(Integer.valueOf(id));
		dynamicinformation.setStatus(1);
		
		dynamicinformation.setDynamicname(dynamicname);
		dynamicinformation.setDynamictype(dynamictype);
		if (struploaddynamicimg!="")
		    dynamicinformation.setDynamicimage(dynamicimage);
		dynamicinformation.setDynamicdescribe(dynamicdescribe);

		try{
			
			dynamicService.updateByPrimaryKey(dynamicinformation);
			strreturn = "success";
			
		} catch(Exception e){
	        System.out.println(e.getMessage());
		}
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	
	/**状态更改�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dynamic_status",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String dynamic_status(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
        
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8"); 
		String ID = request.getParameter("ID").trim();
		String STATUS = request.getParameter("Status").trim();
		
		Dynamicinformation dynamicinformation = new Dynamicinformation();
		dynamicinformation.setId(Integer.valueOf(ID));
		if (STATUS.equals("启用"))
		{
			dynamicinformation.setStatus(0);
		}
		else
		{
			dynamicinformation.setStatus(1);
		}
		
		try{
			dynamicService.updatestatusByPrimaryKey(dynamicinformation);
			strreturn = "success";
			
		} catch(Exception e){
	        System.out.println(e.getMessage());
		}
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	
	/**删除数据
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dynamic_delete",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String dynamic_delete(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
        String strreturn = "failed";
        
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
		int intid = Integer.valueOf(request.getParameter("ID").trim());
		try {  
			dynamicService.deleteByPrimaryKey(intid);	//
			strreturn = "success";
		} catch (Exception e) {  
	        System.out.println("catch");
		}
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	

}

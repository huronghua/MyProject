package com.sk.ppk.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.sk.ppk.model.Styleinformation;
import com.sk.ppk.service.StyleinformationService;
import com.sk.ppk.util.PathUtil;

@Controller
public class styleController
{
	@Resource(name="styleinformationService")
	private StyleinformationService styleinformationService;
	
	
	MultipartHttpServletRequest multipartRequesttemplate;
	MultipartHttpServletRequest multipartRequesttemplateimg;
	MultipartFile file;
	
	static String struploadstyle = "";
	static String struploadstyleimg = "";
	static String struploadstyleold = "";
	static String struploadstyleimgold = "";
	
	/**样式添加�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/style_add",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String addstyle(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(); 
        
		String STYLENAME = request.getParameter("stylename").trim();
		String CONTROLS = request.getParameter("controls").trim();
		String DETAIL = request.getParameter("detail").trim();
		String STYLEMODE = request.getParameter("stylemode").trim();
		String IMAGEPATH = request.getParameter("imagepath").trim();
		Gson gson = new Gson();
		Styleinformation styleinfo = new Styleinformation();
		styleinfo.setStylename(STYLENAME);
		styleinfo.setUserid((Integer)request.getSession().getAttribute("userid"));
		if(null == request.getSession().getAttribute("creatuser")){   
			strreturn = "sessiontimeout";
            return gson.toJson(strreturn);
        }
		else
		{
			styleinfo.setCreatuser(request.getSession().getAttribute("creatuser").toString());
		}
		
		styleinfo.setApplycontrol(CONTROLS);
		styleinfo.setCssstyle(DETAIL);
		styleinfo.setStylemode(Integer.valueOf(STYLEMODE));
		styleinfo.setStatus("0");
		styleinfo.setStyleimg(IMAGEPATH);
		Date date=new Date();
		styleinfo.setCreattime(date);
		try{
			styleinformationService.insertStyle(styleinfo);
			strreturn = "success";
			
		} catch(Exception e){
	        System.out.println(e.getMessage());
		}
		
		
		return gson.toJson(strreturn);
	}
	
	/**样式保存�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/style_edit",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String editstyle(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
        
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
		
		String ID = request.getParameter("id").trim();
		String STYLENAME = request.getParameter("stylename").trim();
		String CONTROLS = request.getParameter("controls").trim();
		String DETAIL = request.getParameter("detail").trim();
		String STYLEMODE = request.getParameter("stylemode").trim();
		String IMAGEPATH = request.getParameter("imagepath").trim();
		
		Styleinformation styleinfo = new Styleinformation();
		styleinfo.setId(Integer.valueOf(ID));
		styleinfo.setStylename(STYLENAME);
		styleinfo.setUserid((Integer)request.getSession().getAttribute("userid"));
		styleinfo.setCreatuser(request.getSession().getAttribute("creatuser").toString());
		styleinfo.setApplycontrol(CONTROLS);
		styleinfo.setCssstyle(DETAIL);
		styleinfo.setStyleimg(IMAGEPATH);
		
		try{
			styleinformationService.updateByPrimaryKeySelective(styleinfo);
			strreturn = "success";					
		} catch(Exception e){
	        System.out.println(e.getMessage());
		}
			
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	
	/**样式图片�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/style_img",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String styleimg(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception{
		String strreturn = "failed";
		
		//创建一个通用的多部分解析器  
		multipartRequesttemplateimg = request;
        java.util.Date dt = new java.util.Date(System.currentTimeMillis());
        SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        
        MultipartFile fileimg = request.getFile("selectfile");
        PathUtil util = new PathUtil();
        String filename = fileimg.getOriginalFilename();
		
        String pathstyleimg   =  request.getServletContext().getRealPath("/") + "static/styleimg/" + util.getFileNameNoEx(filename) + fmt.format(dt) + "." + util.getExtensionName(filename).toString();
        
        File localFile = new File(pathstyleimg); 
        if(util.getFileNameNoEx(filename) != "")
            struploadstyleimg = "static/styleimg/" + util.getFileNameNoEx(filename) + fmt.format(dt) + "." + util.getExtensionName(filename).toString();
        
        if (fileimg != null)
        {
    		try {
    			fileimg.transferTo(localFile);
    			strreturn = struploadstyleimg;
    		} catch (Exception e) {  
    	        System.out.println(e.getMessage());
    		}
        }
		Gson gson = new Gson();
        return gson.toJson(strreturn);
	}
}

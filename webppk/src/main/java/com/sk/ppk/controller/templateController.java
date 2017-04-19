package com.sk.ppk.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

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
import com.sk.ppk.model.Templateinformation;
import com.sk.ppk.service.TemplateinformationService;
import com.sk.ppk.util.PathUtil;

@Controller
public class templateController
{
	@Resource(name="templateinformationService")
	private TemplateinformationService templateinformationService;
	
	
	MultipartHttpServletRequest multipartRequesttemplate;
	MultipartHttpServletRequest multipartRequesttemplateimg;
	MultipartFile file;
	
	static String struploadtemplate = "";
	static String struploadtemplateimg = "";
	static String struploadtemplateold = "";
	static String struploadtemplateimgold = "";
	
	/**模板添加�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/template_add",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String addtemplate(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
		
		String ID = request.getParameter("id").trim();
		String USE = request.getParameter("use").trim();
		String STATUS = request.getParameter("status").trim();
		String TYPE = request.getParameter("type").trim();
		String HOT = request.getParameter("hot").trim();
		String IMAGEPATH = request.getParameter("imagepath").trim();
		String FILEPATH = request.getParameter("filepath").trim();
		String NAME = request.getParameter("name").trim();
		
		File imgfile = new File(IMAGEPATH);
		String strallpathimg = "static\\templateimg\\" + imgfile.getName();
		
		Templateinformation templateinfo = new Templateinformation();
		//编号
		templateinfo.setNumberId(Integer.valueOf(ID));
		//状态
		templateinfo.setStatus(Integer.valueOf(STATUS));
		//类型
		templateinfo.setWebsitetype(TYPE);
		//用途
		templateinfo.setUseFul(USE);
		//热度
		templateinfo.setHotdegree(HOT);
		//图片
		templateinfo.setImagePath(IMAGEPATH);
		//模板
		templateinfo.setFilePath(FILEPATH);
		//标题
		templateinfo.setName(NAME);
		Gson gson = new Gson();
		
		if(null == request.getSession().getAttribute("creatuser")){   
			strreturn = "sessiontimeout";
            return gson.toJson(strreturn);
        }
		else
		{
			templateinfo.setCreatuser(request.getSession().getAttribute("creatuser").toString());
		}
		
		
		templateinfo.setCreatuser(request.getSession().getAttribute("creatuser").toString());
		Date creattime = new Date();
		templateinfo.setCreattime(creattime);
		
		try {
			templateinformationService.insert(templateinfo);
	        strreturn = "success";
		} catch (Exception e) {
            e.printStackTrace();
        }
		
		
		return gson.toJson(strreturn);
	}
	
	/**模板保存�
	 * 
	 */
	@RequestMapping(value="/template_save",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String savetemplate(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
		PathUtil util = new PathUtil();
		
		String ID = request.getParameter("id").trim();
		String NUMBERID = request.getParameter("numberid").trim();
		String USE = request.getParameter("use").trim();
		String STATUS = request.getParameter("status").trim();
		String TYPE = request.getParameter("type").trim();
		String HOT = request.getParameter("hot").trim();
		String IMAGEPATH = request.getParameter("imagepath").trim();
		String FILEPATH = request.getParameter("filepath").trim();
		String NAME = request.getParameter("name").trim();
		
		if (struploadtemplateimgold != "")
		{
		    File dirtempimg = new File(struploadtemplateimgold);
		    String imgpath = "static\\templateimg\\" + dirtempimg.getName();
		    boolean delflag = deleteFile(imgpath);
		}

		if (struploadtemplateold != "")
		{
		    File dirtemp = new File(struploadtemplateold);
		    String filepath = "static\\template\\" + dirtemp.getName();
		    File file = new File(filepath);
		    boolean delflag1 = deleteDir(file);
		}
		
		File imgfile = new File(IMAGEPATH);
		String strallpathimg = "static\\templateimg\\" + imgfile.getName();
		
		Templateinformation templateinfo = new Templateinformation();
		//id
		templateinfo.setId(Integer.valueOf(ID));
		//编号
		templateinfo.setNumberId(Integer.valueOf(NUMBERID));
		//状态
		templateinfo.setStatus(Integer.valueOf(STATUS));
		//类型
		templateinfo.setWebsitetype(TYPE);
		//用途
		templateinfo.setUseFul(USE);
		//热度
		templateinfo.setHotdegree(HOT);
		//图片
		templateinfo.setImagePath(strallpathimg);
		//模板
		templateinfo.setFilePath(util.getFileNameNoEx(FILEPATH));
		//标题
		templateinfo.setName(NAME);
		
		try {
			templateinformationService.updateByPrimaryKeySelective(templateinfo);
	        strreturn = "success";
		} catch (Exception e) {
            e.printStackTrace();
        }
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	
	/**上传模板图片�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/template_img",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String templateimg(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception{
		String strreturn = "failed";
		
		//创建一个通用的多部分解析器  
		multipartRequesttemplateimg = request;

        java.util.Date dt = new java.util.Date(System.currentTimeMillis());
        SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        
        MultipartFile fileimg = request.getFile("selectfile");
        PathUtil util = new PathUtil();
        String filename = fileimg.getOriginalFilename();
        
        //String pathtemplateimg   =  System.getProperty("b2cweb.root") + "static\\templateimg\\" + util.getFileNameNoEx(filename) + fmt.format(dt) + "." + util.getExtensionName(filename).toString();
        String pathtemplateimg   =  request.getServletContext().getRealPath("/") + "static/templateimg/" + util.getFileNameNoEx(filename) + fmt.format(dt) + "." + util.getExtensionName(filename).toString();
        
        File localFile = new File(pathtemplateimg); 
        struploadtemplateimg = "static/templateimg/" + util.getFileNameNoEx(filename) + fmt.format(dt) + "." + util.getExtensionName(filename).toString();
        
        if (fileimg != null)
        {
    		try {
    			fileimg.transferTo(localFile);
    			strreturn = struploadtemplateimg;
    		} catch (Exception e) {  
    	        System.out.println(e.getMessage());
    		}
        }
		Gson gson = new Gson();
        return gson.toJson(strreturn);
	}
	
	/**删除模板�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/template_file_delete",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody	
	public String templatefiledelete(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
		
		struploadtemplateold = request.getParameter("filepath").trim();
/*		File dirtemp = new File(request.getParameter("filepath").trim());
		String filepath = System.getProperty("b2cweb.root") + "static\\template\\" + dirtemp.getName();
		File dir = new File(filepath);
		boolean delflag = deleteDir(dir);*/

        strreturn = "success";
		Gson gson = new Gson();
        return gson.toJson(strreturn);
	}
	
	/**删除图片�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/template_img_delete",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody	
	public String templateimgdelete(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
		
		struploadtemplateimgold = request.getParameter("imgpath").trim();
/*		File dirtemp = new File(request.getParameter("imgpath").trim());
		String filepath = System.getProperty("b2cweb.root") + "static\\templateimg\\" + dirtemp.getName();
		File imgfile = new File(filepath);
		boolean delflag = deleteFile(filepath);
        if (delflag==true)
        {
        	strreturn = "success";
        }*/
        strreturn = "success";
		Gson gson = new Gson();
        return gson.toJson(strreturn);
	}    
	
	/**
     * 删除单个文件
     * @param   sPath    被删除文件的文件名
     * @return 单个文件删除成功返回true，否则返回false
     */
    public boolean deleteFile(String sPath) {
        Boolean flag = false;
        File file = new File(sPath);
        // 路径为文件且不为空则进行删除
        if (file.isFile() && file.exists()) {
            file.delete();
            flag = true;
        }
        return flag;
    }
	
    /**
     * 递归删除目录下的所有文件及子目录下所有文件
     * @param dir 将要删除的文件目录
     * @return boolean Returns "true" if all deletions were successful.
     *                 If a deletion fails, the method stops attempting to
     *                 delete and returns "false".
     */
    private static boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            for (int i=0; i<children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        // 目录此时为空，可以删除
        return dir.delete();
    }
    
	/**上传模板�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/template_model",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String templatemodel(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception{
		String strreturn = "failed";
		
		//创建一个通用的多部分解析器  
		multipartRequesttemplate = request;
		
        java.util.Date dt = new java.util.Date(System.currentTimeMillis());
        SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        
        MultipartFile filetemplate = request.getFile("selecttemplate");
        PathUtil util = new PathUtil();
        String filename = filetemplate.getOriginalFilename();
        
        String pathtemplate =  request.getServletContext().getRealPath("/") + "static\\template\\" + util.getFileNameNoEx(filename) + fmt.format(dt) + "." + util.getExtensionName(filename).toString();
        File localFile = new File(pathtemplate);

        if (filetemplate != null)
        {
    		try {  
    			filetemplate.transferTo(localFile);
  
    	        String pathtemplatetmp   =  request.getServletContext().getRealPath("/") + "static\\template\\webppk";
    	        String pathtemplatetmp1   =  request.getServletContext().getRealPath("/") + "static\\template\\";
    	        unzip(pathtemplate,pathtemplatetmp1);

    	        localFile.delete();
    			strreturn = "static\\template\\" + util.getFileNameNoEx(filename) + fmt.format(dt) + "." + util.getExtensionName(filename).toString();
    		} catch (Exception e) {  
    	        System.out.println("catch");
    		}
        }
		Gson gson = new Gson();
        return gson.toJson(strreturn);
	}
	
	/**删除记录�
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @throws Exception
	 */
	@RequestMapping(value="/template_del",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String templatedel(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String strreturn = "failed";
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		
		String ID = request.getParameter("id").trim();
		
		try {
			templateinformationService.deleteByPrimaryKey(Integer.valueOf(ID));
			strreturn = "success";
		} catch (Exception e) {
            e.printStackTrace();
        }
		Gson gson = new Gson();
        return gson.toJson(strreturn);
	}
	
	/**状态设置�
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @throws Exception
	 */
	@RequestMapping(value="/template_status",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String templatestatus(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String strreturn = "failed";
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		
		String ID = request.getParameter("id").trim();
		String STATUS = request.getParameter("status").trim();
		Templateinformation templateinfo = new Templateinformation();
		
		templateinfo.setId(Integer.valueOf(ID));
		templateinfo.setStatus(Integer.valueOf(STATUS));
		try {
			templateinformationService.updateStatus(templateinfo);
			strreturn = "success";
		} catch (Exception e) {
            e.printStackTrace();
        }
		Gson gson = new Gson();
        return gson.toJson(strreturn);
	}
	
	/**模板查询�
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @throws Exception
	 */
	@RequestMapping(value="/template_list",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<Templateinformation> gettemplate(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		
		int rows = Integer.valueOf(request.getParameter("rows"));
		int page = Integer.valueOf(request.getParameter("page"));
		
		String modelname = request.getParameter("modelname");
		String selecttype = request.getParameter("selecttype");
		String templateorder = request.getParameter("templateorder");
		
		int startindex = (page-1)*rows;
		
		Map pagemap = new HashMap();
		pagemap.put("page", startindex);
		pagemap.put("rows", rows);
		pagemap.put("modelname", modelname);
		pagemap.put("websitetype", selecttype);
		
		pagemap.put("selecttype", selecttype);
		if (templateorder.equals("1"))
		{
		    pagemap.put("templateorder", templateorder);
		}
		
		List<Templateinformation> templateinformationList = templateinformationService.getTemplate(pagemap);

		return templateinformationList;
	}
	
	/**模板件数取得�
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @throws Exception
	 */
	@RequestMapping(value="/template_count",method = RequestMethod.GET,produces = "application/json; charset=utf-8")
	@ResponseBody
	public int templatecount(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		
		String modelname = request.getParameter("modelname");
		String selecttype = request.getParameter("selecttype");
		String templateorder = request.getParameter("templateorder");
		
		Map pagemap = new HashMap();
		pagemap.put("modelname", modelname);
		pagemap.put("websitetype", selecttype);
		pagemap.put("selecttype", selecttype);
		
		int intcount = 0;
		intcount = templateinformationService.getTemplateCount(pagemap);
		
		return intcount;
	}
	
	/**模板详细取得�
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @throws Exception
	 */
	@RequestMapping(value="/template_detail",method = RequestMethod.GET,produces = "application/json; charset=utf-8")
	@ResponseBody
	public Templateinformation templatedetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		
		int intid = Integer.valueOf(request.getParameter("ID").trim());
		Templateinformation templatemodel = new Templateinformation();
		
		templatemodel.setId(intid);
		templatemodel = templateinformationService.selectByPrimaryKey(intid);	//查询用户
		
		String path = struploadtemplateimg;
		File dirtemp = new File(templatemodel.getImagePath());
		
		String filename = dirtemp.getName();
		String strallpath = "static\\templateimg\\" + filename;
		templatemodel.setImagePath(strallpath);
		return templatemodel;
	}
	
	/**解压缩�
	 * @return
	 * @throws Exception
	 */
    public static boolean unzip( String zipFileFullPath, String unzipPath) {

        File baseFile = new File(zipFileFullPath);
        File baseDir = new File(baseFile.getParent(), baseFile.getName().substring(0, baseFile.getName().lastIndexOf(".")));

        if ( !baseDir.mkdir())
            System.out.println("Couldn't create directory because directory with the same name exists.: " + baseDir);

        ZipFile zipFile = null;
        try {
            zipFile = new ZipFile(zipFileFullPath);
            Enumeration<? extends ZipEntry>  enumZip = zipFile.entries();
            while ( enumZip.hasMoreElements() ) {
                ZipEntry zipEntry = (java.util.zip.ZipEntry)enumZip.nextElement();

                File unzipFile = new File(unzipPath);
                File outFile = new File(unzipFile.getAbsolutePath() + "/" + baseDir.getName(), zipEntry.getName());
                struploadtemplate = unzipFile.getAbsolutePath() + "/" + baseDir.getName();
                if ( zipEntry.isDirectory() )
                    outFile.mkdir();
                else {
                    BufferedInputStream in = new BufferedInputStream(zipFile.getInputStream(zipEntry));
                    if ( !outFile.getParentFile().exists() )
                        outFile.getParentFile().mkdirs();

                    BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(outFile));

                    byte[] buffer = new byte[1024];

                    int readSize = 0;
                    while ( (readSize = in.read(buffer)) != -1 ) {
                        out.write(buffer, 0, readSize);
                    }
                    try { out.close(); } catch (Exception e) {}
                    try { in.close(); } catch (Exception e) {}
                }
            }
            return true;
        } catch(Exception e) {
            return false;
        } finally {
            if ( zipFile != null )
                try { zipFile.close();    } catch (Exception e) {}
        }
    }
}

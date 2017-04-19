package com.sk.ppk.controller;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sk.ppk.model.Dynamicinformation;
import com.sk.ppk.model.Styleinformation;
import com.sk.ppk.model.Templateinformation;
import com.sk.ppk.service.DynamicService;
import com.sk.ppk.service.StyleinformationService;
import com.sk.ppk.service.TemplateinformationService;

@Controller
public class homeController {

    @Resource(name = "templateinformationService")
    private TemplateinformationService templateinformationService;
    
	@Resource(name="styleinformationService")
	private StyleinformationService styleinformationService;
	
	@Resource(name="dynamicService")
	private DynamicService dynamicService;


    private String strpath = "";
    /**
     * html取得�
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/get_html", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String gethtml(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String strreturn = "failed";
        String temp;
        final StringBuffer sb = new StringBuffer();
        String path = request.getContextPath();
    	String basePath = request.getScheme() + "://"
    			+ request.getServerName() + ":" + request.getServerPort()
    			+ path + "/";
        String htmlurl = basePath + request.getParameter("htmlurl") + "/" + "index.html";
        strpath = request.getParameter("htmlurl");
        String allpath = "../ppk/" + request.getParameter("htmlurl") + "/";
        StringBuffer url = request.getRequestURL();
        String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
        tempContextUrl = tempContextUrl.substring(0, tempContextUrl.toString().length() - 1);
        String Stringpath = request.getContextPath();

/*        URL urlpath = new URL("http://www.baidu.com");
        URLConnection conn = urlpath.openConnection();//获得UrlConnection 连接对象
        InputStream is = conn.getInputStream();//获得输入流
        // isr = new InputStreamReader(System.in);//system.in标准系统输入
        BufferedReader br = new BufferedReader(new InputStreamReader(is));//buffered表示缓冲类
*/
        Gson gson = new Gson();
        htmlurl = htmlurl.replaceAll("\\\\", "/");
        return gson.toJson(getHtmlcode(htmlurl,allpath));
    }

    /*
	* 获取所指向url的输出流(指所有内容) 
	* @urlString url路径 如:http://www.baidu.com
	*返回的String 则为html代码
	* */
    private String getHtmlcode(String urlString,String allpath) {
        try {
        	
        	File file = new File(urlString);
            StringBuffer html = new StringBuffer();
            java.net.URL url = new java.net.URL(urlString); //根据 String 表示形式创建 URL 对象。
            java.net.HttpURLConnection conn = (java.net.HttpURLConnection) url.openConnection();// 返回一个 URLConnection 对象，它表示到 URL 所引用的远程对象的连接。
            java.io.InputStreamReader isr = new java.io.InputStreamReader(conn.getInputStream());//返回从此打开的连接读取的输入流。
            java.io.BufferedReader br = new java.io.BufferedReader(isr);//创建一个使用默认大小输入缓冲区的缓冲字符输入流。

            String temp;
            String strpath;
            while ((temp = br.readLine()) != null) { //按行读取输出流
                if (!temp.trim().equals("")) {
                	if (temp.contains("<link"))
                	{
                		
                		String[] links = temp.split(" ");
                		String link = "";
                		String oldlink = "";
                		String newlink = "";
                		for (int i = 0 ; i <links.length ; i++ ) {
                			
                			link = links[i];
                			if (link.contains("href"))
                			{
                				int startpos = 0;
                				if (link.indexOf("./css")==-1)
                				{
                					startpos = link.indexOf("/") + 1;
                				}
                				else
                				{
                					startpos = link.indexOf("/") + 4;
                				}
                				int endpos = link.lastIndexOf("/");
                				oldlink = link.substring(startpos, endpos);
                			}
                		}
                		strpath = temp.replace("./"+oldlink, allpath+oldlink);
                		temp = strpath;
                	}
                	
                	strpath = "";
                	if (temp.contains("<img"))
                	{
                		String[] images = temp.split(" ");
                		String image = "";
                		String oldimage = "";
                		
                		for (int i = 0 ; i <images.length ; i++ ) {
                			
                			image = images[i];
                			
                			if (image.contains("src"))
                			{
                				int startpos = image.indexOf("\"") + 3;
                				int endpos = image.lastIndexOf("\"");
                				oldimage = image.substring(startpos, endpos);
                			}
                		}
                		strpath = temp.replace("./"+oldimage, allpath+oldimage);
                		temp = strpath;
                	}
                	
                	if (temp.contains("<script"))
                	{
                		
/*                		String[] scripts = temp.split(" ");
                		String script = "";
                		String oldscript = "";

                		for (int i = 0 ; i <scripts.length ; i++ ) {
                			
                			script = scripts[i];
                			System.out.println(script);
                			if (script.contains("src"))
                			{
                				int startpos = script.indexOf("\"") + 3;
                				int endpos = script.lastIndexOf("\"");
                				oldscript = script.substring(startpos, endpos);
                			}
                		}
                		
                		if (oldscript != "")
                		{
                		    strpath = temp.replace("./"+oldscript, allpath+oldscript);
                		    System.out.println("./"+oldscript);
                		    System.out.println(allpath+oldscript);
                		    temp = strpath;
                		}
                	}
                	
                	if (temp.contains("<iframe"))
                	{
                		String[] iframes = temp.split(" ");
                		String iframe = "";
                		String oldframe = "";

                		for (int i = 0 ; i <iframes.length ; i++ ) {
                			
                			iframe = iframes[i];
                			System.out.println(iframe);
                			if (iframe.contains("src"))
                			{
                				int startpos = iframe.indexOf("\"") + 3;
                				int endpos = iframe.lastIndexOf("\"");
                				oldframe = iframe.substring(startpos, endpos);
                			}
                		}
                		
                		if (oldframe != "")
                		{
                		    strpath = temp.replace("./"+oldframe, allpath+oldframe);
                		    temp = strpath;
                		} */
                	}
                	
                    html.append(temp).append("\n"); //读完每行后换行
                }
            }
            br.close(); //关闭
            isr.close(); //关闭
            return html.toString(); //返回此序列中数据的字符串表示形式。
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    /** 
     * 获取指定HTML标签的指定属性的值 
     * @param source 要匹配的源文本 
     * @param element 标签名称 
     * @param attr 标签的属性名称 
     * @return 属性值列表 
     */  
    public static List<String> match(String source, String element, String attr) {  
        List<String> result = new ArrayList<String>();  
        String reg = "<" + element + "[^<>]*?\\s" + attr + "=['\"]?(.*?)['\"]?\\s.*?>";  
        Matcher m = Pattern.compile(reg).matcher(source);  
        while (m.find()) {  
            String r = m.group(1);  
            result.add(r);  
        }  
        return result;  
    }
    
    /**   
     * @param htmlStr  html文本   
     * @param searchTag  要修改的目标标签  
     * @param searchAttrib  目标标签中的属性  
     * @param newStr  修改值       
     */    
    public static String updateHtmlTag(String htmlStr, String searchTag,     
            String searchAttrib,String startStr , String endStr) {     
        String regxpForTag ="<\\s*" + searchTag + "\\s+([^>]*)\\s*>";      
        String regxpForTagAttrib = searchAttrib + "\\s*=\\s*[\"|']http://([^\"|']+)[\"|']";//"=[\"|']([^[\"|']]+)[\"|']";     
        Pattern patternForTag = Pattern.compile(regxpForTag);     
        Pattern patternForAttrib = Pattern.compile(regxpForTagAttrib);     
        Matcher matcherForTag = patternForTag.matcher(htmlStr);     
        StringBuffer sb = new StringBuffer();     
        boolean result = matcherForTag.find();     
        while (result) {     
            StringBuffer sbreplace = new StringBuffer("<"+searchTag +" ");   
            System.out.println(matcherForTag.group(1));  
            Matcher matcherForAttrib = patternForAttrib.matcher(matcherForTag     
                    .group(1));     
              
            if (matcherForAttrib.find()) {  
                matcherForAttrib.appendReplacement(sbreplace, searchAttrib+"=\"" +startStr     
                        + matcherForAttrib.group(1) + endStr);     
            }        
            matcherForAttrib.appendTail(sbreplace);   
            matcherForTag.appendReplacement(sb, sbreplace.toString()+">");  
            result = matcherForTag.find();     
        }     
        matcherForTag.appendTail(sb);     
        return sb.toString();     
    }     
      

    /**
     * 模板取得�
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/hometemplate_list", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public List<Templateinformation> hometemplatelist(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");
        
        int rows = Integer.valueOf(request.getParameter("rows"));
        int page = Integer.valueOf(request.getParameter("page"));
        
        String modelname = request.getParameter("modelname");
        String selecttype = request.getParameter("selecttype");
        String templateorder = request.getParameter("templateorder");
        String templatetype = request.getParameter("templatetype");
        int startindex = (page - 1) * rows;

        Map pagemap = new HashMap();
        pagemap.put("page", startindex);
        pagemap.put("rows", rows);
        pagemap.put("modelname", modelname);
        pagemap.put("websitetype", selecttype);

        pagemap.put("selecttype", selecttype);
        if (templateorder.equals("1")) {
            pagemap.put("templateorder", templateorder);
        }
        pagemap.put("templatetype", templatetype);
        
        List<Templateinformation> templateinformationList = templateinformationService.getTemplatebytype(pagemap);

        return templateinformationList;
    }
    
    /**
     * 样式列表取得�
     *
     * @return
     * @throws Exception
     */
	@RequestMapping(value="/getstylelist",method = RequestMethod.GET,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map getstylelist(HttpServletRequest request, HttpServletResponse response,Integer page,Integer rows) throws Exception{
		response.setContentType("text/javascript");
		response.setCharacterEncoding("utf-8");
		
		List<Styleinformation> styleinformation = styleinformationService.selectAllstylelist();
		
		Map map = new HashMap();
		map.put("list",styleinformation);
        return map;
	}
	
	/**动态效果数据
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getdynamiclist",method = RequestMethod.GET,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map getdynamiclist(HttpServletRequest request, HttpServletResponse response,Integer page,Integer rows) throws Exception{
		response.setContentType("text/javascript");
		response.setCharacterEncoding("utf-8");
		
		String ID = request.getParameter("ID");
		Map pagemap = new HashMap();
		pagemap.put("ID", ID);
		List<Dynamicinformation> dynamicinformation = dynamicService.selectAlldynamiclist(pagemap);
		
		Map map = new HashMap();
		map.put("list",dynamicinformation);
        return map;
	}
	
	/**修改模板样式表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/get_cssstyle",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getcssstyle(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/javascript");
		response.setCharacterEncoding("utf-8");
		
		String strreturn = "failed";
		
		String strDir = strpath;
		
		
		if (strpath != "")
		{
			strpath = request.getSession().getServletContext().getRealPath("/") + "/" + "static/" + "fanshilei.css" ;
		}
		
		strpath = strpath.replaceAll("\\\\", "/");
		strDir = strDir.replaceAll("\\\\", "/");
		Gson gson = new Gson();
		File file=new File(strpath);
		
		if (!file.exists())
		{
			
			try {    

		        file.createNewFile();    

				String stylename = request.getParameter("classname");
				Map pagemap = new HashMap();
				pagemap.put("stylename", stylename);
				String stylecontent = styleinformationService.selectstylecontent(pagemap);
				appendMethod(strpath,stylecontent);
				strreturn = "success";
		    } catch (IOException e) {    
		        // TODO Auto-generated catch block    
		        e.printStackTrace();    
		    } 
		}
		else
		{
			strreturn = "success";
		}
		
		return gson.toJson(strreturn);
	}

	public static void appendMethod(String fileName, String content) {
	    try {
	        // 打开一个随机访问文件流，按读写方式
	        RandomAccessFile randomFile = new RandomAccessFile(fileName, "rw");
	        // 文件长度，字节数
	        long fileLength = randomFile.length();
	        //将写文件指针移到文件尾。
	        randomFile.seek(fileLength);
	        randomFile.writeBytes(content);
	        randomFile.close();
	    } catch (IOException e) {
	       e.printStackTrace();
	    }
	}
	
}

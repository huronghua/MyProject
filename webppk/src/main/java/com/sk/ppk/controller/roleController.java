package com.sk.ppk.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sk.ppk.model.Page;
import com.sk.ppk.model.Role;
import com.sk.ppk.service.RoleService;

@Controller
public class roleController {
	
	@Resource(name="roleService")
	private RoleService roleService;
	
	
	/**角色查詢�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/get_role",method = RequestMethod.GET,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map getrole(HttpServletRequest request, HttpServletResponse response,Integer page,Integer rows) throws Exception{
        String strreturn = "failed";
        
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8"); 
		
		page = Integer.valueOf(request.getParameter("page"));
		String strpageindex = request.getParameter("page");
		String strpagesize = request.getParameter("rows");
		
		int startindex = (page-1)*rows;
		
		
		Map pagemap = new HashMap();
		pagemap.put("page", startindex);
		pagemap.put("rows", rows);
		
		String rolename = "";
		if (request.getParameter("RoleName")!=null)
		{
			rolename = String.valueOf(request.getParameter("RoleName"));
		}
		
		String creatuser = "";
		if (request.getParameter("CreatUser")!=null)
		{
			creatuser = String.valueOf(request.getParameter("CreatUser"));
		}
		
		pagemap.put("rolename", rolename);
		pagemap.put("creatuser", creatuser);
		
		List<Role> roleinformation = roleService.selectAllroleinfo(pagemap);
		Map map = new HashMap();
		map.put("rows",roleinformation);
        map.put("total", roleService.selectCount(pagemap));
        return map;
		
	}
	
	/**角色追加�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/add_role",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String addrole(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        
		String STATUS = request.getParameter("status").trim();
		String ROLETYPE = request.getParameter("roletype").trim();
		String ROLENAME = request.getParameter("rolename").trim();
		String SYSTEMCONFIGURE = request.getParameter("systemconfigure").trim();
		String BASICCONFIGURE = request.getParameter("basicconfigure").trim();
		String AUTHORITYXONFIGURE = request.getParameter("authorityconfigure").trim();
		
		Role role = new Role();
		role.setStatus(Integer.valueOf(STATUS));
		role.setRoletype(Integer.valueOf(ROLETYPE));
		role.setRoleName(ROLENAME);
		role.setSystemConfigure(SYSTEMCONFIGURE);
		role.setBasicConfigure(BASICCONFIGURE);
		role.setAuthorityConfigure(AUTHORITYXONFIGURE);
		role.setCreateuser(request.getSession().getAttribute("creatuser").toString());
		Date date=new Date();
		role.setCreatetime(date);
		
		try{
			roleService.insertRole(role);
			strreturn = "success";
			
		} catch(Exception e){
	        System.out.println(e.getMessage());
		}
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	
	/**角色详细取得�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/role_detail",method = RequestMethod.GET,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Role roledetail(HttpServletRequest request, HttpServletResponse response,Integer page,Integer rows) throws Exception{
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8"); 
		
		int intid = Integer.valueOf(request.getParameter("ID").trim());
		
		Role role = new Role();

		role = roleService.selectByPrimaryKey(intid);	//查询用户
		
		return role;
	}
	
	/**保存角色�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save_role",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String saverole(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
        
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
		
		String ID = request.getParameter("id").trim();
		String STATUS = request.getParameter("status").trim();
		String ROLETYPE = request.getParameter("roletype").trim();
		String ROLENAME = request.getParameter("rolename").trim();
		String SYSTEMCONFIGURE = request.getParameter("systemconfigure").trim();
		String BASICCONFIGURE = request.getParameter("basicconfigure").trim();
		String AUTHORITYXONFIGURE = request.getParameter("authorityconfigure").trim();
		
		Role role = new Role();
		role.setId(Integer.valueOf(ID));
		role.setStatus(Integer.valueOf(STATUS));
		role.setRoletype(Integer.valueOf(ROLETYPE));
		role.setRoleName(ROLENAME);
		role.setSystemConfigure(SYSTEMCONFIGURE);
		role.setBasicConfigure(BASICCONFIGURE);
		role.setAuthorityConfigure(AUTHORITYXONFIGURE);
		try{
			roleService.saverole(role);
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
	@RequestMapping(value="/role_use",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody	
	public String roleuse(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
        
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8"); 
		
		String ID = request.getParameter("ID").trim();
		String USE = request.getParameter("USE").trim();
		
		Role role = new Role();
		role.setId(Integer.valueOf(ID));
		
		if (USE.equals("启用"))
		{
			role.setStatus(1);
		}
		else
		{
			role.setStatus(0);
		}
		
		try{
			roleService.updateByPrimaryKeySelective(role);
			strreturn = "success";
			
		} catch(Exception e){
	        System.out.println(e.getMessage());
		}
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	
	/**角色删除�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/role_delete",method = RequestMethod.POST)
	@ResponseBody
	public String roledelete(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
        
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8"); 
		
		int intid = Integer.valueOf(request.getParameter("ID").trim());
		try {  
			roleService.deleteByPrimaryKey(intid);	//
			strreturn = "success";
		} catch (Exception e) {  
	        System.out.println("catch");
		}
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	
	
	/**角色全删除�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/role_deleteall",method = RequestMethod.POST)
	@ResponseBody	
	public String roledeleteall(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
        
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8"); 
		
		try {  
			roleService.deleteAllRole();	//
			strreturn = "success";
		} catch (Exception e) {  
	        System.out.println("catch");
		}
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	
	//列举所有角色
	@RequestMapping("/listAllRole")
	public ModelAndView listAllRole(Integer pageNum){
		String url = "/ppk/listAllRole.action";
		Page page = roleService.selectRolePage(pageNum, url);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("page",page);
		modelAndView.setViewName("role_list");
		return modelAndView;		
	}
	
}

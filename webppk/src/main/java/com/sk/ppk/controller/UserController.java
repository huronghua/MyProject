package com.sk.ppk.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sk.ppk.dao.UserMapper;
import com.sk.ppk.model.Page;
import com.sk.ppk.model.Styleinformation;
import com.sk.ppk.model.User;
import com.sk.ppk.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private UserMapper userMapper;

	/**新增用户�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user_add",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String adduser(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(); 
        
		String USERNAME = request.getParameter("username").trim();
		String TXTNAME = request.getParameter("txtname").trim();
		String PASSWORD = request.getParameter("password").trim();
		String TXTMOBILE = request.getParameter("txtmobile").trim();
		String TXTEMAIL = request.getParameter("txtemail").trim();
		String SELECTSTATUS = request.getParameter("selectstatus").trim();
		Integer RoleType = Integer.valueOf(request.getParameter("roletype").trim());
		
		User userinfo = new User();
		userinfo.setUsername(USERNAME);
		userinfo.setPassword(PASSWORD);
		userinfo.setName(TXTNAME);
		userinfo.setMobile(TXTMOBILE);
		userinfo.setEmail(TXTEMAIL);
		userinfo.setStatus(SELECTSTATUS);
		userinfo.setRoletype(RoleType);
		
		Date date=new Date();
		userinfo.setCreattime(date);
		List<User> user =  userService.validateUser(USERNAME);
		System.out.println(user.isEmpty());
		if(!user.isEmpty()){
			strreturn = "failed";
		}
		else{
			userService.insertUser(userinfo);
			strreturn = "success";
		}
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	
	/**取得用户�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getuser",method = RequestMethod.GET,produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getuser(HttpServletRequest request, HttpServletResponse response,Integer page,Integer rows) throws Exception{
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
		
		page = Integer.valueOf(request.getParameter("page"));
		String strpageindex = request.getParameter("page");
		String strpagesize = request.getParameter("rows");
		
		int startindex = (page-1)*rows;
		
		Map pagemap = new HashMap();
		pagemap.put("page", startindex);
		pagemap.put("rows", rows);
		
		String username = "";
		if (request.getParameter("username")!=null)
		{
			username = String.valueOf(request.getParameter("username"));
		}
		
		pagemap.put("username", username);
		List<User> user = userService.selectAllinfo(pagemap);
		
		Map map = new HashMap();
		map.put("rows",user);
        map.put("total", userService.selectUserCount(pagemap));
        return map;
	}
	
	/**详细数据取得�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user_detail",method = RequestMethod.GET)
	@ResponseBody
	public User getdetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8"); 
		int intid = Integer.valueOf(request.getParameter("ID").trim());
		User user = new User();
		user.setId(intid);
		
		user = userService.selectByPrimaryKey(intid);	//查询用户
		
		return user;
	}
	
	/**保存数据�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user_save",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String usersave(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(); 
        
        String ID = request.getParameter("id").trim();
		String USERNAME = request.getParameter("username").trim();
		String PASSWORD  = request.getParameter("password").trim();
		String TXTNAME = request.getParameter("txtname").trim();
		String TXTMOBILE = request.getParameter("txtmobile").trim();
		String TXTEMAIL = request.getParameter("txtemail").trim();
		String SELECTSTATUS = request.getParameter("selectstatus").trim();
		Integer RoleType = Integer.valueOf(request.getParameter("roletype").trim());
		
		User userinfo = new User();
		userinfo.setId(Integer.valueOf(ID));
		userinfo.setUsername(USERNAME);
		userinfo.setPassword(PASSWORD);
		userinfo.setName(TXTNAME);
		userinfo.setMobile(TXTMOBILE);
		userinfo.setEmail(TXTEMAIL);
		userinfo.setStatus(SELECTSTATUS);
		userinfo.setRoletype(RoleType);
		try{
			userService.updateByPrimaryKeySelective(userinfo);
			strreturn = "success";
		} catch(Exception e){
	        System.out.println(e.getMessage());
		}
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	
	/**删除数据�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user_delete",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String userdelete(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
		
        String ID = request.getParameter("id").trim();
        System.out.println(ID);
		try{
			userService.deleteByPrimaryKey(Integer.valueOf(ID));;
			strreturn = "success";
			
		} catch(Exception e){
	        System.out.println(e.getMessage());
		}
		Gson gson = new Gson();
		System.out.println(strreturn);
		return gson.toJson(strreturn);
	}
	
	/**更改用户状态�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user_use",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String useruse(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
		
		String ID = request.getParameter("ID").trim();
		String USE = request.getParameter("USE").trim();
		
		User user = new User();
		user.setId(Integer.valueOf(ID));
		if (USE.equals("启用"))
		{
			user.setStatus("0");
		}
		else
		{
			user.setStatus("1");
		}
		
		try{
			userService.updateByPrimaryKeySelective(user);
			
			strreturn = "success";
		} catch(Exception e){
	        System.out.println(e.getMessage());
		}
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}

	
	/**删除所有数据�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user_delall",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String userdelall(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
		
		User user = new User();
		
		try{
			userService.deleteAll();
			strreturn = "success";
		} catch(Exception e){
	        System.out.println(e.getMessage());
		}
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	
	@RequestMapping("/listAllUser")
	public ModelAndView listAllUser(Integer pageNum) {
		String url = "/ppk/listAllUser.action";
		Page page = userService.selectUserPage(pageNum, url);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("page",page);
		modelAndView.setViewName("user_list");
		return modelAndView;
	}
	
	@RequestMapping("/editUser")
	public ModelAndView editUser(Integer id){
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.selectByPrimaryKey(id);
		modelAndView.addObject("user", user);
		modelAndView.addObject("flag", 0);
		modelAndView.setViewName("user_edit");
		return modelAndView;
	}
	
	@RequestMapping("/addOrUpdateUser")
	public ModelAndView addOrUpdateUser(User user, Integer flag){
		if(flag != null && flag == 0){ 
			// 修改一个用户
			userMapper.updateByPrimaryKeySelective(user);	
		} else {
			//新增一个用户
			userMapper.insertSelective(user);
		}
		return listAllUser(1);
	}
	
	@RequestMapping("/selectUserByCondition")
	public ModelAndView selectUserByCondition(String keyword){
		List<User> userList = userService.selectUserByCondition(keyword);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userList",userList);
		modelAndView.setViewName("user_list");
		return modelAndView;
	}
	
	@RequestMapping("/stopUser")
	public ModelAndView stopUser(Integer id){
        userService.stopUser(id);
        List<User> userList = userService.listAllUser();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userList",userList);
		modelAndView.setViewName("user_list");
		return modelAndView;
	}

}

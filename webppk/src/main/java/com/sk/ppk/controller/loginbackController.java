package com.sk.ppk.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sk.ppk.model.User;
import com.sk.ppk.service.UserService;

@Controller
public class loginbackController
{
	@Resource(name="userService")
	private UserService userService;
	
	
	/**后台用户登录
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login_backlogin",method = RequestMethod.POST)
	@ResponseBody
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");  
		String USERNAME = request.getParameter("loginname").trim();
		String PASSWORD = request.getParameter("password").trim();
		User user = new User();
		user.setUsername(USERNAME);
		user.setPassword(PASSWORD);
		
		if (userService.selectCount(user) != 0)
		{
			user = userService.selectUserByUP(user);	//查询用户
			HttpSession session = request.getSession(); 
			session.setAttribute("userid", user.getId());
			session.setAttribute("creatuser", user.getName()); 
			strreturn = "success";
		}	
		Gson gson = new Gson();
		
		return gson.toJson(strreturn);
	}
}

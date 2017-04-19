package com.sk.ppk.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sk.ppk.model.User;
import com.sk.ppk.service.UserService;
import com.sk.ppk.util.PageData;

@Controller
public class loginforeController  {
	@Resource(name="userService")
	private UserService userService;
	
	
	
	@RequestMapping("/Go")
	public String hello(){
		System.out.println("姝ゆ椂宸茬粡鎵ц");
		return "login";
	}
	
	/**璇锋眰鐧诲綍锛岄獙璇佺敤鎴�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login_login",method = RequestMethod.POST)
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
			user = userService.selectUserByUP(user);	//鏍规嵁鐢ㄦ埛鍚嶅拰瀵嗙爜鍘昏鍙栫敤鎴蜂俊鎭�
			strreturn = "success";
		}	
		Gson gson = new Gson();
		
		return gson.toJson(strreturn);
	}
	
	/**娉ㄥ唽鐢ㄦ埛
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user_register",method = RequestMethod.POST)
	@ResponseBody
	public String register(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
		String USERNAME = request.getParameter("loginname").trim();
		String PASSWORD = request.getParameter("password").trim();
		String COMPANY = request.getParameter("company").trim();
		String NAME = request.getParameter("name").trim();
		String MOBILE = request.getParameter("mobile").trim();
		String TELPHONE = request.getParameter("telphone").trim();
		String EMAIL = request.getParameter("email").trim();

		User user = new User();
		user.setUsername(USERNAME);
		user.setPassword(PASSWORD);
		user.setCompany(COMPANY);
		user.setName(NAME);
		user.setMobile(MOBILE);
		user.setTelphone(TELPHONE);
		user.setEmail(EMAIL);
		
		try {  
			userService.insertUser(user);
		} catch (Exception e) {  
	        System.out.println("catch");
		}
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	
	
/*	@RequestMapping("/Login")
	public String login(String username, String password){
		List<User> userList = userService.selectUserByUP(username, password);
		if (userList == null || userList.isEmpty()){
			return "index.jsp";
		} else {
			return "main.jsp";
		}
	}*/
	
	/**寰楀埌ModelAndView
	 * @return
	 */
	public ModelAndView getModelAndView(){
		return new ModelAndView();
	}
	
	/** new PageData瀵硅薄
	 * @return
	 */
	public PageData getPageData(){
		return new PageData(this.getRequest());
	}
	
	/**寰楀埌request瀵硅薄
	 * @return
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}
	
}

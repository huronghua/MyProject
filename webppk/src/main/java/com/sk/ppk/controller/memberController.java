package com.sk.ppk.controller;

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

import com.google.gson.Gson;
import com.sk.ppk.model.Member;
import com.sk.ppk.model.User;
import com.sk.ppk.service.MemberService;

@Controller
public class memberController {
	@Resource(name="memberService")
	private MemberService memberService;
	/**会员查詢�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getmember",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map getmember(HttpServletRequest request, HttpServletResponse response,Integer page,Integer rows) throws Exception{
		
		response.setContentType("text/javascript");
		response.setCharacterEncoding("utf-8");

		//response.setContentType("application/json;charset=UTF-8");//防止数据传递乱码
		page = Integer.valueOf(request.getParameter("page"));
		String strpageindex = request.getParameter("page");
		String strpagesize = request.getParameter("rows");
		
		int startindex = (page-1)*rows;

		
		String membername = "";
		if (request.getParameter("membername")!=null)
		{
			membername = String.valueOf(request.getParameter("membername"));
		}
		
		int type = 0;
		if (request.getParameter("type")!=null)
		{
			if (request.getParameter("type")!="0")
			{
				type = Integer.valueOf(request.getParameter("type"));
			}
		}
		int order = 0;
		if (request.getParameter("order")!=null)
		{
			if (request.getParameter("order")!="0")
			{
				order = Integer.valueOf(request.getParameter("order"));
			}
		}
		
		Map pagemap = new HashMap();
		pagemap.put("page", startindex);
		pagemap.put("rows", rows);
		if (membername != "")
		{
			pagemap.put("membername", membername);
		}
		if (order != 0)
		{
			pagemap.put("order", "LastLoginTime");
		}
		else{
			pagemap.put("order", "ID");
		}
		
		if (type != 0)
		{
			pagemap.put("type", type);
			List<Member> memberinformation = memberService.selectTypememberinfo(pagemap);
			Map map = new HashMap();
			map.put("rows",memberinformation);
	        map.put("total", memberService.selectTypeCount(pagemap));
	        System.out.println(memberService.selectTypeCount(pagemap));
	        return map;
		}
		else{
			List<Member> memberinformation = memberService.selectAllmemberinfo(pagemap);
			Map map = new HashMap();
			map.put("rows",memberinformation);
	        map.put("total", memberService.selectAllCount(pagemap));
	        System.out.println(memberService.selectAllCount(pagemap));
	        return map;
		}

	}
	/**详细数据取得�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/member_detail",method = RequestMethod.GET)
	@ResponseBody
	public Member getdetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8"); 
		int intid = Integer.valueOf(request.getParameter("ID").trim());
		Member member = new Member();
		member.setId(intid);
		
		member = memberService.selectByPrimaryKey(intid);//根据取得ID取得会员对象
		
		return member;
	}
	
	/**保存数据�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/member_save",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String membersave(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession(); 
        
        String id = request.getParameter("id").trim();
		String logname = request.getParameter("logname").trim();
		String password  = request.getParameter("password").trim();
		String contacts = request.getParameter("contacts").trim();
		String telphone = request.getParameter("telphone").trim();
		String email = request.getParameter("email").trim();
		Integer type = Integer.valueOf(request.getParameter("type").trim());
		
		Member memberinfo = new Member();
		memberinfo.setId(Integer.valueOf(id));
		memberinfo.setLogname(logname);
		memberinfo.setPassword(password);
		memberinfo.setContacts(contacts);
		memberinfo.setTelphone(telphone);
		memberinfo.setEmail(email);
		memberinfo.setType(type);
		
		
		try{
			memberService.updateByPrimaryKeySelective(memberinfo);
			strreturn = "success";
		} catch(Exception e){
	        System.out.println(e.getMessage());
		}
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}
	
	
	/**会员删除�
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/member_delete",method = RequestMethod.POST)
	@ResponseBody
	public String memberdelete(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String strreturn = "failed";
        
		request.setCharacterEncoding( "UTF-8" );
		response.setCharacterEncoding("utf-8"); 
		
		int intid = Integer.valueOf(request.getParameter("ID").trim());
		System.out.println(intid);
		try {  
			memberService.deleteByPrimaryKey(intid);	//
			strreturn = "success";
		} catch (Exception e) {  
	        System.out.println("catch");
		}
		
		Gson gson = new Gson();
		return gson.toJson(strreturn);
	}

}

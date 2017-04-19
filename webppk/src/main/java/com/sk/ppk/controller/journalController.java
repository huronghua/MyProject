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

import com.sk.ppk.model.Journal;
import com.sk.ppk.model.Member;
import com.sk.ppk.service.JournalService;

@Controller
public class journalController
{
	@Resource(name = "journalService")
	private JournalService journalService;
	/**
	 * 日志查詢�
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/get_journal", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map getjournal(HttpServletRequest request, HttpServletResponse response, Integer page, Integer rows)
			throws Exception
	{

		response.setContentType("text/javascript");
		response.setCharacterEncoding("utf-8");
		page = Integer.valueOf(request.getParameter("page"));
		String strpageindex = request.getParameter("page");
		String strpagesize = request.getParameter("rows");

		int startindex = (page - 1) * rows;

		Map pagemap = new HashMap();
		pagemap.put("page", startindex);
		pagemap.put("rows", rows);

		String user = "";
		if (request.getParameter("user") != null)
		{
			user = String.valueOf(request.getParameter("user"));
		}

		String operater = "";
		if (request.getParameter("operater") != null)
		{
			operater = String.valueOf(request.getParameter("operater"));
		}
		pagemap.put("user", user);
		pagemap.put("operater", operater);
		if(operater!="")
		{
			if(operater.equals("全部")){
		pagemap.put("operater", null);
		List<Journal> journal = journalService.selectTypejournalinfo(pagemap);
		Map map = new HashMap();
		map.put("rows", journal);
		map.put("total", journalService.selectTypeCount(pagemap));
		return map;
		}
			else{
				List<Journal> journal = journalService.selectTypejournalinfo(pagemap);
				Map map = new HashMap();
				map.put("rows", journal);
				map.put("total", journalService.selectTypeCount(pagemap));
				return map;				
			}
		}
		else{
			List<Journal> journal = journalService.selectAlljournalinfo(pagemap);
			Map map = new HashMap();
			map.put("rows",journal);
	        map.put("total", journalService.selectJournalCount(pagemap));
	        return map;
		}
	}
}

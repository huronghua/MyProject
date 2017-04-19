package com.sk.ppk.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sk.ppk.dao.JournalMapper;
import com.sk.ppk.model.Journal;
import com.sk.ppk.model.JournalVo;
import com.sk.ppk.model.Page;
import com.sk.ppk.model.Role;
import com.sk.ppk.model.RoleVo;
import com.sk.ppk.service.JournalService;
import com.sk.ppk.service.StyleinformationService;
import com.sk.ppk.model.Journal;

@Service("journalService")
public class JournalServiceImpl implements JournalService {
	@Autowired
	private JournalMapper journalMapper;

	public List<Journal> selectAlljournalinfo(Map pagemap)throws Exception
	{
	    return journalMapper.selectAlljournalinfo(pagemap);
	}

	@Override
	public int selectJournalCount(Map pagemap) throws Exception
	{
		return journalMapper.selectJournalCount(pagemap);
	}

	@Override
	public List<Journal> selectTypejournalinfo(Map pagemap) {
		return journalMapper.selectTypejournalinfo(pagemap);
	}

	@Override
	public int selectTypeCount(Map pagemap) {
		return journalMapper.selectTypeCount(pagemap);
	}

}
	

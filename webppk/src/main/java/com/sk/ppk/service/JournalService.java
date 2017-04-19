package com.sk.ppk.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sk.ppk.model.Journal;
import com.sk.ppk.model.Page;
import com.sk.ppk.model.Role;
import com.sk.ppk.model.RoleVo;
import com.sk.ppk.model.Styleinformation;

public interface JournalService
{
	/**查询所有操作
	 * @return
	 * @throws Exception
	 */
	public List<Journal> selectAlljournalinfo(Map pagemap)throws Exception;
		
	int selectJournalCount(Map pagemap)throws Exception;

	public List<Journal> selectTypejournalinfo(Map pagemap);

    int selectTypeCount(Map pagemap);

}

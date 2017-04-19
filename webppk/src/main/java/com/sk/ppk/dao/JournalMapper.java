package com.sk.ppk.dao;

import java.util.List;
import java.util.Map;

import com.sk.ppk.model.Journal;
import com.sk.ppk.model.JournalVo;
import com.sk.ppk.model.Page;
import com.sk.ppk.model.Role;
import com.sk.ppk.model.RoleVo;

public interface JournalMapper {

	int deleteByPrimaryKey(Integer id);

    int insert(Journal record);

    int insertSelective(Journal record);

    Journal selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Journal record);

    int updateByPrimaryKey(Journal record);
    
    Integer selectJournalCount(Map pagemap);
	
	Integer selectJournalCountByCondition(JournalVo journalVo);
	
	List<Journal> selectJournalByCondition(Map pagemap);
	
	List<Journal> selectAlljournalinfo(Map pagemap);
	
	public List<Journal> selectTypejournalinfo(Map pagemap);

    int selectTypeCount(Map pagemap);
}
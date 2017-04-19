package com.sk.ppk.dao;

import java.util.List;
import java.util.Map;

import com.sk.ppk.model.Member;

public interface MemberMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Member record);

    int insertSelective(Member record);

    Member selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Member record);

    int updateByPrimaryKey(Member record);
    
	List<Member> selectAllmemberinfo(Map pagemap);
	
	Integer selectAllCount(Map pagemap);
	
	List<Member> selectTypememberinfo(Map pagemap);

	Integer selectTypeCount(Map pagemap);
}
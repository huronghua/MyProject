package com.sk.ppk.service;

import java.util.List;
import java.util.Map;

import com.sk.ppk.model.Member;
import com.sk.ppk.model.User;

public interface MemberService {

	List<Member> selectAllmemberinfo(Map pagemap);

	Integer selectAllCount(Map pagemap);

	int deleteByPrimaryKey(int intid);

	Member selectByPrimaryKey(int intid);

	void updateByPrimaryKeySelective(Member memberinfo);

	List<Member> selectTypememberinfo(Map pagemap);

	Integer selectTypeCount(Map pagemap);

}

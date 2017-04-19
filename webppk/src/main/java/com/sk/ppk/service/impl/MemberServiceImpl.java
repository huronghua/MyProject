package com.sk.ppk.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sk.ppk.dao.MemberMapper;
import com.sk.ppk.dao.StyleinformationMapper;
import com.sk.ppk.model.Member;
import com.sk.ppk.model.User;
import com.sk.ppk.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper memberMapper;

	public MemberMapper getMemberMapper() {
		return memberMapper;
	}

	public void setMemberMapper(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public List<Member> selectAllmemberinfo(Map pagemap) {
		return memberMapper.selectAllmemberinfo(pagemap);
	}

	@Override
	public Integer selectAllCount(Map pagemap) {
		return memberMapper.selectAllCount(pagemap);
	}

	@Override
	public int deleteByPrimaryKey(int intid) {
		return memberMapper.deleteByPrimaryKey(intid);
	}

	@Override
	public Member selectByPrimaryKey(int intid) {
		return memberMapper.selectByPrimaryKey(intid);
	}

	@Override
	public void updateByPrimaryKeySelective(Member memberinfo) {
		
		memberMapper.updateByPrimaryKeySelective(memberinfo);
	}

	@Override
	public List<Member> selectTypememberinfo(Map pagemap) {
		return memberMapper.selectTypememberinfo(pagemap);
	}

	@Override
	public Integer selectTypeCount(Map pagemap) {
		return memberMapper.selectTypeCount(pagemap);
	}
	

}

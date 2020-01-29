package com.cookie.basic.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cookie.basic.member.MemberVO;
import com.cookie.basic.util.Pager;

@Service
public class AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	//관리자 회원리스트
	public List<MemberVO>adminMemberList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makePage(adminMapper.adminMemberCount(pager));
		
		return adminMapper.adminMemberList(pager);
	}
	
	//관리자가 개인회원탈퇴
	public int pmemberDelete(MemberVO memberVO)throws Exception{
		return adminMapper.pmemberDelete(memberVO);
	}
}
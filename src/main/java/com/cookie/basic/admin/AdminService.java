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
	
	//개인회원리스트
	public List<MemberVO>pmemberList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makePage(adminMapper.listCount(pager));
		pager.setGrade(1);
	
		return adminMapper.pmemberList(pager);
	}
	
	//사업자회원리스트
	public List<MemberVO>bmemberList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makePage(adminMapper.listCount(pager));
		pager.setGrade(8888);
		
		return adminMapper.bmemberList(pager);
	}
	
	//관리자가 개인회원탈퇴
	public int pmemberDelete(MemberVO memberVO)throws Exception{
		return adminMapper.pmemberDelete(memberVO);
	}
	
	
}

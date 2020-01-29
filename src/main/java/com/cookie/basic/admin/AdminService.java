package com.cookie.basic.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cookie.basic.member.MemberVO;
import com.cookie.basic.store.StoreCloseVO;
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
	
	//폐업업뎃
	public int storeAdminUpdate(StoreCloseVO storeCloseVO)throws Exception{
		 return adminMapper.storeAdminUpdate(storeCloseVO);
	}
	
	//회원넘버로 검색
	public MemberVO pmemberSearch(MemberVO memberVO) throws Exception{
		return adminMapper.pmemberSearch(memberVO);
	}

}

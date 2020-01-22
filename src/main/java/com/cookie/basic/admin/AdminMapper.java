package com.cookie.basic.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cookie.basic.member.MemberVO;
import com.cookie.basic.util.Pager;

@Repository
@Mapper
public interface AdminMapper {

	//개인회원 리스트
	public List<MemberVO>pmemberList(Pager pager)throws Exception;
		
	//개인회원리스트 카운트
	public int listCount(Pager pager)throws Exception;
	
	//사업자회원 리스트
	public List<MemberVO>bmemberList(Pager pager)throws Exception;
	
//	//사업자회원리스트 카운트
//	public int blistCount(Pager pager)throws Exception;

	//관리자가 개인회원탈퇴
	public int pmemberDelete(MemberVO memberVO)throws Exception;
	
	
}

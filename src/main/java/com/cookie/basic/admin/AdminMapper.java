package com.cookie.basic.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cookie.basic.member.MemberVO;
import com.cookie.basic.store.StoreCloseVO;
import com.cookie.basic.util.Pager;

@Repository
@Mapper
public interface AdminMapper {

	//관리자회원리스트
	public List<MemberVO>adminMemberList(Pager pager)throws Exception;
	
	//관리자회원카운트
	public int adminMemberCount(Pager pager)throws Exception;
	
	//관리자가 개인회원탈퇴
	public int pmemberDelete(MemberVO memberVO)throws Exception;
	
	//폐점 업데이트
	public int storeAdminUpdate(StoreCloseVO storeCloseVO)throws Exception;
	
}

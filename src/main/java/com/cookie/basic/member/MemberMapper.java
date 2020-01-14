package com.cookie.basic.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface MemberMapper {
	
	//회원가입
	public int memberJoin(MemberVO memberVO)throws Exception;
	
	//로그인
	public MemberVO memberLogin(MemberVO memberVO)throws Exception;
	
}

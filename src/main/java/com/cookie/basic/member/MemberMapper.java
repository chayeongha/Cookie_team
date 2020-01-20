package com.cookie.basic.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cookie.basic.util.Pager;


@Repository
@Mapper
public interface MemberMapper {
	
	//네이버 처음 회원가입
	public int naverJoin(MemberVO memberVO) throws Exception;
	
	//네이버 아이디 조회
	public MemberVO memberNaver(MemberVO memberVO) throws Exception;
	
	//카카오 처음 회원가입
	public int kakaoJoin(MemberVO memberVO) throws Exception;
		
	//카카오 아이디 조회
	public MemberVO memberKakao(MemberVO memberVO) throws Exception;
	
	//회원가입
	public int memberJoin(MemberVO memberVO)throws Exception;
	
	//로그인
	public MemberVO memberLogin(MemberVO memberVO)throws Exception;
	
	//id 중복검사
	public MemberVO memberIdCheck(MemberVO memberVO)throws Exception;
	
	//수정
	public int memberUpdate(MemberVO memberVO)throws Exception;
	
	//회원탈퇴
	public int memberDelete(MemberVO memberVO)throws Exception;
	
	//회원리스트
	public List<MemberVO> memberList(Pager pager)throws Exception;
	
}

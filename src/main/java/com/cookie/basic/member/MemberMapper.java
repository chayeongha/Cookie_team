package com.cookie.basic.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.aspectj.weaver.Member;
import org.springframework.stereotype.Repository;
import com.cookie.basic.store.StoreVO;
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
	
	//memNum찾아오기
	public MemberVO getMemNum(MemberVO memberVO)throws Exception;
	
	//로그인
	public MemberVO memberLogin(MemberVO memberVO)throws Exception;
	
	//id 중복 검사
	public MemberVO idCheck(MemberVO memberVO)throws Exception;
	
	//닉네임 중복검사
	public MemberVO nickCheck(MemberVO memberVO)throws Exception;
	
	//이메일 중복검사
	public MemberVO emailCheck(MemberVO memberVO)throws Exception;
	
	//연락처 중복검사
	public MemberVO phoneCheck(MemberVO memberVO)throws Exception;
	
	//연락처 중복검사2
	public MemberVO phoneCheck2(MemberVO memberVO)throws Exception;
		
	//수정
	public int memberUpdate(MemberVO memberVO)throws Exception;
	
	//마이페이지에서 회원 탈퇴 
	public int memberDelete(MemberVO memberVO)throws Exception;
	
	//아이디찾기: 입력한 이름과 휴대폰번호가 같은지
	public MemberVO idSearch(MemberVO memberVO)throws Exception;
	
	//아이디찾기: 문자인증완료후 아이디 나오는거 
	public String findId(MemberVO memberVO)throws Exception;
	
	//패스워드찾기: 입력한 아이디와 이메일이 같은지
	public MemberVO pwSearch(MemberVO memberVO)throws Exception;
	
	//패스워드찾기: 임시번호를  아이디와 이메일이 같은 회원의 비밀번호로 업데이트시켜준다.
	public int pwUpdate(MemberVO memberVO)throws Exception;
	
	//마이페이지 스토어소개 
	public List<StoreVO>sMiniList(StoreVO storeVO)throws Exception;
	
}

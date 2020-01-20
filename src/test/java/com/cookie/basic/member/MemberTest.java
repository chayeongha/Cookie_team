package com.cookie.basic.member;

import static org.junit.jupiter.api.Assertions.*;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
//@Transactional
class MemberTest {


	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private MemberFilesMapper MemberFilesMapper;
	
	//@Test
	void insertFilesTest()throws Exception{
		MemberFilesVO memberFilesVO= new MemberFilesVO();
		memberFilesVO.setFnum(1);
		//memberFilesVO.setId("t1");
		memberFilesVO.setFname("t1@@@.jpg");
		memberFilesVO.setOname("t1.jpg");
		
		int result = MemberFilesMapper.memberFilesInsert(memberFilesVO);
		
		assertEquals(1, result);
		
	}//성공
	
	//@Test
	void deleteTest( )throws Exception{
		MemberVO memberVO = new MemberVO();

		int result= memberMapper.memberDelete(memberVO);
		
		assertEquals(1, result);
		
	}//성공

	//@Test
	void insertTest() throws Exception{
		MemberVO memberVO= new MemberVO();

		memberVO.setPw("admin");
		memberVO.setName("admin");
		memberVO.setNickname("왕왕");
		memberVO.setPhone("111-1111-1111");
		memberVO.setGrade(9999);
		
		int result = memberMapper.memberJoin(memberVO);
		assertEquals(1, result);
		
	}//성공


}

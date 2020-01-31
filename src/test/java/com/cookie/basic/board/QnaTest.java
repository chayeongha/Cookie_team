package com.cookie.basic.board;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cookie.basic.board.qna.QnaMapper;
import com.cookie.basic.board.qna.QnaService;
import com.cookie.basic.board.qna.QnaVO;

@SpringBootTest

class QnaTest {

	@Autowired
	private QnaMapper qnaMapper;
	
	@Autowired
	private QnaService qnaSevice;
	
	//@Test
	void qnaWriteTest() throws Exception {
		QnaVO qnaVO = new QnaVO();
		qnaVO.setWriter("a");
		qnaVO.setContents("a");
		qnaVO.setSecret(3);
		
		System.out.println(qnaVO.getNum());
		
		int result = qnaMapper.qnaWrite(qnaVO);
	
		assertEquals(1, result);
	}
	
	@Test
	void qnaWriteTest2() throws Exception{
		
		
	}

}

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
	private QnaService qnaService;
	
	@Test
	void qnaWriteTest() throws Exception {
		int result = 0;
		
		for(int i=1;i<17;i++) {
			QnaVO qnaVO = new QnaVO();
			qnaVO.setWriter("abcdefg"+i);
			qnaVO.setContents("a"+i);
			qnaVO.setSecret(0);
			result = qnaService.qnaWrite(qnaVO);
		}
		
		//assertEquals(1, result);
	}

}

package com.cookie.basic.board;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cookie.basic.board.notice.NoticeMapper;
import com.cookie.basic.board.notice.NoticeVO;

@SpringBootTest
class NoticeTest {

	@Autowired
	private NoticeMapper noticeMapper;
	
	
	//@Test
	void noticeSelectTest() throws Exception {
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setNum(5);
		noticeVO = noticeMapper.noticeSelect(noticeVO);
		
		assertNotNull(noticeVO);
	}
	
	
	//@Test
	void noticeListTest() throws Exception {
		//List<NoticeVO> list = noticeMapper.noticeList();
		//assertNotEquals(0, list.size());
		
	}

	@Test
	void noticeWriteTest() throws Exception {
		for(int i=0;i<60;i++) {
			NoticeVO noticeVO = new NoticeVO();
			noticeVO.setTitle("title" +60+i);
			noticeVO.setWriter("writer"+i);
			noticeVO.setContents("contents"+i);
			
			noticeMapper.noticeWrite(noticeVO);
		}
	}
}

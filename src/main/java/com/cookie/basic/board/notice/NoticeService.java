package com.cookie.basic.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	public List<NoticeVO> noticeList() throws Exception {
		
		return noticeMapper.noticeList();
	}
}

package com.cookie.basic.board.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cookie.basic.util.Pager;

@Mapper
@Repository
public interface NoticeMapper {

	public int noticeWrite(NoticeVO noticeVO) throws Exception;
	
	public int noticeCount(Pager pager) throws Exception;
	
	public List<NoticeVO> noticeList(Pager pager) throws Exception;
	
	
}

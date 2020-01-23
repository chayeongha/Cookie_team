package com.cookie.basic.board.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cookie.basic.util.Pager;

@Mapper
@Repository
public interface NoticeMapper {

	//글 수정
	public int noticeUpdate(NoticeVO noticeVO) throws Exception;
	
	//글 하나 조회
	public NoticeVO noticeSelect(NoticeVO noticeVO) throws Exception;
	
	//글 생성
	public int noticeWrite(NoticeVO noticeVO) throws Exception;
	
	//전체 글 개수
	public int noticeCount(Pager pager) throws Exception;
	
	//리스트
	public List<NoticeVO> noticeList(Pager pager) throws Exception;
	
	
}

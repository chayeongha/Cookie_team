package com.cookie.basic.board.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cookie.basic.util.Pager;

@Mapper
@Repository
public interface ReviewMapper {

	//글 삭제
	public int noticeDelete(ReviewVO noticeVO) throws Exception;
	
	//글 수정
	public int noticeUpdate(ReviewVO noticeVO) throws Exception;
	
	//글 하나 조회
	public ReviewVO noticeSelect(ReviewVO noticeVO) throws Exception;
	
	//글 생성
	public int noticeWrite(ReviewVO noticeVO) throws Exception;
	
	//전체 글 개수
	public int noticeCount(Pager pager) throws Exception;
	
	//리스트
	public List<ReviewVO> noticeList(Pager pager) throws Exception;
	
	
}

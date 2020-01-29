package com.cookie.basic.board.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cookie.basic.util.Pager;

@Mapper
@Repository
public interface QnaMapper {

	//글 삭제
	public int noticeDelete(QnaVO noticeVO) throws Exception;
	
	//글 수정
	public int noticeUpdate(QnaVO noticeVO) throws Exception;
	
	//글 하나 조회
	public QnaVO noticeSelect(QnaVO noticeVO) throws Exception;
	
	//글 생성
	public int noticeWrite(QnaVO noticeVO) throws Exception;
	
	//전체 글 개수
	public int noticeCount(Pager pager) throws Exception;
	
	//리스트
	public List<QnaVO> noticeList(Pager pager) throws Exception;
	
	
}

package com.cookie.basic.board.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cookie.basic.util.Pager;

@Mapper
@Repository
public interface QnaMapper {

	//답변 삭제
	public int qnaAnswerDelete(QnaVO qnaVO) throws Exception;
	
	//문의,답변 구분
	public QnaVO qnaRefSelect(QnaVO qnaVO) throws Exception;
	
	//답변 여부
	public int qnaAnswerCheck(QnaVO qnaVO) throws Exception;
	
	//글 삭제
	public int qnaDelete(QnaVO qnaVO) throws Exception;
	
	//글 수정
	public int qnaUpdate(QnaVO qnaVO) throws Exception;
	
	//글 하나 조회
	public QnaVO qnaSelect(QnaVO qnaVO) throws Exception;
	
	//글 생성
	public int qnaWrite(QnaVO qnaVO) throws Exception;
	
	//Ref
	public int qnaRef(QnaVO qnaVO) throws Exception;
	
	//전체 글 개수
	public int qnaCount(Pager pager) throws Exception;
	
	//리스트
	public List<QnaVO> qnaList(Pager pager) throws Exception;
	
	
}

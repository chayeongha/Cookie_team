package com.cookie.basic.board.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface QnaFilesMapper {

	public List<QnaFilesVO> qnaFilesList(QnaFilesVO qnaFilesVO) throws Exception;
	
	public int qnaFilesDelete(QnaFilesVO qnaFilesVO) throws Exception;
	
	public QnaFilesVO qnaFilesSelect(QnaFilesVO qnaFilesVO) throws Exception;
	
	public int qnaFilesInsert(List<QnaFilesVO> qnaFilesVO) throws Exception;
}

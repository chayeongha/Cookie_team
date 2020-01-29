package com.cookie.basic.board.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface QnaFilesMapper {

	public List<QnaFilesVO> noticeFilesList(QnaFilesVO noticeFilesVO) throws Exception;
	
	public int noticeFilesDelete(QnaFilesVO noticeFilesVO) throws Exception;
	
	public QnaFilesVO noticeFilesSelect(QnaFilesVO noticeFilesVO) throws Exception;
	
	public int noticeFilesInsert(List<QnaFilesVO> noticeFilesVO) throws Exception;
}

package com.cookie.basic.board.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ReviewFilesMapper {

	public List<ReviewFilesVO> noticeFilesList(ReviewFilesVO noticeFilesVO) throws Exception;
	
	public int noticeFilesDelete(ReviewFilesVO noticeFilesVO) throws Exception;
	
	public ReviewFilesVO noticeFilesSelect(ReviewFilesVO noticeFilesVO) throws Exception;
	
	public int noticeFilesInsert(List<ReviewFilesVO> noticeFilesVO) throws Exception;
}

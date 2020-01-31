package com.cookie.basic.board.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ReviewFilesMapper {

	public List<ReviewFilesVO> reviewFilesList(ReviewFilesVO reviewFilesVO) throws Exception;
	
	public int reviewFilesDelete(ReviewFilesVO reviewFilesVO) throws Exception;
	
	public ReviewFilesVO reviewFilesSelect(ReviewFilesVO reviewFilesVO) throws Exception;
	
	public int reviewFilesInsert(List<ReviewFilesVO> reviewFilesVO) throws Exception;
}

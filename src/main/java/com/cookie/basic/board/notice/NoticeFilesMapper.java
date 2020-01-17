package com.cookie.basic.board.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface NoticeFilesMapper {

	public NoticeFilesVO noticeFileSelect(NoticeFilesVO noticeFilesVO) throws Exception;
	
	public int noticeFilesInsert(List<NoticeFilesVO> noticeFilesVO) throws Exception;
}

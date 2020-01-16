package com.cookie.basic.board.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface NoticeFilesMapper {
	
	public int noticeFilesInsert(List<NoticeFilesVO> noticeFilesVOs) throws Exception;
}

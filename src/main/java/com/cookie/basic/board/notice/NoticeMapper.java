package com.cookie.basic.board.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface NoticeMapper {

	public List<NoticeVO> noticeList() throws Exception;
}

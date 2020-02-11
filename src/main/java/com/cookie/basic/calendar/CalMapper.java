package com.cookie.basic.calendar;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CalMapper {
	
	//출석체크
	public int checkInsert(CalVO calVO)throws Exception;
	
	//출석 db가져오기
	public List<CalVO> getCheck(CalVO calVO)throws Exception;
}

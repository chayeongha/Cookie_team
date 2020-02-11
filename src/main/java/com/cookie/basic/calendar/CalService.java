package com.cookie.basic.calendar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalService {

	@Autowired
	private CalMapper calmapper;
	
	//출석체크
	public int checkInsert(CalVO calVO)throws Exception {
		return calmapper.checkInsert(calVO);
	}
	
	//출석 db가져오기
	public List<CalVO> getCheck(CalVO calVO)throws Exception{
		return calmapper.getCheck(calVO);
	}
	
	
}

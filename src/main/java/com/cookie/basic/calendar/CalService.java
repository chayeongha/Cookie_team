package com.cookie.basic.calendar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cookie.basic.member.MemberVO;

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
	
	//memCheck(출석여부) 가져오기
	public String getMemCheck(CalVO calVO)throws Exception{
		return calmapper.getMemCheck(calVO);
	}
	
	//출석할때마다 10포인트적립
	public MemberVO getmemPoint(MemberVO memberVO)throws Exception{
		return calmapper.getmemPoint(memberVO);
	}
	
	public int cpointUpdate(MemberVO memberVO)throws Exception{
		return calmapper.cpointUpdate(memberVO);
	}
	
}

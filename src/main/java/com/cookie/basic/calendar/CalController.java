package com.cookie.basic.calendar;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cookie.basic.member.MemberVO;

@Controller
@RequestMapping("/calendar/**")
public class CalController {
	
	@Autowired
	private CalService calService;
	
	//캘린더
	@GetMapping("calmain")
	public ModelAndView calmain(CalVO calVO, HttpSession session)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		//출석체크데이터를가져온 리스트
		MemberVO memberVO=(MemberVO) session.getAttribute("member");
		calVO.setMemNum(memberVO.getMemNum());

		List<CalVO>ar =calService.getCheck(calVO);
		
		CalVO calVO2 = new CalVO();
		calVO2.setMemNum(memberVO.getMemNum());
		String mcheck=calService.getMemCheck(calVO2);
		//System.out.println(mcheck);
		
		mv.addObject("mcheck", mcheck);
		mv.addObject("getCheck", ar);
		mv.setViewName("calendar/calmain");
		
		return mv;
	}
	
	//출석체크
	@GetMapping("checkInsert")
	public void checkInsert()throws Exception {
		
	}
	@ResponseBody
	@PostMapping("checkInsert")
	public String checkInsert(CalVO calVO)throws Exception {
		//ModelAndView mv = new ModelAndView();
		int result = calService.checkInsert(calVO);
	
		System.out.println(calVO.getCheckDate());
		
		String msg ="출석실패";
	
		if(result >0){
			msg="출석되었습니다.";	
		}
		
		//mv.addObject("msg", msg);
		//mv.addObject("path", "./calmain");
		//mv.setViewName("common/result");
		
		return msg;
	}
	
	/////test용//
	//멤버캘린더2
	@GetMapping("calmain2")
	public void calmain2()throws Exception {
		
	}
	
}

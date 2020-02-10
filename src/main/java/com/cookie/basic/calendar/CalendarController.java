package com.cookie.basic.calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calendar/**")
public class CalendarController {
	
	//멤버캘린더
	@GetMapping("calmain")
	public void mCalendar()throws Exception {
		
		
	}
}

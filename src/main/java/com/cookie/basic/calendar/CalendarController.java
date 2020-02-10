package com.cookie.basic.calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calendar/**")
public class CalendarController {
	
	//멤버캘린더
	@GetMapping("calmain")
	public void calmain()throws Exception {
		
		
	}
	
	//멤버캘린더2
	@GetMapping("calmain2")
	public void calmain2()throws Exception {
		
		
	}
	
}

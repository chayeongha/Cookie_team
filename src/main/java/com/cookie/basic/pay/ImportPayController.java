package com.cookie.basic.pay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/pay/**")
@Controller
public class ImportPayController {
	
	@GetMapping
	public void importPay() throws Exception{
		
	}
	
}

package com.cookie.basic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cookie.basic.store.StoreService;
import com.cookie.basic.store.StoreVO;

@Controller
public class HomeController {
	
	@Autowired
	private StoreService storeService;
	
	@GetMapping("/")
	public ModelAndView home() throws Exception {
		List<StoreVO> ar = storeService.storeMap();
		ModelAndView mv = new ModelAndView();
		mv.addObject("ar",ar);
		mv.setViewName("index");
		return mv;		
	}
	
}

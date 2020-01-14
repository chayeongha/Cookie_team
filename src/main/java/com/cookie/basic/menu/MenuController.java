package com.cookie.basic.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/menu/**")
public class MenuController {

	@Autowired
	private MenuService menuService;
	
	@GetMapping("menuInsert")
	public String menuInsert()throws Exception{
		return "menu/menuInsert";
	}
	
	@PostMapping("menuInsert")
	public ModelAndView menuInsert(MenuVO menuVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = menuService.menuInsert(menuVO);
		
		String message="Insert fail";
		String path="../";
		if(result>0) {
			message="Insert Success";
		}
		mv.setViewName("common/result");
		mv.addObject("msg", message);
		mv.addObject("path", path);
		return mv;
	}
	
	
	
}

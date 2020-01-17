package com.cookie.basic.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/menu/**")
public class MenuController {

	@Autowired
	private MenuService menuService;
	
	
	//초기 메뉴 선택
	@GetMapping("menuPreset")
	public void menuPreset() throws Exception{
		
	}
	//Insert
	@GetMapping("menuInsert")
	public String menuInsert()throws Exception{
		return "menu/menuInsert";
	}
	
	@PostMapping("menuInsert")
	public ModelAndView menuInsert(MenuVO menuVO,  List<MultipartFile> files, String [] opto, String[] optName, String[] optPrice)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		int result = menuService.menuInsert(menuVO, files, opto, optName, optPrice);
		String message="Insert fail";
		String path=".	/menuList";
		if(result>0) {
			message="Insert Success";
		}
		mv.setViewName("common/result");
		mv.addObject("msg", message);
		mv.addObject("path", path);
		return mv;
	}
	
	//List
	@GetMapping("menuList")
	public ModelAndView menuList()throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MenuVO> ar = menuService.menuList();
		
		mv.addObject("lists", ar);
		mv.setViewName("menu/menuList");
		
		
		return mv;
		
	}
	
	//selectOne
	@GetMapping("menuSelect")
	public ModelAndView menuSelet(MenuVO menuVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		menuVO = menuService.menuSelect(menuVO);
		mv.addObject("vo", menuVO);
		mv.setViewName("menu/menuSelect");
		
		return mv;
	}
	
	
	
}

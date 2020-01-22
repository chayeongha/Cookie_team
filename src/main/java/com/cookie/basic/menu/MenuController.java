package com.cookie.basic.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//초기 메뉴 선택
		@PostMapping("menuPreset")
		public ModelAndView menuPreset(String [] menuP, MenuVO menuVO) throws Exception{
			ModelAndView mv = new ModelAndView();
			int result = menuService.menuPreset(menuVO, menuP);
			String message="Insert fail";
			String path="./menuList?ssNum="+menuVO.getSsNum();
			if(result>0) {
				message="Insert Success";
			}
			mv.setViewName("common/result");
			mv.addObject("msg", message);
			mv.addObject("path", path);
			return mv;
			
			
		}
		
		
		
	//Insert
	@GetMapping("menuInsert")
	public String menuInsert()throws Exception{
		return "menu/menuInsert";
	}
	
	@PostMapping("menuInsert")
	public ModelAndView menuInsert(MenuVO menuVO,  MultipartFile files, String [] opto, String[] optName, String[] optPrice)throws Exception{
		
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
	public ModelAndView menuList(MenuVO menuVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MenuVO> ar = menuService.menuList(menuVO);
		
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
	
	//Update
	@GetMapping("menuUpdate")
	public String menuUpdate(MenuVO menuVO, Model model)throws Exception{
		menuVO = menuService.menuSelect(menuVO);
		System.out.println(menuVO.getSsNum());
		System.out.println(menuVO.getMmTemp());
		System.out.println(menuVO.getMmName());
		System.out.println(menuVO.getSsNum());
		model.addAttribute("vo", menuVO);
		return "menu/menuUpdate";
	}
	
	@PostMapping("menuUpdate")
	public ModelAndView menuUpdate(MenuVO menuVO, MultipartFile files,  String[] optName2, String[] optPrice2, String[] optNum2,String[] optName, String[] optPrice)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println(menuVO.getSsNum());
		int result = menuService.menuUpdate(menuVO, files, optName2, optPrice2, optNum2,optName, optPrice);
		String message="Insert fail";
		String path="./menuList?ssNum="+menuVO.getSsNum();
		if(result>0) {
			message="Insert Success";
		}
		mv.setViewName("common/result");
		mv.addObject("msg", message);
		mv.addObject("path", path);
		return mv;
		
	}
	
	//Delete
	@PostMapping("moptDelete")
	public ModelAndView moptDelete(MoptVO moptVO, String[] optnum)throws Exception{
		ModelAndView mv = new ModelAndView();
		int check=0;
		
		int result =0;
		
		for(String string : optnum) {
			
			moptVO.setOptNum(Integer.parseInt(string));
			check = menuService.moptDelete(moptVO);
			Thread.sleep(200);
			if(check==1) {
				result++;
			}
		}
		if(result == optnum.length) {
			result =1;
		}
		
			
		String path="./menuUpdate?mmNum="+moptVO.getMmNum();
		mv.setViewName("common/result2");
		
		mv.addObject("path", path);
		return mv;
	
		
	}
}

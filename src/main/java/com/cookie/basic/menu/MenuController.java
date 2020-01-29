package com.cookie.basic.menu;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
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
	public String menuInsert(Model model)throws Exception{
		MenuVO menuVO = new MenuVO();
		model.addAttribute("menuVO", menuVO);
		
		return "menu/menuInsert";
	}
	
	@PostMapping("menuInsert")
	public ModelAndView menuInsert(@Valid MenuVO menuVO,BindingResult bindingResult, MultipartFile files, String [] opto, String[] optName, String[] optPrice)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		if(bindingResult.hasErrors()) {
			mv.addObject("menuVO", menuVO);
			mv.setViewName("menu/menuInsert");
			List<ObjectError> err = bindingResult.getAllErrors();
			for (int i = 0; i < err.size(); i++) {
				System.out.println(err.get(i).toString());
			}
		}else {
		
		int result = menuService.menuInsert(menuVO, files, opto, optName, optPrice);
		String message="Insert fail";
		String path=".	/menuList?ssNum="+menuVO.getSsNum();
		if(result>0) {
			message="Insert Success";
		}
		mv.setViewName("common/result");
		mv.addObject("msg", message);
		mv.addObject("path", path);
	}
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
		//System.out.println(menuVO.getSsNum());
		//System.out.println(menuVO.getMmTemp());
		//System.out.println(menuVO.getMmName());
		//System.out.println(menuVO.getSsNum());
		model.addAttribute("vo", menuVO);
		return "menu/menuUpdate";
	}
	
	@PostMapping("menuUpdate")
	public ModelAndView menuUpdate(MenuVO menuVO, MultipartFile files,  String[] optName2, String[] optPrice2, String[] optNum2,String[] optName, String[] optPrice)throws Exception{
		ModelAndView mv = new ModelAndView();
		menuVO.setSsNum(menuService.menuSelect(menuVO).getSsNum());
		
		//System.out.println(menuVO.getSsNum());
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
	
	//옵션 Delete
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
	
	//메뉴 Delete
	@PostMapping("menuDelete")
	public ModelAndView menuDelete(MenuVO menuVO, String ssNum, String mmNum)throws Exception{
		ModelAndView mv = new ModelAndView();
		menuVO.setSsNum(Integer.parseInt(ssNum));
		menuVO.setMmNum(Integer.parseInt(mmNum));
		int result = menuService.menuDelete(menuVO);
		String message="Delete fail";
		String path="./menuList?ssNum="+menuVO.getSsNum();
		if(result>0) {
			message="Delete Success";
		}
		mv.setViewName("common/result2");
		mv.addObject("msg", message);
		mv.addObject("path", path);
		return mv;
		
		
		
	}
}

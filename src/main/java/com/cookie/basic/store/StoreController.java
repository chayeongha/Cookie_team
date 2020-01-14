package com.cookie.basic.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/store/**")
public class StoreController {

	@Autowired
	private StoreService storeService;

	// 지점 등록 폼
	@GetMapping("storeInsert")
	public void storeInsert() throws Exception {

	}

	// 지점 등록
	@PostMapping("storeInsert")
	public ModelAndView storeInsert(StoreVO storeVO, MultipartFile files) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = storeService.storeInsert(storeVO, files);
		String message = "등록 성공";
		String path = "../";
		mv.addObject("msg", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");

		return mv;
	}

	// 점주 페이지
	@GetMapping("storeMyPage")
	public void storeMyPage() throws Exception {

	}

	// 점주 업데이트 폼
	@GetMapping("storeUpdate")
	public void storeUpdate() throws Exception {

	}

	// 점주 정보 업데이트
	@PostMapping("storeUpdate")
	public void storeUpdate(StoreVO storeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = storeService.storeUpdate(storeVO);
		String message = "업데이트 성공";
		String path = "../";
		mv.addObject("msg", message);
		mv.addObject("path", path);
		mv.addObject("store", storeVO);
		mv.setViewName("common/result");
	}

}

package com.cookie.basic.store;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cookie.basic.member.MemberVO;

@Controller
@RequestMapping("/store/**")
public class StoreController {

	@Autowired
	private StoreService storeService;

	// 지점 등록 폼
	@GetMapping("storeInsert")
	public void storeInsert(HttpSession session) throws Exception {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		session.setAttribute("member", memberVO);

	}

	// 지점 등록
	@PostMapping("storeInsert")
	public ModelAndView storeInsert(StoreVO storeVO, MultipartFile files, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = storeService.storeInsert(storeVO, files);
		String message = "등록 실패! 자세한 문의는 전화주세요";
		String path = "../";
		if (result > 0) {
			message = "등록 성공!";
			path = "../";
			session.setAttribute("store", storeVO);
		}

		mv.addObject("msg", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");

		return mv;
	}

	// 매장 리스트
	@GetMapping("myInfo")
	public ModelAndView myInfo(StoreVO storeVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		storeVO.setId(memberVO.getId());

		System.out.println(storeVO.getId());

		List<StoreVO> ar = storeService.searchInfo(storeVO);

		System.out.println(storeVO.getId());
		System.out.println(ar.get(0).getsName());

		mv.addObject("list", ar);
		mv.setViewName("store/myInfo");

		return mv;
	}

	// 매장상세정보
	@GetMapping("myinfoS")
	public ModelAndView myInfoS(StoreVO storeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		storeVO = storeService.info(storeVO);
		mv.addObject("store", storeVO);
		
		return mv;
	}

	// 점주 페이지
	@GetMapping("storeMyPage")
	public void storeMyPage() throws Exception {

	}

	// 점주 업데이트 폼

	@GetMapping("storeUpdate")
	public ModelAndView storeUpdate(StoreVO storeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		storeVO = storeService.info(storeVO);
		System.out.println(storeVO.getsName());
		
		mv.addObject("store", storeVO);
		mv.setViewName("store/storeUpdate");
		
		return mv;

	}

	// 점주 정보 업데이트
	@PostMapping("storeUpdate")
	public ModelAndView storeUpdate(StoreVO storeVO, HttpSession session) throws Exception {

		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		session.setAttribute("member", memberVO);
		ModelAndView mv = new ModelAndView();
		int result = storeService.storeUpdate(storeVO);

		String msg = "업데이트 실패";
		String path = "../";
		if (result > 0) {
			msg = "업데이트 성공";
			path = "../";
		}
		mv.addObject("store", storeVO);
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/result");

		return mv;
	}

}

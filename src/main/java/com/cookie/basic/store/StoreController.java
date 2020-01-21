package com.cookie.basic.store;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
			path = "../menu/menuPreset";
			session.setAttribute("store", storeVO);
		}

		mv.addObject("msg", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");

		return mv;
	}

	// 매장 리스트
	@GetMapping("myInfo")
	public ModelAndView searchInfo(StoreVO storeVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		 storeVO.setMemNum(memberVO.getMemNum());

		List<StoreVO> ar = storeService.searchInfo(storeVO);

		/*
		 * System.out.println(ar.get(0).getsNum());
		 * 
		 * for (StoreVO storeVO2 : ar) { StoreFilesVO storeFilesVO = new StoreFilesVO();
		 * storeFilesVO.setsNum(storeVO2.getsNum()); storeFilesVO =
		 * (StoreFilesVO)storeService.storeFilesSelect(storeFilesVO);
		 * ar2.add(storeFilesVO); System.out.println(storeFilesVO.getfName());
		 * System.out.println(storeFilesVO.getoName()); }
		 */

		mv.addObject("list", ar);
		mv.setViewName("store/myInfo");

		return mv;
	}

	// 매장상세정보//Pos 작동 (ON)
	@GetMapping("myinfoS")
	public ModelAndView myInfoS(StoreVO storeVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		storeVO = storeService.info(storeVO);

		mv.addObject("store", storeVO);

		return mv;
	}

	@PostMapping("myinfoS")
	public ModelAndView myInfoS(StoreVO storeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		storeVO.getsNum();
		int result = storeService.onUpdate(storeVO);
		System.out.println(storeVO.getsNum());

		String msg = "업데이트 실패";
		String path = "../";
		if (result > 0) {
			msg = "영업시작";
			path = "./storeMyPage?sNum=" + storeVO.getsNum();
		}
		mv.addObject("store", storeVO);
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/result");

		return mv;
	}

	// 점주 페이지
	@GetMapping("storeMyPage")
	public void storeMyPage(StoreVO storeVO, Model model) throws Exception {
		model.addAttribute("store", storeVO);
	}

	@PostMapping("storeMyPage")
	public ModelAndView storeMyPage(StoreVO storeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		storeVO.getsNum();
		int result = storeService.offUpdate(storeVO);
		System.out.println(storeVO.getsNum());
		String msg = "업데이트 실패";
		String path = "../";
		if (result > 0) {
			msg = "영업종료";
			path = "./myInfo";
		}
		mv.addObject("store", storeVO);
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/result");

		return mv;

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
	public ModelAndView storeUpdate(StoreVO storeVO, HttpSession session, MultipartFile files) throws Exception {

		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		session.setAttribute("member", memberVO);
		ModelAndView mv = new ModelAndView();
		int result = storeService.storeUpdate(storeVO,files);

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

	// 매장 아이디 중복 체크 페이지
	@ResponseBody
	@PostMapping("checkStore")
	public int checkStore(StoreVO storeVO) throws Exception {
		//System.out.println(storeVO.getsName());
		
		//sName 모든 공백 제거
		String sName = storeVO.getsName();
		sName = sName.replaceAll(" ", "");
		sName = sName.replaceAll("\\p{Z}", "");
		
		//System.out.println(sName);
		
		storeVO.setsName(sName);
		
		int result = storeService.checkStore(storeVO);

		if (result > 0) {
			System.out.println("중복");
		} else {
			System.out.println("사용가능");
		}
		
		return result;
	}

}

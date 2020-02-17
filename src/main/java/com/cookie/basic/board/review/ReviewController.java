package com.cookie.basic.board.review;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cookie.basic.cart.OrderListVO;
import com.cookie.basic.member.MemberVO;
import com.cookie.basic.store.StoreVO;
import com.cookie.basic.util.Pager;

@Controller
@RequestMapping("/review/**")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	/////////////////////////////////////////////////////////////
	
	//글 삭제
	@GetMapping("reviewDelete")
	public ModelAndView reviewDelete(ReviewVO reviewVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = reviewService.reviewDelete(reviewVO);
		
		String msg = "Delete Fail";
		
		if(result>0) {
			msg = "Delete Success";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("path", "../member/memberMypage");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	//글 수정 폼
	@GetMapping("reviewUpdate")
	public void reviewUpdate(OrderListVO orderListVO, StoreVO storeVO, ReviewVO reviewVO, Model model, HttpSession session) throws Exception {
		System.out.println("들어왔니?");
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		orderListVO = reviewService.orderSelect(orderListVO);
		storeVO = reviewService.snameSelect(storeVO);
		reviewVO = reviewService.reviewSelect(reviewVO);
		
		model.addAttribute("order", orderListVO);
		model.addAttribute("store", storeVO);
		model.addAttribute("writer", memberVO.getNickname());
		model.addAttribute("update", reviewVO);
	}
	
	//글 수정
	@PostMapping("reviewUpdate")
	@ResponseBody
	public int reviewUpdate(ReviewVO reviewVO, MultipartFile[] files, int[] fnums) throws Exception{
		int result = reviewService.reviewUpdate(reviewVO, files, fnums);
		
		return result;
	}
	
	//글 작성 폼
	@GetMapping("reviewWrite")
	public void reviewWrite(OrderListVO orderListVO, StoreVO storeVO, Model model, HttpSession session) throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		orderListVO = reviewService.orderSelect(orderListVO);
		storeVO = reviewService.snameSelect(storeVO);
		System.out.println(storeVO.getStoreFilesVO().getfName());
		
		model.addAttribute("order", orderListVO);
		model.addAttribute("store", storeVO);
		model.addAttribute("writer", memberVO.getNickname());
	}
	
	//글 등록
	@PostMapping("reviewWrite")
	@ResponseBody
	public int reviewWrite(ReviewVO reviewVO, MultipartFile[] files) throws Exception {
		
		int result = reviewService.reviewWrite(reviewVO, files);
		
		return result;
	}
	
	//글 하나 조회
	@GetMapping("reviewSelect")
	public ModelAndView noticeSelect(ReviewVO reviewVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		reviewVO = reviewService.reviewSelect(reviewVO);
		//System.out.println(noticeVO.getNoticeFilesVO().get(0).getFnum());
		
//		System.out.println(noticeVO.getNum());
//		System.out.println(noticeVO.getNext());
//		System.out.println(noticeVO.getNextT());
//		System.out.println(noticeVO.getPrev());
//		System.out.println(noticeVO.getPrevT());
		
		if(reviewVO != null) {
			mv.addObject("select", reviewVO);
			mv.addObject("boardName", "이용후기");
			mv.setViewName("board/boardSelect");
		}
		
		return mv;
	}
	
	//리스트
	@GetMapping("reviewList")
	public void reviewList(Pager pager, Model model) throws Exception {
		List<ReviewVO> list = reviewService.reviewList(pager);
		
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		
	}
	
}

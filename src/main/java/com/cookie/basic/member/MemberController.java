package com.cookie.basic.member;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cookie.basic.util.Pager;

import net.bytebuddy.asm.Advice.Return;



@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("memberIndex")
	public void memberIndex()throws Exception{
		
	}
	
	//가입 선택 
	@GetMapping("selectJoin")
	public void selectJoin(MemberVO memberVO)throws Exception{
			
	}
	
	//getMemberVO
	@ModelAttribute
	public MemberVO getMemberVO()throws Exception{
	
		return new MemberVO();	
	}

	//회원가입
	@GetMapping("memberJoin")
	public ModelAndView memberJoin(String grade , String kind)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int grade2=Integer.parseInt(grade);
		mv.addObject("grade", grade2);
		mv.addObject("kind", kind);
		mv.setViewName("member/memberJoin");
		return mv;
		
		
	}
	
	@PostMapping("memberJoin")							
	public ModelAndView memberJoin(@Valid MemberVO memberVO,BindingResult bindingResult, MultipartFile files)throws Exception {
		
		ModelAndView mv= new ModelAndView();
		
		if(memberService.memberJoinValidate(memberVO, bindingResult)) {
			
			mv.setViewName("member/memberJoin");
		}else {
			
			String msg = "회원가입 실패";
			String path ="./memberIndex";
			int result= memberService.memberJoin(memberVO, files);
			
			if(result >0) {
				
				msg="회원가입 성공";
			}
			
			
			mv.addObject("path", path);
			mv.addObject("msg", msg);
			
			mv.setViewName("common/result");
			
		}
		
		return mv;
	}
	
	
	//로그아웃
	@GetMapping("memberLogout")
	public ModelAndView memberLogout(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		
		String msg= "로그아웃";
		String path="./memberIndex";
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		
		return mv;
	}
	
	
	//로그인
	@GetMapping("memberLogin")
	public void memberLogin()throws Exception {
	
	}
	
	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		memberVO=memberService.memberLogin(memberVO);
		
		String msg="로그인 실패!!";
		String path="./memberIndex";
		
		if(memberVO != null) {
			msg="로그인 성공!!";
			session.setAttribute("member", memberVO);
		}
		
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		
		return mv;
		
	}
	
	//마이페이지
	@ GetMapping("memberMypage")
	public void memberMypage() throws Exception{
		
	}
	
	//수정
	@GetMapping("memberUpdate")
	public void memberUpdate(HttpSession session)throws Exception{
		
	}
	
	@PostMapping("memberUpdate")
	public ModelAndView memberUpdate(MemberVO memberVO, MultipartFile files, HttpSession session)throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.memberUpdate(memberVO,files);
		
		String msg="실패";
		
		if(result>0) {
			memberVO=memberService.memberLogin(memberVO);
			session.setAttribute("member", memberVO);
			msg="성공";
		}
			mv.addObject("msg", msg);
			mv.addObject("path","./memberMypage");
			mv.setViewName("common/result");
		
		
		return mv;
	}
	
	//회원 탈퇴
	@GetMapping("memberDelete")
	public ModelAndView memberDelete(MemberVO memberVO, HttpSession session)throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int result =memberService.memberDelete(memberVO);
		
		String msg = "0";
		if (result>0) {
			msg = "1";
			session.invalidate();
		}

		mv.addObject("msg", msg);
		mv.setViewName("common/ajax_result");
		
		return mv;
		}
	
		//회원 리스트
//		@GetMapping("memberList")
//		public ModelAndView memberList(Pager pager)throws Exception{
//			
//			ModelAndView mv = new ModelAndView();
//			List<MemberVO> ar = memberService.memberList(pager);
//			
//			mv.addObject("pager", pager);
//			mv.addObject("list", ar);
//			
//			mv.setViewName("member/memberList");
//			
//			return mv;
//		}
	
	
	
	
}
	
	
	
	


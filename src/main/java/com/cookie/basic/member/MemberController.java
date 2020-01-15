package com.cookie.basic.member;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cookie.basic.store.StoreVO;

import net.bytebuddy.asm.Advice.Return;



@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	
	//가입 선택 
	@GetMapping("selectJoin")
	public void selectJoin(MemberVO memberVO)throws Exception{
			
	}
	
	//회원가입
	@RequestMapping(value = "memberJoin", method = RequestMethod.GET)
	public ModelAndView privateJoin(MemberVO memberVO)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("grade", memberVO.getGrade());
		mv.setViewName("member/memberJoin");
		return mv;
	}
	
	@PostMapping("memberJoin")							
	public ModelAndView memberJoin(MemberVO memberVO, MultipartFile files)throws Exception {
		
		ModelAndView mv= new ModelAndView();
		
		
		String msg = "회원가입 실패";
		String path ="../";
		int result= memberService.memberJoin(memberVO, files);
		
		if(result >0) {
			
			msg="회원가입 성공";
		}
		
		
		mv.addObject("path", path);
		mv.addObject("msg", msg);
		
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
		
		String msg="틀렸는뒈?";
		String path="../";
		
		if(memberVO != null) {
			msg="로그인 성공!!";
			session.setAttribute("member", memberVO);
		}
		
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		
		return mv;
		
	}
	
	
}

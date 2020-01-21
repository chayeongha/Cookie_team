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


import com.cookie.basic.store.StoreVO;

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
	
	@GetMapping("memberNaver")
	public String memberNaver(String name) throws Exception{

		return "member/memberNaver";
	}
	
	@PostMapping("memberKakao")
	public String memberKakao(HttpSession session,String nickname,String email) throws Exception{
		MemberVO memberVO = new MemberVO();

		memberVO.setMemId(email);
		memberVO = memberService.memberKakao(memberVO);
		
		if(memberVO == null) {
			System.out.println("hi");
			MemberVO memberVO2 = new MemberVO();
			memberVO2.setMemId(email);
			memberVO2.setName(nickname);
			memberVO2.setNickname(nickname);
			int result= memberService.kakaoJoin(memberVO2);
			session.setAttribute("member", memberVO2);
			System.out.println(result);
		}else {
		session.setAttribute("member", memberVO);
		}
		return "redirect:../";
		
	}
	
	@PostMapping("memberNaver")
	public String memberNaver(HttpSession session, String email, String nickname,String name) throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setMemId(email);
		memberVO = memberService.memberNaver(memberVO);
		if(name==null) {
			name=nickname;
		}

		if(memberVO == null) {
			MemberVO memberVO2 = new MemberVO();
			memberVO2.setMemId(email);
			memberVO2.setName(name);
			memberVO2.setNickname(nickname);
			int result= memberService.naverJoin(memberVO2);
			session.setAttribute("member", memberVO2);

		}else {
		session.setAttribute("member", memberVO);
		}
		return "../";
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
	
	//마이페이지에서 회원이 탈퇴하는것. 
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
	
	//관리자가 개인회원탈퇴시키는것.
	@PostMapping("pmemberDelete")
	public ModelAndView pmemberDelete(MemberVO memberVO, String [] num)throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int check=0;
		
		int result=0;
		
		for (String string : num) {
			memberVO.setMemNum(Integer.parseInt(string));
			check= memberService.pmemberDelete(memberVO);
			Thread.sleep(200);
			if(check ==1) {
					result++;
			}
		}
		
		if(result == num.length) {
			
			 result =1;
		}
		
		mv.addObject("msg", result);
		
		mv.setViewName("common/ajax_result");
		
		return mv;
		}
	
		//개인회원 리스트
		@GetMapping("pmemberList")
		public ModelAndView pmemberList(Pager pager)throws Exception{
			
			ModelAndView mv = new ModelAndView();
			
			List<MemberVO> ar = memberService.pmemberList(pager);
			
			mv.addObject("pager", pager);
			mv.addObject("pmemberList", ar);
			
			mv.setViewName("member/pmemberList");
			
			return mv;
		}
		
		//사업자회원리스트
		@GetMapping("bmemberList")
		public ModelAndView bmemberList(Pager pager)throws Exception{
			
			ModelAndView mv = new ModelAndView();
			
			List<MemberVO> ar = memberService.bmemberList(pager);
			
			mv.addObject("pager", pager);
			mv.addObject("bmemberList", ar);
			
			mv.setViewName("member/bmemberList");
			
			return mv;
		}
	
		
		
	
	
	
}
	
	
	
	


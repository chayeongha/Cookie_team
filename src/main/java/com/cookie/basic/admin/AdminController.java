package com.cookie.basic.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cookie.basic.member.MemberVO;
import com.cookie.basic.util.Pager;

@Controller
@RequestMapping("/admin/**")
public class AdminController {
		
	@Autowired
	private AdminService adminService;
	
	//어드민메인페이지
	@GetMapping("adminMain")
	public void adminMain() throws Exception{
			
	}
	
	//어드민멤버리스트페이지
	@GetMapping("adminMemberList")
	public ModelAndView adminMemberList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<MemberVO> ar = adminService.pmemberList(pager);
		List<MemberVO> ar2 = adminService.bmemberList(pager);
		mv.addObject("pager", pager);
		
		mv.addObject("pmemberList", ar);
		mv.addObject("bmemberList", ar2);
		mv.setViewName("admin/adminMemberList");
		
		return mv;
	}
	
	//개인회원 리스트
	@GetMapping("pmemberList")
	public ModelAndView pmemberList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
			
		List<MemberVO> ar = adminService.pmemberList(pager);
			
		mv.addObject("pager", pager);
		mv.addObject("pmemberList", ar);
		mv.setViewName("admin/pmemberList");
			
		return mv;
	}
	
	//사업자회원리스트
	@GetMapping("bmemberList")
	public ModelAndView bmemberList(Pager pager)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<MemberVO> ar2 = adminService.bmemberList(pager);
		
		mv.addObject("pager", pager);
		mv.addObject("bmemberList", ar2);
		
		mv.setViewName("admin/bmemberList");
		
		return mv;
	}
	
	//관리자가 회원탈퇴시키는것.
	@PostMapping("pmemberDelete")
	public ModelAndView pmemberDelete(MemberVO memberVO, String [] num)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int check=0;
		
		int result=0;
		
		for (String string : num) {
			memberVO.setMemNum(Integer.parseInt(string));
			check= adminService.pmemberDelete(memberVO);
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
	
	
}

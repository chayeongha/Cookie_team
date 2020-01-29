package com.cookie.basic.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cookie.basic.member.MemberVO;
import com.cookie.basic.store.StoreCloseVO;
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
	public  ModelAndView adminMemberList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<MemberVO> ar = adminService.adminMemberList(pager);
			String gname=null;
		if(pager.getGrade()==1) {
			gname="개인";
		}else if(pager.getGrade()==8888){
			gname="사업자";
		}
		mv.addObject("gname", gname);
		mv.addObject("pager", pager);
		mv.addObject("memberSize", ar.size());
		mv.addObject("memberList", ar);
		mv.setViewName("admin/adminMemberList");
			
		return mv;
	}
	
	//회원탈퇴
	@GetMapping("pmemberDelete")
	public ModelAndView pmemberDelete(MemberVO memberVO)throws Exception{
		ModelAndView mv= new ModelAndView();
		adminService.pmemberDelete(memberVO);
		mv.setViewName("redirect:./adminMemberList");
		return mv;
		
	}
	
	//업데이트
	@GetMapping("storeAdminUpdate")
	public ModelAndView storeAdminUpdate(StoreCloseVO storeCloseVO)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = adminService.storeAdminUpdate(storeCloseVO);
		
		String msg = "승인 실패!";
		String path = "./";
		if (result > 0) {
			msg = "승인 성공!";
			path = "./adminMain";
		}
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		return mv;
		
	}
	
	
	
}

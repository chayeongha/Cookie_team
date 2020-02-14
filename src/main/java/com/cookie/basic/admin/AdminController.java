package com.cookie.basic.admin;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cookie.basic.cart.OrderListVO;
import com.cookie.basic.member.MemberVO;
import com.cookie.basic.orders.OrdersVO;
import com.cookie.basic.store.StoreCloseVO;
import com.cookie.basic.util.Pager;

@Controller
@RequestMapping("/admin/**")
public class AdminController {
		
	@Autowired
	private AdminService adminService;
	
	//어드민메인페이지
	@GetMapping("adminMain")
	public Model adminMain(OrderListVO orderListVO,Model model) throws Exception{
	
		//월 포맷
		DateFormat df = new SimpleDateFormat("yyyy-MM");
	
		Date today = new  Date();
	
		String thisMonth=df.format(today);
		//System.out.println(thisMonth);
	
		//월 보내기
		String month= thisMonth.split("-")[1];
		//System.out.println(month);
		
		//년 보내기
		String cYear= thisMonth.split("-")[0];
		//System.out.println(cYear);
		
		//연 포맷
		DateFormat df2 = new SimpleDateFormat("yyyy");
		
		Date year = new  Date();
		
		String thisYear=df2.format(year);
		//System.out.println(thisYear);
		
		List<String>monthar = new ArrayList<String>();
		List<String>mEarnar = new ArrayList<String>();
		for(int i=0;i<12;i++) {
			if(i+1 <10) {
				String thisMonth2=thisYear+"-0"+(i+1);
				String monthEarn2=adminService.monthEarn(thisMonth2);
				//System.out.println("test:"+thisMonth2);	
				//System.out.println(monthEarn2);
				monthar.add(thisMonth2);
				mEarnar.add(monthEarn2);
			}else if(10<=i+1) {
				String thisMonth2=thisYear+"-"+Integer.toString(i+1);
				String monthEarn2=adminService.monthEarn(thisMonth2);
				//System.out.println("else:"+thisMonth2);
				//System.out.println(monthEarn2);
				monthar.add(thisMonth2);
				mEarnar.add(monthEarn2);
			}
		}
		
		for(int i=0;i<monthar.size();i++) {
			System.out.println(monthar.get(i));
		}
		
//		for (String string : monthar) {
//			System.out.println(monthar);
//			
//		}
		
		//System.out.println(monthar);
		//System.out.println(mEarnar);
		
		//주문건 카운트
		int orderCount	= adminService.orderCount(orderListVO);
		//System.out.println(orderCount);	
	 
		//포맷한 데이트들을 메서드에 넣어서 jsp로 보냄.
		
		//월매출
		int mEarn=Integer.parseInt(adminService.monthEarn(thisMonth));
		//System.out.println(mEarn);
		
		//연매출
		int yEarn=Integer.parseInt(adminService.yearEarn(thisYear));
		//System.out.println(yEarn);
		
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("mEarn", mEarn);
		model.addAttribute("yEarn", yEarn);
		model.addAttribute("cMonth", month);
		model.addAttribute("cYear", cYear);
		model.addAttribute("monthar", monthar);
		model.addAttribute("mEarnar", mEarnar);
		
		return model;
	}
	

	//어드민멤버리스트페이지
	@GetMapping("adminMemberList")
	public  ModelAndView adminMemberList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		//System.out.println(pager.getGrade());
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
		//System.out.println(memberVO.getGrade());
		ModelAndView mv= new ModelAndView();
		//memNum으로 찾은후 memberVO에 있는 grade를 가져옴.
		memberVO = adminService.pmemberSearch(memberVO);
		adminService.pmemberDelete(memberVO);
		mv.setViewName("redirect:./adminMemberList?grade="+memberVO.getGrade());
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

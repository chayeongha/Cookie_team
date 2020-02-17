package com.cookie.basic.intetceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cookie.basic.member.MemberVO;

@Component
public class AdminInterCeptor extends HandlerInterceptorAdapter {

	// 로그인이안되었을때 다른페이지를 들어가지못하도록.. 로그인페이지로 보내줌.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		// System.out.println(Integer.toString(memberVO.getGrade()));

		if (memberVO == null) {
			//System.out.println("null");
			
			response.sendRedirect("../member/memberLogin");	
			return false;
			
		} else if (memberVO != null) {
			//System.out.println("not null");
			
			 if(memberVO.getGrade() == 9999) {
				 return true;
			 }else if(memberVO.getGrade() == 1) {
			 			
			}else if(memberVO.getGrade() == 8888) {
					  
			}
			
		}
			response.sendRedirect("../member/memberLogin");	
			return false;
	}

}

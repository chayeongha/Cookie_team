package com.cookie.basic.intetceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cookie.basic.member.MemberVO;

@Component
public class MemberInterCeptor extends HandlerInterceptorAdapter {
	
	//로그인이안되었을때 다른페이지를 들어가지못하도록.. 로그인페이지로 보내줌.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Object obj = request.getSession().getAttribute("member");
		
		if(obj != null) {
			return true;
		}else {
			response.sendRedirect("./memberLogin");

			return false; 

		}	
	}

}


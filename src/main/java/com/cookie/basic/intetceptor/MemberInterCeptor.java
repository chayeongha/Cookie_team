package com.cookie.basic.intetceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class MemberInterCeptor extends HandlerInterceptorAdapter {
	
	//로그인이안되었을때 다른페이지를 들어가지못하도록.. 로그인페이지로 보내줌.
	//@Override
	//public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	//		throws Exception {
	//	Object obj = request.getSession().getAttribute("member");
	//	
	//	if(obj != null) {
	//		return true;
	//	}else {
	//		response.sendRedirect("./memberLogin");
	//		return false;
	//	}	
	//}

	//관리자로 로그인하지않았을 경우 못가도록 ADMIN관리페이지나 어드민메인페이지못들어가도록..해야함.
	
}

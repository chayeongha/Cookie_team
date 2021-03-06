package com.cookie.basic.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.cookie.basic.intetceptor.AdminInterCeptor;
import com.cookie.basic.intetceptor.BoardInterceptor;
import com.cookie.basic.intetceptor.MemberInterCeptor;

import com.cookie.basic.intetceptor.StoreInterCeptor;

@Configuration								
public class InterceptorConfig implements WebMvcConfigurer{

	@Autowired
	private MemberInterCeptor memberInterCeptor;
	@Autowired
	private StoreInterCeptor storeInterCeptor;
	@Autowired
	private BoardInterceptor boardInterceptor;
	@Autowired
	private AdminInterCeptor adminInterCeptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		//참고하기 인터셉터만들때~~~~~~~~~~~~~~~~~~~~~~~~~
		//Interceptor 등록하기
		//registry.addInterceptor(customInterceptor)
	
		//INTERCEPTOR를 사용할 URI 패턴 등록
		//.addPathPatterns("/member/*")//패턴추가.
		//.addPathPatterns("/member/memberPage");메서드 체인닝 이라고 게속 이어서 패턴을 추가가능.
		
		//INTERCEPTOR를 제외할 URI 패턴 등록
		//.excludePathPatterns("/member/memberLogin")
		//.excludePathPatterns("/member/memberJoin");//패턴을 제외.
		
		//WebMvcConfigurer.super.addInterceptors(registry);
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
		//멤버인터셉터 등록
		registry.addInterceptor(memberInterCeptor)
		.addPathPatterns("/member/*")
		.excludePathPatterns("/member/memberLogin")
		.excludePathPatterns("/member/joinAgree")
		.excludePathPatterns("/member/selectJoin")
		.excludePathPatterns("/member/memberJoin")
		.excludePathPatterns("/member/memberIndex")
		.excludePathPatterns("/member/emailCheck")
		.excludePathPatterns("/member/idCheck")
		.excludePathPatterns("/member/nickCheck")
		.excludePathPatterns("/member/searchIdPw")
		.excludePathPatterns("/member/idSearch")
		.excludePathPatterns("/member/sendSms")
		.excludePathPatterns("/member/smsCheck")
		.excludePathPatterns("/member/memberLogout")
		.excludePathPatterns("/member/pwSearch")
		.excludePathPatterns("/member/sendEmail")
		.excludePathPatterns("/member/phoneCheck")
		.excludePathPatterns("/member/memberKakao")
		.excludePathPatterns("/member/memberNaver");

		//스토어인터셉터 등록
		registry.addInterceptor(storeInterCeptor)	
		.addPathPatterns("/store/**")
		.addPathPatterns("/menu/**")
		.excludePathPatterns("/store/storeList")
		.excludePathPatterns("/store/storeList2")
		.excludePathPatterns("/store/storeList3")
		.excludePathPatterns("/store/storeGoods")
		.excludePathPatterns("/store/storeResult");
		
		//게시판 인터셉터 등록
		registry.addInterceptor(boardInterceptor)
		.addPathPatterns("/notice/**")
		.addPathPatterns("/qna/**")
		.excludePathPatterns("/notice/noticeList")
		.excludePathPatterns("/notice/noticeSelect")
		.excludePathPatterns("/qna/qnaList")
		.excludePathPatterns("/qna/qnaSelect")
		;
		
		//어드민 인터셉터
		registry.addInterceptor(adminInterCeptor)
		.addPathPatterns("/admin/*");
	}
}

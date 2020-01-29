package com.cookie.basic.config;

import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;


@Configuration
public class MessageConfig implements WebMvcConfigurer {

	@Bean//객체 생성.
	public LocaleResolver getLocaleResolver() {
	
			CookieLocaleResolver cookieLocaleResolver = new CookieLocaleResolver();
			cookieLocaleResolver.setDefaultLocale(Locale.KOREAN);//기본지역을 무엇으로 할지 정해주는것.
			cookieLocaleResolver.setCookieName("lang");//파라미터이름을 무엇으로 할지 정해주는것.
			
			return cookieLocaleResolver;
	}

	// 인터셉터 만들기
	@Bean
	public LocaleChangeInterceptor getLocale() {
		LocaleChangeInterceptor loInterceptor= new LocaleChangeInterceptor();
		loInterceptor.setParamName("lang");
		return loInterceptor;
	}
	
	
	
	
	// 인터셉터 등록
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(getLocale()).addPathPatterns("/**");
		
		//WebMvcConfigurer.super.addInterceptors(registry);
	}
	
	
}

package com.cookie.basic.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class CustumAOP {
															//가로안에 점이 1개있음 매개변수 한개, .. 이면 몇개든 상관없음.
	@Before("execution(* com.cookie.basic.member.MemberService.memberLogin(..))")
	public void before()throws Exception{
		 System.out.println("로그인 시도");
	}
	
	@After("execution(* com.cookie.basic.member.MemberService.memberLogin(..))")
	public void afterReturning()throws Exception {
		System.out.println("로그인 성공");
		
	}
	
	@AfterThrowing("execution(* com.cookie.basic.member.MemberService.memberJoin(..))")
	public void afterThrowing()throws Exception {
		System.out.println("after throwing");
	}
	
	@After("execution(* com.cookie.basic.member.MemberService.memberJoin(..))")
	public void after()throws Exception {
		
		System.out.println("after");
	}
	
	@Around("execution(* com.cookie.basic.member.MemberService.memberLogin(..))")
	public Object around(ProceedingJoinPoint joinPoint)throws Throwable {
		
		System.out.println("메서드 실행전");
		
		Object obj= joinPoint.proceed();
		System.out.println("메서드 실행후");
		
		return obj;
		
	}

}

<%@page import="com.cookie.basic.util.AudioCaptCha"%>
<%@page import="nl.captcha.Captcha"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Captcha captcha = (Captcha)session.getAttribute(Captcha.NAME);
	String getAnswer = captcha.getAnswer(); //CaptCha Image에 사용된 문자열을 반환한다
	new AudioCaptCha().getAudioCaptCha(request, response, getAnswer);
%>
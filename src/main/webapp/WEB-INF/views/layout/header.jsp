<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/css/reset.css" rel="stylesheet"/>
<link href="/css/header.css" rel="stylesheet"/>
<link href="/css/body.css" rel="stylesheet"/>
<!-- header -->
	<div class="header1">
		<div class="h1_1">
		<c:if test="${not empty sessionScope.member}">
			<div class="h1_txt"><a href="${pageContext.request.contextPath}/member/memberLogout">Logout</a></div>
			<div class="h1_txt"><a href="${pageContext.request.contextPath}/member/memberMypage">Mypage</a></div>
		</c:if>
		<c:if test="${empty sessionScope.member}">
			<div class="h1_txt"><a href="${pageContext.request.contextPath}/member/selectJoin">Join</a></div>
			<div class="h1_txt"><a href="${pageContext.request.contextPath}/member/memberLogin">Login</a></div>
		</c:if>
		</div>
	</div><!-- 위에 헤더 -->
	<div class="header2">
		<div class="h_img">
			<div class="M_imgg"></div>
		</div><!-- 이미지 -->
		<br><br>
		<div class="cate_1">Cookie</div>
		<div class="cate_2">Order</div>
		<div class="cate">
			<p><a href="#">제휴매장</a></p>
			<p><a href="../notice/noticeList">공지사항</a></p>

			<p><a href="#">이용후기</a></p>
			<p><a href="#">Q & A</a></p>
			<p><a href="#">매장등록</a></p>
		</div>
		
	</div><!-- 왼쪽 헤더 -->
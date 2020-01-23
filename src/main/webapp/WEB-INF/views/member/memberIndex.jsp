<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
			<h1>Member index</h1>
			
			<a href="${pageContext.request.contextPath}/member/selectJoin">회원가입</a>
			<a href="${pageContext.request.contextPath}/member/memberLogin">로그인</a>
			<a href="${pageContext.request.contextPath}/member/memberMypage">마이페이지</a>
			<a href="${pageContext.request.contextPath}/member/memberLogout">로그아웃</a>
			
			<c:if test="${member.grade eq 9999}">
			<a href="${pageContext.request.contextPath}/member/pmemberList">개인회원리스트</a>
			<a href="${pageContext.request.contextPath}/member/bmemberList">사업자회원리스트</a>
			</c:if>
	</div>		
			
</body>
</html>
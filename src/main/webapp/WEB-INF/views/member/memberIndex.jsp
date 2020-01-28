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
			<c:if test="${not empty sessionScope.member}">
			<a href="${pageContext.request.contextPath}/member/memberLogout">로그아웃</a>
			</c:if>
			<c:if test="${member.grade eq 9999}">
			<a href="${pageContext.request.contextPath}/admin/adminMemberList?grade=1">회원정보관리</a>
			</c:if>
	</div>		
			
</body>
</html>
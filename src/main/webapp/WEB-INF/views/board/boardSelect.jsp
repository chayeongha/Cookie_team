<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/board/boardSelect.css" rel="stylesheet">
<c:import url="../layout/header.jsp" />
</head>
<body>
<div class="body_main">
	<div class="b"></div>
	<!-- 서브 타이틀 -->
	<div class="subTitle_wrap">
		<div class="subTitle_inner">
			<h2>${boardName}</h2>
		</div>
	</div>
	
	<!-- container -->
	<div class="container">
		<div class="content_wrap">
			<section class="notice_view_wrap">
				<header>
					<h3>${select.title}</h3>
				</header>
				
				<article class="notice_view_info">
					<div class="notice_view_info_inner">
						<div class="">${select.contents}</div>
					</div>
				</article>
				
				<div class="btn_notice_wrap">
				</div>
			</section>
			
			<table summary="새소식 윗글, 아랫글" class="content_tb">
			</table>
		</div>
	</div>
</div>
</body>
</html>
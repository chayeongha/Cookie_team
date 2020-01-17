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
					<p class="btn_notice_update">
						<a href="noticeUpdate">수정</a>
					</p>
					<p  class="btn_notice_delete">
						<a href="noticeDelete">삭제</a>
					</p>
					<p class="btn_notice_list">
						<a href="noticeList">목록</a>
					</p>
				</div>
			</section>
			
			<table summary="새소식 윗글, 아랫글" class="content_tb">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				
				<tbody id="next">
					<tr>
						<th class="fth" scope="row" id="next_title">윗글</th>
						<td class="ftd">
							<a href="./noticeSelect?num=${select.num +1}">해당 글이 없습니다.</a>
						</td>
					</tr>
					
					<tr>
						<th class="lth" scope="row" id="prev_title">아랫글</th>
						<td class="ltd">
							<a href="./noticeSelect?num=${select.num -1}">콜마이 네임 서비스 운영 정책 변경 안내</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>
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

				<div>
					<ul>
						<c:forEach items="${select.noticeFilesVO}" var="file" varStatus="i">
							<li><a href="./fileDown?fnum=${file.fnum}">${file.oname}</a></li>
						</c:forEach>
					</ul>
				</div>

				<div class="btn_notice_wrap">
					<p class="btn_notice_update">
						<a href="noticeUpdate?num=${select.num}">수정</a>
					</p>
					<p  class="btn_notice_delete">
						<a href="noticeDelete?num=${select.num}">삭제</a>
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
							<c:choose>
								<c:when test="${select.next == 0}">
									<a id="next" href="javascript:void(0)">해당 글이 없습니다.</a>
								</c:when>
								<c:otherwise>
									<a id="next" href="./noticeSelect?num=${select.next}">${select.nextT}</a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					
					<tr>
						<th class="lth" scope="row" id="prev_title">아랫글</th>
						<td class="ltd">
							<c:choose>
								<c:when test="${select.prev == 0}">
									<a id="prev" href="javascript:void(0)">해당 글이 없습니다.</a>
								</c:when>
								<c:otherwise>
									<a id="prev" href="./noticeSelect?num=${select.prev}">${select.prevT}</a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<c:import url="../layout/footer.jsp" />
</div>
</body>
</html>
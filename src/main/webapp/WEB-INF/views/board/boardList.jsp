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
<link href="${pageContext.request.contextPath}/css/board/boardList.css" rel="stylesheet">
</head>
<body>
	<!-- 서브 타이틀 -->
	<div class="subTitle_wrap">
		<div class="subTitle_inner">
			<h2>${boardName}</h2>
		</div>
	</div>
	
	<!-- container -->
	<div class="container">
		<div class="notice_wrap">
			<div class="search_wrap">
				<p>
					<label for="sch_bar" class="lab">검색어</label>
					<input type="text" id="sch_bar" name="search" placeholder="검색어를 입력해주세요.">
					<a href="#none">검색</a>
				</p>
			</div>
		
			<table class="notice_tb">
				<thead>
					<tr>
						<th>NO</th>
						<th>제목</th>
						<th>날짜</th>
						<th>조회수</th>			
					</tr>
				</thead>
				
				<tbody id="notice">
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.num}</td>
						<td class="select_1"><a href="./noticeSelect?num=${list.num}">${list.title}</a></td>
						<td>${list.regDate}</td>
						<td>${list.hit}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<%-- <div class="container">
		<ul class="pagination">
			<c:if test="${pager.curBlock gt 1}">
				<li class="previous"><a href="./noticeList?curPage=${pager.startNum-1}">Previous</a></li>
			</c:if>
			
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li><a href="./noticeList?curPage=${i}">${i}</a></li>
			</c:forEach>
			
			<c:if test="${pager.curBlock lt pager.totalBlock}">
				<li class="next"><a href="./noticeList?curPage=${pager.lastNum+1}">Next</a></li>
			</c:if>
		</ul>
	</div> --%>
</body>
</html>
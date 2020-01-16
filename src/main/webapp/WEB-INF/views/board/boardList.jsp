<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Notice</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/board/boardList.css" rel="stylesheet">
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
		<div class="notice_wrap">
			<div class="search_wrap">
				<form id="frm" action="noticeList">
					<p>
						<input type="hidden" id="curPage" value="1" name="curPage">
						<select id="kind" name="kind">
							<option id="kt" value="kt">Title</option>
							<option id="kw" value="kw">Writer</option>
							<option id="kc" value="kc">Contents</option>
						</select>
						<label for="sch_bar" class="lab">검색어</label>
						<input type="text" id="sch_bar" name="search" placeholder="검색어를 입력해주세요." value="${pager.search}">
						<button id="btnS">검색</button>
					</p>
				</form>
			</div>
		
			<table class="notice_tb">
				<thead>
					<tr>
						<th>NO</th>
						<th>제목</th>
						<th>Date</th>
					</tr>
				</thead>
				
				<tbody id="notice">
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.num}</td>
						<td class="select_1"><a href="./noticeSelect?num=${list.num}">${list.title}</a></td>
						<td>${list.regDate}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<ul class="pagination">
				<c:if test="${pager.curBlock gt 1}">
					<li class="previous"><span id="${pager.startNum-1}" class="index"><</span></li>
				</c:if>
				
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="list"><span id="${i}" class="index">${i}</span></li>
				</c:forEach>
				
				<c:if test="${pager.curBlock lt pager.totalBlock}">
					<li class="next"><span id="${pager.lastNum+1}" class="index">></span></li>
				</c:if>
			</ul>
			<!-- <script type="text/javascript">
				$('.pagination li.index:first').addClass('active');
				$('ul li.index a').click(function(){
					$('.pagination li.index:first').removeClass('active');
					$(this).parent().addClass('active');
				});
			</script> -->
			
			<a href="noticeWrite" class="btn btn-primary" id="btnW">글쓰기</a>
		</div>
	</div>
		<c:import url="../layout/footer.jsp" />
</div>	
<script type="text/javascript">
	var kind = '${pager.kind}';
	if (kind == '') {
		kind = 'kt';
	}
	
	$("#" + kind).prop("selected", true);
	
	$(".index").click(function() {
		$("#curPage").val($(this).attr("id"))
		$("#frm").submit();
	});
</script>
</body>
</html>
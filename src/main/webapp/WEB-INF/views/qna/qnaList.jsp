<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Notice</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/board/qnaList.css" rel="stylesheet">
</head>
<body>
<div class="body_main">
	<div class="b"></div>
	<!-- 서브 타이틀 -->
	<div class="subTitle_wrap">
		<div class="subTitle_inner">
			<h2>문의사항</h2>
		</div>
	</div>

	<!-- container -->
	<div class="container">
		<div class="qna_filter"></div>
		<table class="qna_tb">
			<colgroup>
				<col style="width:85px;">
				<col style="width:auto;">
				<col style="width:96px;">
				<col style="width:115px;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">문의번호</th>
					<th scope="col">문의/답변</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td class="td_num">${list.num}</td>
						<td class="td_view">
							<span class="state">미완료</span>   
							<a href="#none" id="showCloseDetail" class="view_txt">${list.contents}</a>
						</td>
						<td class="td_writer">${list.writer}</td>
						<td class="td_date"><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd HH:mm" /></td>
					</tr>
					<tr class="trQna" style="display: table-row;">
						<td colspan="4" class="qna_wrap" style="display: table-cell;">
							<div class="question">
								<span class="iconQ">질문</span>
								${list.contents}
								<br>
							</div>
							<c:if test="${list.step > 0}">
								<div class="answer">
									<span class="iconA">답변</span>
									${list.contents}
									<br>
								</div>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="btn_wrap">
			<button type="button" id="write" class="btn_write">문의하기</button>
		</div>
		
		<ul class="pagination">
				<c:if test="${pager.curBlock gt 1}">
					<li class="previous"><span id="${pager.startNum-1}" class="index"></span></li>
				</c:if>
				
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<c:if test="${pager.curPage == i}">
						<li class="list"><span id="${i}" class="index" style="color: #f23600; text-decoration: underline;">${i}</span></li>
					</c:if>
					<c:if test="${pager.curPage != i}">
						<li class="list"><span id="${i}" class="index">${i}</span></li>
					</c:if>
				</c:forEach>
				
				<c:if test="${pager.curBlock lt pager.totalBlock}">
					<li class="next"><span id="${pager.lastNum+1}" class="index">></span></li>
				</c:if>
			</ul>
	</div>
		<c:import url="../layout/footer.jsp" />
</div>
<script type="text/javascript">
	//날짜 변환 함수
	function changeDate(date){
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		hour = date.getHours();
		minute = date.getMinutes();
		//second = date.getSeconds();
		strDate = year + "-" + month + "-" + day + " " + hour + ":" + minute;
		return strDate;
	}
</script>	
</body>
</html>				
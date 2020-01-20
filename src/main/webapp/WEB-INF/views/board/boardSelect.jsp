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
					<c:forEach items="${select.noticeFilesVO}" var="file" varStatus="i">
						<a href="./fileDown?fnum=${file.fnum}">${file.oname}</a>
					</c:forEach>
				</div>

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
							<a id="next" href="#none">해당 글이 없습니다.</a>
						</td>
					</tr>
					
					<tr>
						<th class="lth" scope="row" id="prev_title">아랫글</th>
						<td class="ltd">
							<a id="prev" href="#none">${select.prevT}</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- <script type="text/javascript">
	//윗글 불러오기
	$('#next').click(function(){
		var num = ${select.num};
		//alert(num);
		$.ajax({
			type:"POST",
			url:"./noticeIndex",
			data: {num:num},
			success: function(data){
				alert(data);
			},
			error: function() {
				alert("잠시 후에 다시 시도해주세요.");
			}
		});
	}); -->
</script>
</body>
</html>
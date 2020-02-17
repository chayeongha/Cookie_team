<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Review</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/board/reviewList.css" rel="stylesheet">
</head>
<body>
<div class="body_main">
	<div class="b"></div>
	<!-- 서브 타이틀 -->
	<div class="subTitle_wrap">
		<div class="subTitle_inner">
			<h2>이용후기</h2>
		</div>
	</div>

	<!-- container -->
	<div class="container">
<!-- 			<div class="search_wrap"> -->
<!-- 				<form id="frm" action="noticeList"> -->
<!-- 					<p> -->
<!-- 						<input type="hidden" id="curPage" value="1" name="curPage"> -->
<!-- 						<select id="kind" name="kind"> -->
<!-- 							<option id="kt" value="kt">Title</option> -->
<!-- 							<option id="kw" value="kw">Writer</option> -->
<!-- 							<option id="kc" value="kc">Contents</option> -->
<!-- 						</select> -->
<!-- 						<label for="sch_bar" class="lab">검색어</label> -->
<%-- 						<input type="text" id="sch_bar" name="search" placeholder="검색어를 입력해주세요." value="${pager.search}"> --%>
<!-- 						<button id="btnS">검색</button> -->
<!-- 					</p> -->
<!-- 				</form> -->
<!-- 			</div> -->
		
		<div class="review_list">
			<ul class="">
				<c:forEach items="${list}" var="review">
					<li>
						<div class="cfix">
							<div class="bbs_top">
								<div class="top_l">
									<div class="starWrap">
									<!-- 클릭했을 때 class에 good 추가 -->
										<button type="button" id="star1" class="rev_star"><em>최악이에요</em></button>
										<button type="button" id="star2" class="rev_star"><em>별로예요</em></button>
										<button type="button" id="star3" class="rev_star"><em>보통이에요</em></button>
										<button type="button" id="star4" class="rev_star"><em>좋아요</em></button>
										<button type="button" id="star5" class="rev_star"><em>최고예요</em></button>
										<!-- 별 클릭했을 때 value 값 변경 -->
										<input type="text" name="star" id="star" value="${review.star}">
										<!-- 별 클릭했을 때 내용 변경 -->
										<!-- 최악이에요 별로예요 보통이에요 좋아요 최고예요 -->
										<script type="text/javascript">
											var lv = $('input[name="star"]').val();
											$('#star'+lv).addClass('good').prevAll('button').addClass('good');
										</script>
									</div>
								</div>
								<div class="top_r">
									<strong class="writer">${review.writerS}&nbsp;&nbsp;</strong>
									<span class="date"><fmt:formatDate value="${review.regDate}" pattern="yyyy-MM-dd HH:mm" /></span>
								</div>
							</div>
							<div class="bbs_cont_wrap">
								<div class="bbs_img">
									<img alt="후기이미지" src="../upload/">
								</div>
								<div class="bbs_cont"></div>
							</div>
							<div class="btn_wrap"></div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		
			
			
		<ul class="pagination">
			<c:if test="${pager.curBlock gt 1}">
				<li class="previous"><span id="${pager.startNum-1}" class="index"><</span></li>
			</c:if>
			
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<c:if test="${pager.curPage == i}">
					<li class="list"><span id="${i}" class="index" style="color: #f23600; ">${i}</span></li>
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
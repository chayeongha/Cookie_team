<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/css/reset.css" rel="stylesheet"/>
<link href="/css/header.css" rel="stylesheet"/>
<link href="/css/body.css" rel="stylesheet"/>
<!-- header -->
	<div class="header1">
		<div class="h1_1">
		<c:if test="${not empty sessionScope.member}">
			<c:if test="${2 eq sessionScope.member.kind }">
			<div class="h1_txt"><a href="${pageContext.request.contextPath}/member/memberLogout"><input type="submit" id="logout" value="Logout"></a></div>
			<script type="text/javascript">
				$("#logout").click(function(){
					
					window.open("https://accounts.kakao.com/logout?continue=https://accounts.kakao.com/weblogin/account", "",
							"width=500,height=230,top=200, left=600");
					close();
					
				});
			</script>
			</c:if>
			
			<c:if test="${1 eq sessionScope.member.kind }">
			<div class="h1_txt"><a href="${pageContext.request.contextPath}/member/memberLogout"><input type="submit" id="logout" value="Logout"></a></div>
			<script type="text/javascript">
				$("#logout").click(function(){
					
					window.open("https://nid.naver.com/nidlogin.logout?returl=localhost", "",
							"width=500,height=230,top=200, left=600");
					close();
					
				});
			</script>
			
			</c:if>
			<c:if test="${null eq sessionScope.member.kind }">
			<div class="h1_txt"><a href="${pageContext.request.contextPath}/member/memberLogout">Logout</a></div>
			</c:if>
			
			<c:if test="${sessionScope.member.grade ne 9999}">
			<div class="h1_txt"><a href="${pageContext.request.contextPath}/member/memberMypage">Mypage</a></div>
			</c:if>
			<c:if test="${sessionScope.member.grade eq 9999}">
			<div class="h1_txt"><a href="${pageContext.request.contextPath}/admin/adminMain">adminPage</a></div>
			</c:if>
			<c:if test="${sessionScope.member.grade eq 8888}">
			<div class="h1_txt"><a href="${pageContext.request.contextPath}/store/myInfo">Mystore</a></div>
			</c:if>
			
			
		</c:if>
		<c:if test="${empty sessionScope.member}">
			<div class="h1_txt"><a href="${pageContext.request.contextPath}/member/joinAgree">Join</a></div>
			<div class="h1_txt"><a href="${pageContext.request.contextPath}/member/memberLogin">Login</a></div>
		</c:if>
		</div>
	</div><!-- 위에 헤더 -->
	<div class="header2">
		<div class="h_img">
			<div class="M_imgg"></div>
		</div><!-- 이미지 -->
		<br><br>
		<div class="cate_1"><a href="${pageContext.request.contextPath}/">Cookie</a></div>
		<div class="cate_2"><a href="${pageContext.request.contextPath}/">Order</a></div>
		<div class="cate">
			<p><a href="${pageContext.request.contextPath}/store/storeList">제휴매장</a></p>
			<p><a href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a></p>

			<p><a href="${pageContext.request.contextPath}/review/reviewList">이용후기</a></p>
			<p><a href="${pageContext.request.contextPath}/qna/qnaList">Q & A</a></p>
			<c:if test="${sessionScope.member.grade ne 8888}">
			</c:if>
			<c:if test="${sessionScope.member.grade eq 8888}">
			<p><a href="${pageContext.request.contextPath}/store/storeInsert">매장등록</a></p>
			</c:if>
			
		</div>
		
	</div><!-- 왼쪽 헤더 -->
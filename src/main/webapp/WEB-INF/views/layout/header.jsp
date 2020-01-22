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
			<div class="h1_txt"><a href="${pageContext.request.contextPath}/member/memberMypage">Mypage</a></div>
		</c:if>
		<c:if test="${empty sessionScope.member}">
			<div class="h1_txt"><a href="${pageContext.request.contextPath}/member/selectJoin">Join</a></div>
			<div class="h1_txt"><a href="${pageContext.request.contextPath}/member/memberLogin">Login</a></div>
		</c:if>
		</div>
	</div><!-- 위에 헤더 -->
	<div class="header2">
		<div class="h_img">
			<div class="M_imgg"></div>
		</div><!-- 이미지 -->
		<br><br>
		<div class="cate_1">Cookie</div>
		<div class="cate_2">Order</div>
		<div class="cate">
			<p><a href="#">제휴매장</a></p>
			<p><a href="../notice/noticeList">공지사항</a></p>

			<p><a href="#">이용후기</a></p>
			<p><a href="#">Q & A</a></p>
			<p><a href="../store/storeInsert">매장등록</a></p>
		</div>
		
	</div><!-- 왼쪽 헤더 -->
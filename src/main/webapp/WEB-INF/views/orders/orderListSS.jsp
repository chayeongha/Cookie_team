<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/reset.css" rel="stylesheet" />
<link href="/css/store/storeOrder.css" rel="stylesheet" />

</head>
<body>
	<input type="hidden" value="${store.ssNum}">
	<c:forEach items="${lists}" var="vo">
		<c:if test="${vo.ordersVO.nickname eq vo.cartVO.nickname}">
		<div class="orderBox">
			<div class="orderBox2">
				<div class="listTr">
				<!--주문 정보-->
				<div class="ListT">
					<div class="ListNum">리스트 번호 : ${vo.ooNum}</div>
					<div class="ListName">닉네임 : ${vo.ordersVO.nickname}</div>
					<div class="ListDate">주문 날짜 : ${vo.ordersVO.ooDate}</div>
				</div>
					<!--테이크 아웃 여부 및 제조 여부-->
					<div class="OrderR">
					<c:if test="${vo.ordersVO.takeOut eq 1}">
					 <div class="ListTake">테이크 아웃</div>
					</c:if> 
					<c:if test="${vo.ordersVO.takeOut eq 0}">
					 <div class="ListTake">매장</div>
					</c:if> 
					<input type="hidden" value="${vo.ordersVO.ooStatus}">
					<c:if test="${vo.ordersVO.ooStatus eq 0}">
					 <div>제조 대기</div>
					</c:if> 
					<c:if test="${vo.ordersVO.ooStatus eq 1}">
					 <div>제조 완료</div>
					</c:if> 
					</div>
					
					<!--메뉴 옵션-->
					<c:forEach items="${vo.cartVO.menuVOs}" var="me">
					<div class="OrderM">
						<div>${me.mmName}</div>
						<div>가격 : ${me.mmPrice}</div>
					</div>

						<!--CartOptions에서 받아오는걸로 변경하기 -->
						<div class="OrderO">
						<c:forEach items="${me.menuOptions}" var="opt">
							<div>${opt.optName}</div>
							
						</c:forEach>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
		</c:if>
	</c:forEach>

</body>
</html>
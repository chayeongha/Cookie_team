<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/boot.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/reset.css" rel="stylesheet" />
<link href="/css/store/storeOrder.css" rel="stylesheet" />

</head>
<body>
<c:if test="${member.nickname ne nick}">
<h1>정상적인 접근경로가 아닙니다</h1>
</c:if>
<c:if test="${member.nickname eq nick}">
<input type="hidden" value="${store.ssNum}">
	
	<c:forEach items="${lists}" var="vo" varStatus="voStatus">
		<%-- <c:if test="${vo.ordersVO.nickname eq vo.cartVO.nickname}"> --%>
		<div class="orderBox">
			<div class="orderBox2">
				<div class="listTr">
				<!--주문 정보-->
				<div class="ListT">
					<div class="ListNum">리스트 번호 : ${vo.ordersVO.ooNum}</div>
		<input type="hidden" class="orderDate" value="${vo.ordersVO.ooDate}">
					<div class="ListDate">주문 날짜 : ${vo.ordersVO.ooDate}</div>
				</div>
					<!--테이크 아웃 여부 및 제조 여부-->
				
					<c:if test="${vo.ordersVO.takeOut eq 1}">
					 <div class="ListTake">테이크 아웃</div>
					</c:if> 
					<c:if test="${vo.ordersVO.takeOut eq 0}">
					 <div class="ListTake">매장</div>
					</c:if> 
					<input type="hidden" value="${vo.ordersVO.ooStatus}">
					<c:if test="${vo.ordersVO.ooStatus eq 1}">
					 <div class="ListWait">제조 대기</div>
					</c:if> 
					<c:if test="${vo.ordersVO.ooStatus eq 2}">
					 <div class="ListWait">제조 완료</div>
					</c:if> 
					
					<input type="hidden" id="hoonum" value="${vo.ordersVO.ooNum}">
				<input type="hidden" id="hssnum" value="${vo.ordersVO.ssNum}">
				<div class="phoneBox2">
				<input type="hidden" id="hphone" value="${vo.ordersVO.phone}">
					</div>
					</div>
					<c:forEach items="${vo.cartVOs}" var="ce">
					<!--메뉴 옵션-->
					<c:forEach items="${ce.menuVOs}" var="me">
					<div class="mBox">
						<div>${me.mmName} </div>
						<div>${ce.mmCount} 개</div>
						<div>가격 : ${me.mmPrice}</div>
						<div style="display: none;">${me.mmNum}</div>
					

						<!--CartOptions에서 받아오는걸로 변경하기 -->
						
						<c:forEach items="${lists2}" var="opt">
						<c:forEach items="${opt.moptVOs}" var="opm">
						<c:if test="${(me.mmNum eq opm.mmNum) and (ce.cartNum eq opt.cartNum)}">
							<div class="optC">　${opt.optCount}개</div>
							<div class="optN">${opm.optName}</div>
							
							<div style="display: none;">${opm.optPrice}</div>
						<div style="display: none;">${opm.mmNum}</div>
						</c:if>
						</c:forEach>
						</c:forEach>
						</div>
					
					</c:forEach>
					</c:forEach>
					<c:if test="${vo.ordersVO.ooStatus eq 1}">
					<div class="finish">주문 완료!</div>
					</c:if>
					
					<c:if test="${vo.ordersVO.ooStatus eq 2}">
					 <div class="finish">음료 제조 완료!</div>
					</c:if> 
				</div>
			</div>
		<%-- </c:if> --%>
	</c:forEach>

<%-- <c:forEach items="${lists}" var="vo">
<div class="orderBox">
			<tr class="listTr">
					<td>${vo.olNum}</td>
					<td>${vo.ordersVO.nickname}</td>
					<td>${vo.ordersVO.ooDate}</td>
					<td>${vo.ordersVO.phone}</td>
					<td>${vo.ordersVO.ssNum}</td>
					<td>${vo.ordersVO.takeOut}</td>
					<td>${vo.ordersVO.ooStatus}</td>
					<c:forEach items="${vo.cartVOs}" var="cart">
					<td>${cart.cartStatus}</td>	
					<c:forEach items="${cart.menuVOs}" var="me">
					<td>${me.mmName}</td>
					<td>${me.mmPrice}</td>
					
						<c:forEach items="${lists2}" var="opt">
						<c:forEach items="${opt.moptVOs}" var="opm">
						<c:if test="${me.mmNum eq opm.mmNum}">
							<div>${opm.optName}</div>
							<div style="display: none;">${opm.optPrice}</div>
						<div style="display: none;">${opm.mmNum}</div>
						</c:if>
						</c:forEach>
						</c:forEach>
					
					
					</c:forEach>
					</c:forEach>
			</tr>
</div>
</c:forEach> --%>

<script type="text/javascript">

	/*타임스탬프 변환  */
	var orderDate =$(".orderDate").val();
	
	var date = new Date();

	date.setTime(orderDate);
	dateString = date.toLocale


</script>
</c:if>

</body>
</html>
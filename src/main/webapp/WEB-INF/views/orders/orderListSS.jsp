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
	<input type="hidden" value="${store.ssNum}">
	<c:forEach items="${lists}" var="vo">
		<div class="orderBox">
			<div class="orderBox2">
				<div class="listTr">
				<!--주문 정보-->
				<div class="ListT">
					<div class="ListNum">리스트 번호 : ${vo.olNum}</div>
					<div class="ListName">닉네임 : ${vo.ordersVO.nickname}</div>
					<div class="ListDate">주문 날짜 : ${vo.ordersVO.ooDate}</div>
					<div> 카트 넘버 : ${vo.cartVO.cartNum}</div>
				</div>
					<!--테이크 아웃 여부 및 제조 여부-->
					<div class="OrderR">
					<c:if test="${vo.ordersVO.takeOut eq 1}">
					 <div class="ListTake">테이크 아웃</div>
					</c:if> 
					<c:if test="${vo.ordersVO.takeOut eq 0}">
					 <div class="ListTake">매장</div>
					</c:if> 
					
					<c:if test="${vo.ordersVO.ooStatus eq 0}">
					 <div>제조 대기</div>
					</c:if> 
					<c:if test="${vo.ordersVO.ooStatus eq 1}">
					 <div>제조 완료</div>
					</c:if> 
					
					<input type="hidden" id="hoonum" value="${vo.ordersVO.ooNum}">
				<input type="hidden" id="hssnum" value="${vo.ordersVO.ssNum}">
				<input type="text" id="hphone" value="${vo.ordersVO.phone}">
					</div>
					
					<!--메뉴 옵션-->
					<c:forEach items="${vo.cartVO.menuVOs}" var="me">
					<div class="OrderM">
						<div>${me.mmName}</div>
						<div>가격 : ${me.mmPrice}</div>
					</div>

						<!--CartOptions에서 받아오는걸로 변경하기 -->
						<div class="OrderO">
						<c:forEach items="${lists2}" var="opt">
							<div>${opt.moptVO.optName}</div>
							<div>${opt.moptVO.optPrice}</div>
						</c:forEach>
						</div>
					</c:forEach>
					
					<c:if test="${vo.ordersVO.ooStatus eq 0}">
					<input type="button" value="제조 완료" style="cursor: pointer;" id="upbtn" class="ordersUpdate"> 
					</c:if>
					
					<c:if test="${vo.ordersVO.ooStatus eq 1}">
					 <div>메세지 전송 완료!</div>
					</c:if> 
				</div>
			</div>
		</div>
	</c:forEach>

<script type="text/javascript">
		//Update 제조완료
		var upbtn = document.getElementById('upbtn');
		var ooNum = $("#hoonum").val();
		var ssNum = $("#hssnum").val();
		var receiver = $("#hphone").val();
		upbtn.onclick = function() {
			console.log(ooNum);
			console.log(ssNum);
			console.log(receiver);

			$.ajax({ 
				url: "sendOrder", 
				type: "POST", 
				data: { 
					receiver : receiver
				}, 
				success: function(data) { 
					if (data != null) { 
					alert("제조 완료문자 전송 성공");
					}else {
					alert("제조 완료문자 전송 실패"); 
					}
				} 
			});
			
			$.ajax({
				type : "POST",
				url : "./ordersUpdate",
				data : {
					ooNum : ooNum,
					ssNum : ssNum
				},
				success : function(data) {
					alert("제조 완료");
					window.location.href = "./orderListSS?ssNum=" + ssNum;
				}
			});
		}
	</script>


</body>
</html>
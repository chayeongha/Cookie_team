<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/boot.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
점주가 확인하는 페이지
<c:forEach items="${lists}" var="vo">
<tr class="listTr">
					<td>${vo.olNum}</td>
					<td>${vo.ordersVO.nickname}</td>
					<td>${vo.ordersVO.ooDate}</td>
					<td>${vo.ordersVO.phone}</td>
					<td>${vo.ordersVO.ssNum}</td>
					<td>${vo.ordersVO.takeOut}</td>
					<td>${vo.ordersVO.ooStatus}</td>
					<td>${vo.cartVO.cartStatus}</td>
					<c:forEach items="${vo.cartVO.menuVOs}" var="me">
					<td>${me.mmName}</td>
					<td>${me.mmPrice}</td>
					<c:forEach items="${me.menuOptions}" var="opt">
					<td>${opt.optName}</td>
					<td>${opt.optPrice}</td>
					</c:forEach>
					</c:forEach>
				</tr>

				<input type="text" id="hoonum" value="${vo.ordersVO.ooNum}">
				<input type="text" id="hssnum" value="${vo.ordersVO.ssNum}">
</c:forEach>
				<input type="button" value="제조 완료" style="cursor: pointer;" id="upbtn" class="ordersUpdate"> 


<script type="text/javascript">
		//Update 제조완료

		var upbtn = document.getElementById('upbtn');
		var ooNum = $("#hoonum").val();
		var ssNum = $("#hssnum").val();
		upbtn.onclick = function() {
			console.log(ooNum);
			console.log(ssNum);
			
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
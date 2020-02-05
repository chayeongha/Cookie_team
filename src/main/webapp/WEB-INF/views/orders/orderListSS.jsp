<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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

</c:forEach>

</body>
</html>
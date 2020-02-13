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
pointList Page



	<table >
			<tr>
				<td>NUM</td>
				<td>스토어</td>
				<td>날짜</td>
				<td>적립/차감금액</td>
				<td>적립/차감</td>
			</tr>

			<c:forEach items="${lists}" var="po">
				<tr >
					<td>${po.poNum}</td>
					<td>${po.storeVO.sName}</td>
					<td>${po.poDate}</td>
					<td>${po.poChange}</td>
					<td>
					<c:if test="${po.poUse eq 0}">
					적립
					</c:if>
					<c:if test="${po.poUse  eq 1}">
					차감
					</c:if>
					</td>
				</tr>
	


</c:forEach>


</body>
</html>
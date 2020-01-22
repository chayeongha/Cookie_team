<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/boot.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">

	<table class="table table-hover">
		<tr>
			<td>NUM</td>
			<td>이름</td>
			<td>가격</td>
			<td>수량</td>
			<td>카테고리</td>
			<td>아뜨여부</td>
		</tr>
		
		<c:forEach items="${lists}" var="vos">
		<tr>
			<td>${vos.mmNum}</td>
			<td> <a href="menuSelect?mmNum=${vos.mmNum}">${vos.mmName}</a></td>
			<td>${vos.mmPrice}</td>
			<td>${vos.mmCount}</td>
			<td>${vos.cmNum}</td>
			<td>${vos.mmTemp}</td>
		</tr>
		
		</c:forEach>
	</table>
	
	<div>
		</div>

			<a class="btn btn-primary" href="./menuInsert?ssNum=${store.ssNum}">메뉴추가</a>

	</div>
	





</body>


</html>
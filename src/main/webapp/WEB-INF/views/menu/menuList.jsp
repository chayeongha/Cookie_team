<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link href="/css/reset.css" rel="stylesheet" />
<link href="/css/menu/menuList.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="storeHeader">
		<div class="AddMenuTi">Menu List</div>
		<div class="AddMenuTi2">메뉴 추가 및 관리</div>
	</div>

	<div class="container">

	
		
		
	
		<table class="mmTable">
			<tr class="clrt">
				<td>NUM</td>
				<td>이름</td>
				<td>가격</td>
				<td>수량</td>
				<td>카테고리</td>
				<td>아뜨여부</td>
			</tr>

			<c:forEach items="${lists}" var="vos">
				<tr class="listTr">
					<td>${vos.mmNum}</td>
					<td><a class="ammNum" href="menuSelect?mmNum=${vos.mmNum}">${vos.mmName}</a></td>
					<td>${vos.mmPrice}</td>
					<td>${vos.mmCount}</td>
					<td>${vos.cmNum}</td>
					<td>${vos.mmTemp}</td>
				</tr>

			</c:forEach>
		</table>
		
		
		
		
		<div></div>

		<a class="menuselect" href="./menuInsert?ssNum=${store.ssNum}">메뉴추가</a>

	</div>

</body>


</html>
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

	
		
		
	<div class="cfTi">Coffee</div>
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
		
		
		
		<div class="BevTi">Beverage</div>
		<table class="mmTable">
			<tr class="clrt">
				<td>NUM</td>
				<td>이름</td>
				<td>가격</td>
				<td>수량</td>
				<td>카테고리</td>
				<td>아뜨여부</td>
			</tr>

			<c:forEach items="${ar2}" var="a2">
				<tr class="listTr">
					<td>${a2.mmNum}</td>
					<td><a class="ammNum" href="menuSelect?mmNum=${a2.mmNum}">${a2.mmName}</a></td>
					<td>${a2.mmPrice}</td>
					<td>${a2.mmCount}</td>
					<td>${a2.cmNum}</td>
					<td>${a2.mmTemp}</td>
				</tr>

			</c:forEach>
		</table>
		
		
		
		
		
		<div class="dsTi">Dessert</div>
		<table class="mmTable">
			<tr class="clrt">
				<td>NUM</td>
				<td>이름</td>
				<td>가격</td>
				<td>수량</td>
				<td>카테고리</td>
				<td>아뜨여부</td>
			</tr>

			<c:forEach items="${ar3}" var="a3">
				<tr class="listTr">
					<td>${a3.mmNum}</td>
					<td><a class="ammNum" href="menuSelect?mmNum=${a3.mmNum}">${a3.mmName}</a></td>
					<td>${a3.mmPrice}</td>
					<td>${a3.mmCount}</td>
					<td>${a3.cmNum}</td>
					<td>${a3.mmTemp}</td>
				</tr>

			</c:forEach>
		</table>
		
		
		<div></div>

		<a class="menuselect" href="./menuInsert?ssNum=${store.ssNum}">메뉴추가</a>

	</div>

</body>


</html>
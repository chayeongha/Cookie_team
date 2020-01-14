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
		
		<c:forEach items="${list}" var="vo">
		<tr>
			<td>${vo.mNum}</td>
			<td> <a href="menuSelect?num=${vo.mNum}">${vo.mName}</a></td>
			<td>${vo.mPrice}</td>
			<td>${vo.mCount}</td>
			<td>${vo.mCnum}</td>
			<td>${vo.mTemp}</td>
		</tr>
		
		</c:forEach>
	</table>
	
	<div>
		</div>

			<a class="btn btn-primary" href="./menuInsert">메뉴추가</a>

	</div>
	

</body>


</html>
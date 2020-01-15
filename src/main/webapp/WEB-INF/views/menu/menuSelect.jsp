<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
<div class="contents">
	<h1>메뉴명 :${vo.mmName}</h1>
	<h1>가격:${vo.mmPrice}</h1>
	<c:forEach items="${vo.menuFiles}" var="file">
	<img alt="제품이미지" src="../../images/menu/${file.mfName}">
	</c:forEach>

</div>

</body>
</html>
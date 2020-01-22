<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/board/boardList.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/store/storeList.css" rel="stylesheet">
</head>
<body>
	<div class="wrap">
		<div>
		<c:forEach items="${arr}" var= "i">
			<input type="button" value="${i}" class="bb">
		</c:forEach>
		</div>
	</div>
</body>
</html>
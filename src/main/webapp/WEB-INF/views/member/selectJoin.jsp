<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<c:import url="../template/boot.jsp" />
</head>
<body>

	<div class="container">
		 <div class="form-group">  
		<h1>SELECT JOIN PAGE</h1>
		</div>
			  <div class="form-group">  
			<button type="button" onclick="location.href='memberJoin?grade=1&kind=Personalman' ">개인 회원가입</button>
			<button type="button" onclick="location.href='memberJoin?grade=8888&kind=Buisnessman' ">사업자 회원가입</button>
				</div>
	</div>


</body>
</html>
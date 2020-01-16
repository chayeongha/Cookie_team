<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>





	<form action="./storeNameCheck">
		<div class="h_Css"><img alt="" src="../resources/images/header/logo_sub.jpg">
		<c:if test="${not empty param.sName}">
			<div class="idTest"><div class="idTest_font">${param.sName} 는 ${msg}</div></div>
		</c:if>

		
		<div>
			<br>
			<label for="sName">매장이름 : </label> <input type="text" id="sName" name="sName" value="${param.email}">
			<button type="submit" class="CheckIDBtn btn btn-default">확인</button>
			<c:if test="${empty dto and not empty param.sName}">

			<input type="button" value="사용하기" id="useEmail" class="btn btn-default" >

			</c:if>			
		</div>

		</div>
		
	</form>







</body>
</html>
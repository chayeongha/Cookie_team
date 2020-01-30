<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>ID 중복확인</title>
<c:import url="../template/boot.jsp" />
<link href="/css/member/idCheck.css" rel="stylesheet"/>
<link href="/css/reset.css" rel="stylesheet" />
</head>
<body>
	
	<div class="checkId"><img alt="쿠키이미지" src="../images/header/mm.png" style="width: 45px; height: 45px; margin-left: 20px;">　아이디중복확인</div>
	
	<form action="./emailCheck">	
		<c:if test="${not empty param.email}">
			<div class="emailTest">${param.email}는 ${msg}</div>
		</c:if>
		
		<div class="container">
			<br>
			<label for="email" class="email">　EMAIL : </label> 
			<input type="text" id="email" name="email" value="${param.email}" class="idInput" placeholder="ex) xxxxx@cookie.com">
			<button type="submit" class="btnsubmin">확인</button>
			<c:if test="${not empty param.email and empty member}">
				<input type="button" value="사용하기" id="useEmail">
			</c:if>			
		</div>
	</form>
	
	<script type="text/javascript">

		//아이디 사용
		$('#useEmail').click(function(){
			 var email= $('#email').val();
			 $("#email", opener.document).val(email);
			window.self.close();
		});
	
	</script>
</body>
</html>
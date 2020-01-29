<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복확인</title>
<c:import url="../template/boot.jsp" />
</head>
<body>
	<h1>닉네임중복확인</h1>
	
	<form action="./memberNickCheck">	
		<c:if test="${not empty param.nickname}">
			<div class="nicknameTest">${param.nickname}는 ${msg}</div>
		</c:if>
		
		<div class="container">
			<br>
			<label for="nickname">NICKNAME : </label> 
			<input type="text" id="nickname" name="nickname" value="${param.nickname}">
			<button type="submit" class="btn btn-default">확인</button>
			<c:if test="${not empty param.nickname and empty member }">
				<input type="button" value="사용하기" id="useNickname" class="btn btn-default" >
			</c:if>			
		</div>
	</form>
	
	<script type="text/javascript">

		//닉네임 사용
		$('#useNickname').click(function(){
			 var nickname= $('#nickname').val();
			 $("#nickname", opener.document).val(nickname);
			window.self.close();
		});
	

	</script>
</body>
</html>
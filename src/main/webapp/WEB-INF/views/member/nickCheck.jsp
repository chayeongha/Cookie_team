<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복확인</title>
<c:import url="../template/boot.jsp" />
<link href="/css/member/nickCheck.css" rel="stylesheet"/>
<link href="/css/reset.css" rel="stylesheet" />
</head>
<body>
	<div class="checknickName"><img alt="쿠키이미지" src="../images/header/mm.png" style="width: 45px; height: 45px; margin-left: 20px;">　닉네임 중복확인</div>
	
	<form action="./nickCheck">	
		<c:if test="${not empty param.nickname}">
			<div class="nicknameTest">${param.nickname}는 ${msg}</div>
		</c:if>
		
		<div class="container">
			<br>
			<label for="nickname" class="nickname">NICKNAME : </label> 
			<input type="text" id="nickname" name="nickname" value="${param.nickname}">
			<button type="submit" class="btnsubmit">확인</button>
			<input type="hidden" value="${result}" id="result">
			<input type="button" value="사용하기" id="useNickname" style="display: none;">
				
		</div>
	</form>
	
	<script type="text/javascript">

		//닉네임 사용
		$('#useNickname').click(function(){
			 var nickname= $('#nickname').val();
			 $("#nickname", opener.document).val(nickname);
			window.self.close();
		});
	
		//사용하기버튼활성화 조건 컨트롤러에서 result값을넣어줌으로써 0보다크면 보이게!!
		if($("#result").val() > 0){
			$("#useNickname").css('display','inline');
		}
		
	</script>
</body>
</html>
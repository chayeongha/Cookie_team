<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>이메일 중복확인</title>
<c:import url="../template/boot.jsp" />
<link href="/css/member/idCheck.css" rel="stylesheet"/>
<link href="/css/reset.css" rel="stylesheet" />
</head>
<body>
	
	<div class="checkId"><img alt="쿠키이미지" src="../images/header/mm.png" style="width: 45px; height: 45px; margin-left: 20px;">이메일 중복확인</div>
	
	<form action="./emailCheck2">	
		<c:if test="${not empty param.email}">
			<div class="emailTest">${param.email}는 ${msg}</div>
		</c:if>
		
		<div class="container">
			<br>
			<label for="email" class="email">　EMAIL : </label> 
			<input type="text" id="email" name="email" value="${param.email}" class="idInput" placeholder="ex) xxxxx@cookie.com">
			<button type="submit" class="btnsubmin">확인</button>
			<input type="hidden" value="${result}" id="result">
			<input type="button" value="사용하기" id="useEmail" style="display: none;">
					
		</div>
	</form>
	
	<script type="text/javascript">

		//이메일 사용
		$('#useEmail').click(function(){
			 var email= $('#email').val();
			 $("#email2", opener.document).val(email);
			window.self.close();
		});

		//이메일 정규식
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		$("#email").blur(
				function(){
					if($('#email').val() != "" && emailRule.test($('#email').val()) != true	){
							alert("이메일 형식에 맞게 입력해주세요");
							$('#email').val("");
							$('#email').focus();
							return;
					}	
			});
		
		//사용하기버튼활성화 조건 컨트롤러에서 result값을넣어줌으로써 0보다크면 보이게
		if($("#result").val() > 0){
			$("#useEmail").css('display','inline');
		}
	
	</script>
</body>
</html>
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
	
	<form action="./idCheck">	
		<c:if test="${not empty param.memId}">
			<div class="memIdTest">${param.memId}는 ${msg}</div>
		</c:if>
		
		<div class="container">
			<br>
			<label for="memId" class="memId">　ID : </label> 
			<input type="text" id="memId" name="memId" value="${param.memId}" class="idInput" placeholder="한글이나 특수문자를 제외하고 입력하세요">
			<button type="submit" class="btnsubmin">확인</button>
			<c:if test="${not empty param.memId and empty member }">
				<input type="button" value="사용하기" id="useMemId">
			</c:if>			
		</div>
	</form>
	
	<script type="text/javascript">

		//아이디 사용
		$('#useMemId').click(function(){
			 var memId= $('#memId').val();
			 $("#memId", opener.document).val(memId);
			window.self.close();
		});
	
		//아이디 정규식
		var pattern = /[^A-Za-z0-9\s,.!~()?]/;
				
		$("#memId").blur(function(){
			if(pattern.test($('#memId').val()) == true ){
				alert('한글이나 특수문자를 제외하고 입력해주세요.')
				$('#memId').val("");
				$('#memId').focus();

				return;
			}
		});

	</script>
</body>
</html>
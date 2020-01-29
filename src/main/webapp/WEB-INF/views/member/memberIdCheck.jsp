<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>ID 중복확인</title>
<c:import url="../template/boot.jsp" />
</head>
<body>
	<h1>아이디중복확인</h1>
	
	<form action="./memberIdCheck">	
		<c:if test="${not empty param.memId}">
			<div class="memIdTest">${param.memId}는 ${msg}</div>
		</c:if>
		
		<div class="container">
			<br>
			<label for="memId">ID : </label> 
			<input type="text" id="memId" name="memId" value="${param.memId}">
			<button type="submit" class="btn btn-default">확인</button>
			<c:if test="${not empty param.memId and empty member }">
				<input type="button" value="사용하기" id="useMemId" class="btn btn-default" >
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
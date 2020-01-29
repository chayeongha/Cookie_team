<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>


<div class="storeInsertForm">
		<form action="storeClose" method="post" name="form" id="form">


			<input type="hidden" id="memNum" name="memNum" value="${member.memNum}">
			<div>
				<div class="store_label">점주 아이디:</div>
				<!-- id 세션에서 점주 아이디만 받아오기 -->
				<input type="text" id="memId" name="memId" 
					class="store_input" value="${member.memId}">		
			</div>

			<div>
				<div class="store_label">지점이름:</div>
				<input type="text" id="sName" name="sName" value="${store.sName}" class="stName store_input"> 	
			</div>
			
			
				<input type="text" id="ssNum" name="ssNum" value="${store.ssNum}" class="stName store_input"> 	
				<input type="text" id="cwait" value=0>
		
			
			

			
			<input type="button" id="Bye" value="Bye" class="store_Bye_btn">
		</form>
	</div>
	


<script type="text/javascript">

$(".store_Bye_btn").click(function(){
	
	if(confirm("매장 폐업을 신청하시겠습니까?")){
		$("#form").submit();
		}else{
			alert("취소, 매장 페이지로 돌아갑니다.");
			location.replace("./myInfo");
			};

});
</script>






</body>
</html>
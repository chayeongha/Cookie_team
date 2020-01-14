<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<h1>지점가입</h1>

	<h2>Join</h2>
		<form action="storeInsert" method="post">


			<div>
				<label for="Id">점주 아이디:</label> <!-- id 세션에서 점주 아이디만 받아오기 -->
				<input type="text"id="Id" name="Id" >  <%-- value="${session.memberVO.Id}" --%>
			</div>
			
			<div>
				<label for="sName">지점이름:</label> 
				<input type="text" id="sName" name="sName" placeholder="지점이름을 입력해주세요">
			</div>
			
			<div>
				<label for="sTel">지점전화번호:</label> 
				<input type="text"id="sTel" name="sTel" placeholder="지점의 전화번호를 입력해주세요">
			</div>
			
			<div>
				<label for="sSite">지점주소:</label> 
				<input type="text" id="sSite" name="sSite" placeholder="지점의 주소를 입력해주세요">
			</div>
			
			<div>
				<label for="sOn"></label> <!-- 영업여부 -->
				<input type="hidden"id="sOn" value="0" name="sOn" placeholder="영업시간은 가입후 자세히" readonly="readonly">
			</div>
			
			<div>
				<label for="sNotice"></label> 
				<input type="hidden"id="sNotice" name="sNotice" placeholder="개업시작 공지를 알리세요">
			</div>
			
			<input type="submit" id="join"value="Join">
		</form>




</body>
</html>
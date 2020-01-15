<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<h1>지점업데이트</h1>

	<h2>Update</h2>
	<form action="storeUpdate" method="post">
	
	<input type="hidden" id="sNum" name="sNum" value="${store.sNum}">
		<div>
			<label for="id">점주 아이디:</label>
			<!-- id 세션에서 점주 아이디만 받아오기 -->
			<input type="text" id="id" name="id" value="${store.id}"
				readonly="readonly">
			<%-- value="${session.memberVO.Id}" --%>
		</div>

		<div>
			<label for="sName">지점이름:</label> <input type="text" id="sName"
				name="sName" value="${store.sName}">
		</div>

		<div>
			<label for="sTel">지점전화번호:</label> <input type="text" id="sTel"
				name="sTel" value="${store.sTel}">
		</div>

		<div>
			<label for="sSite">지점주소:</label> <input type="text" id="sSite"
				name="sSite" value="${store.sSite}">
		</div>

		<div>
			<label for="sOn"></label>
			<!-- 영업여부 -->
			<input type="hidden" id="sOn" value="0" name="sOn"
				readonly="readonly">
		</div>

		<div>
			<label for="sNotice"></label> <input type="hidden" id="sNotice"
				name="sNotice" value="">
		</div>

		<input type="submit" id="update" value="Update">
	</form>




</body>
</html>
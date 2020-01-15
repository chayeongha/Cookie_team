<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/store/storeJoin.css" rel="stylesheet" />
<link href="/css/reset.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<div class="storeHeader">

		<div class="store_back">
			<a href="../" style="color: white;"><i class="fa fa-arrow-circle-left" style="font-size: 42px; margin-left: 20px;"></i></a>
		</div>
		<div class="storeJoinTi">지금 바로 매장 등록을 해보세요!</div>
	</div>
	<div class="storeInsertForm">
		<form action="storeInsert" method="post" enctype="multipart/form-data">

			<div>
				<div class="store_label">점주 아이디:</div>
				<!-- id 세션에서 점주 아이디만 받아오기 -->
				<input type="text" id="id" name="id" value="${member.id}"
					class="store_input" readonly="readonly">
			</div>

			<div>
				<div class="store_label">지점이름:</div>
				<input type="text" id="sName" name="sName"
					placeholder="	지점이름을 입력해주세요" class="store_input">
			</div>

			<div>
				<div class="store_label">지점전화번호:</div>
				<input type="text" id="sTel" name="sTel"
					placeholder="	지점의 전화번호를 입력해주세요" class="store_input">
			</div>

			<div>
				<div class="store_label">지점주소:</div>
				<input type="text" id="sSite" name="sSite"
					placeholder="	지점의 주소를 입력해주세요" class="store_input">
			</div>

			<div>
				<label for="sOn"></label>
				<!-- 영업여부 -->
				<input type="hidden" id="sOn" value="0" name="sOn"
					placeholder="	영업시간은 가입후 자세히" readonly="readonly"
					class="store_input">
			</div>

			<div>
				<label for="sNotice"></label> <input type="hidden" id="sNotice"
					name="sNotice" placeholder="	개업시작 공지를 알리세요" class="store_input">
			</div>
			<div>
				<div class="store_label">로고 등록:</div>
				<input type="file" class="store_input" id="files" name="files">

			</div>
			<input type="submit" id="join" value="Join" class="store_join_btn">
		</form>

	</div>


</body>
</html>
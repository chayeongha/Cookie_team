<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/store/storeInfos.css" rel="stylesheet" />
<link href="/css/reset.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="storeHeader">

		<div class="store_back">
			<a href="./myInfo" style="color: white;"><i
				class="fa fa-arrow-circle-left"
				style="font-size: 42px; margin-left: 20px;"></i></a>
		</div>
		<div class="storeJoinTi">매장 상세정보</div>
		<div class="Go_POS">
			<form action="myinfoS" method="post" id="infoGo">
				<button id="goOn">
					<i class="fa fa-power-off" style="font-size: 48px; color: white;"></i>
				</button>
				<div class="POS_Ti">POS</div>
				<input type="text" name="sNum" id="sNum" value="${store.sNum}">
			</form>
		</div>
	</div>




	<div class="storeInfoSection">
		<div class="myStoreDetail">
			<div class="Detail1">매장명 :${store.sName}</div>
			<div class="Detail1">매장 번호: ${store.sTel}</div>
			<div class="Detail1">매장 위치: ${store.roadFullAddr}</div>
		</div>
		<div class="myMoney">
			<div class="myMoney_1">일매출현황</div>
		</div>
	</div>
	<a href="./storeUpdate?sNum=${store.sNum}"><div
			class="Update_storeInfo">
			<i class="fa fa-history" style="font-size: 24px; color: black;"></i>
			Update
		</div></a>




	<script type="text/javascript">
		$("#goOn").click(function() {
			$("#infoGo").submit();
		});
	</script>


</body>
</html>
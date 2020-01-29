<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/store/storeInfos.css" rel="stylesheet" />
<link href="/css/reset.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
				<input type="text" name="ssNum" id="ssNum" value="${store.ssNum}">
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
	<a href="./storeUpdate?ssNum=${store.ssNum}">
		<div class="Update_storeInfo">
			<i class="fa fa-history" style="font-size: 24px; color: black;"></i>
			Update
		</div>
	</a>

	<a href="../menu/menuList?ssNum=${store.ssNum}">메뉴리스트</a>

	
	<input type="hidden" value="${close.cwait}">
	
	
	<c:if test="${close.cwait eq null}">
	<input type="button" id="ByeInsert" value="폐업등록">
	</c:if>
	<c:if test="${close.cwait eq 0}">승인대기중</c:if>
	<c:if test="${close.cwait eq 1}">
	<a href="./deleteStore?ssNum=${store.ssNum}"><input type="button" id="ByeDelete" value="폐업"></a>
	</c:if>
	



	<script type="text/javascript">
		$("#goOn").click(function() {

			$("#infoGo").submit();

		});
	</script>

	<script type="text/javascript">
		$("#ByeInsert").click(function() {
			if (confirm("정말로 폐업을 신청하시겠습니까?")) {
				alert("신청페이지로 넘어갑니다.")
				location.href = "./storeClose";
			} else {
				alert("취소");
				location.replcate = "./";
			}
		});
	</script>

</body>
</html>
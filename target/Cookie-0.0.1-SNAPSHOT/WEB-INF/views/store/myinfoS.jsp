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

<c:if test="${store.memId ne member.memId}">
<c:import url="../error/400error.jsp" />
</c:if>

<c:if test="${store.memId eq member.memId}">


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




	<div class="InfoBox">
		<div class="Update_storeInfo">
			<a href="./storeUpdate?ssNum=${store.ssNum}" style="color: white;">
			<i class="fa fa-history" style="font-size: 24px; color: white;"></i>
			Update
			</a>
		</div>
	<div class="SmenuList">
	<a href="../menu/menuList?ssNum=${store.ssNum}"style="color: white;">메뉴리스트</a>
	</div>
	
	<input type="hidden" value="${close.cwait}">
	
	
	<c:if test="${close.cwait eq null}">
	<input type="button" id="ByeInsert" value="폐업신청">
	</c:if>
	<c:if test="${close.cwait eq 0}"><div class="daeki">승인대기중</div></c:if>
	<c:if test="${close.cwait eq 1}">
	<a href="./deleteStore?ssNum=${store.ssNum}"><input type="button" id="ByeDelete" value="폐업"></a>
	</c:if>
	</div>
	<div class="storeInfoSection">
		<div class="myStoreDetail">
			<div class="Detail1">매장명 :${store.sName}</div>
			<div class="Detail1">매장 번호: ${store.sTel}</div>
			<div class="Detail1">매장 위치: ${store.roadFullAddr}</div>
		</div>
		<div class="myMoney">
			<div class="myMoney_1">재고현황</div>
			<c:forEach items="${list}" var="li">
				<div class="Mname">${li.mmName}</div> 
				<div class="Mcount">${li.mmCount} 개</div>
			</c:forEach>
			
			
		</div>
	</div>
</c:if>
	<script type="text/javascript">
		var OCount = $(".Mcount").val();
		var CCount = $(".Ccount").val();
		var Mnum = $(".MmNum").val();
		var Cnum = $(".CmNum").val();	




		
	</script>	





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
				location.replace = "./";
			}
		});
	</script>

</body>
</html>
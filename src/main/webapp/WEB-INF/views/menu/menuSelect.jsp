<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/reset.css" rel="stylesheet" />
<link href="/css/menu/menuSelect.css" rel="stylesheet" />

</head>
<body>

<div class="storeHeader">
		<div class="AddMenuTi">Menu 상세페이지</div>
	</div>

	<div class="contents">
		<div class="SelectBox">
			<div class="IMGBox">
				<img alt="제품이미지" src="../menu/${vo.menuFiles.mfName}" style="width: 350px; height: 350px;">
			</div>
			<div class="DetailBox">
			<div class="menuN">메뉴명 :${vo.mmName}</div>
			<div class="menuN">가격:${vo.mmPrice}</div>
			<div class="menuN">추가 옵션</div>
			<c:forEach items="${vo.menuOptions}" var="opt">
				<h3>${opt.optName}</h3> 
				<h3>${opt.optPrice}</h3>
			</c:forEach>
			</div>

		</div>
	
		<input type="hidden" id="hssnum" value="${vo.ssNum }"> <input
			type="hidden" id="hmmnum" value="${vo.mmNum }">

		<div class="btnBox">
			<a href="./menuList?ssNum=${vo.ssNum}"> <input type="button" value="리스트로" style="cursor: pointer;"></a> 
			<a href="./menuUpdate?mmNum=${vo.mmNum}"> 
			<input type="button" value="메뉴 수정" style="cursor: pointer;"></a> 
			<input type="button" value="메뉴 삭제" style="cursor: pointer;" id="delbtn">
		</div>
	</div>
	<script type="text/javascript">
		//delete

		var delbtn = document.getElementById('delbtn');
		var mmNum = $("#hmmnum").val();
		var ssNum = $("#hssnum").val();
		delbtn.onclick = function() {
			$.ajax({
				type : "POST",
				url : "./menuDelete",
				data : {
					mmNum : mmNum,
					ssNum : ssNum
				},
				success : function(data) {
					alert("delete Success");
					window.location.href = "./menuList?ssNum=" + ssNum;
				}
			});

		}
	</script>

</body>
</html>
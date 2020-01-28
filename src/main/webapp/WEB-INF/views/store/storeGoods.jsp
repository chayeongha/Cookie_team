<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie order</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/board/boardList.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/store/storeGoods.css" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ba0b2e0894b510063b292edfad86999&libraries=services"></script>
  
</head>
<body>
<div class="body_main">
	<div class="b"></div>
	<!-- 서브 타이틀 -->
	<div class="subTitle_wrap">
		<div class="subTitle_inner">
			<h2>주문하기</h2>
		</div>		
	</div>
	<div class="order">
		<img src="${pageContext.request.contextPath}/images/menu/cart.png">
		<h3 style="display: inline-block;">장바구니</h3>
		<div class="orderBox"></div>
		<button></button>
	</div>
	<div class="innerBox">
			<div class="box1">
				<h1 class="htxt">${storeVO.sName}</h1>
				<div class="htxt2"><h3>* 매장 공지 *</h3>${storeVO.sNotice}</div>
				<input type="hidden" value="${storeVO.roadFullAddr}" id="add">
				<input type="hidden" value="${storeVO.sName}" id="cname">
			</div>
			<div class="box2">
				<div class="htxt2"><h3>* 매장 위치 *</h3>${storeVO.roadFullAddr}<div id="map" style="width:800px;height:350px;margin:0 auto;margin-bottom: 40px"></div>
				</div>
			</div>
			<script>
			var add = $("#add").val();
			var cname = $("#cname").val();
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
			
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
			
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch(add, function(result, status) {
			
					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
			
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
			
					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new kakao.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+cname+'</div>'
					        });
					        infowindow.open(map, marker);
			
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});    	
			</script>
			
			<div class="box3">
				<div class="box3_inner">　# Coffee</div>
				<c:forEach items="${list}" var="vo">
					<c:if test="${vo.menuVO.cmNum eq 1}">
						${vo.menuVO.mmName}
					</c:if>
				</c:forEach>
				<div class="box3_inner">　# Beverage</div>
				<div class="box3_inner">　# Dessert</div>
			</div><!-- box3 끗 -->
		
	</div>
<c:import url="../layout/footer.jsp" />
</div>
</body>
</html>
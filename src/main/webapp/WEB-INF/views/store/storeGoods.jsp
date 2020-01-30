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
		<button class="order2">주 문 하 기</button>
	</div>
	<div class="innerBox">
			<div class="box1">
				<h1 class="htxt">${storeVO.sName}</h1>
				<div class="htxt2"><h3>* 매장 공지 *</h3>${storeVO.sNotice}</div>
				<input type="hidden" value="${storeVO.roadFullAddr}" id="add">
				<input type="hidden" value="${storeVO.sName}" id="cname">
			</div>
			<div class="box2">
				<div class="htxt2"><h3>* 매장 위치 *</h3>${storeVO.roadFullAddr}<br><br><div id="map" style="width:800px;height:350px;margin:0 auto;margin-bottom: 40px"></div>
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
				<c:forEach items="${list}" var="vo" >
					<c:forEach items="${vo.menuVO}" var="vo2" varStatus="i">
						<c:if test="${vo2.cmNum eq 1 }">
							<div class="mselect">
							<input type="button" value="${vo2.mmName}" class="btnclick" data-toggle="modal" data-target="#myModal" title="${vo2.mmNum}" name="optM${vo2.mmNum}">
							<input type="hidden" value="${vo2.menuFiles.mfName}" class="art${vo2.mmNum}">
							<c:forEach items="${vo2.menuOptions}" var="vo3" >
								<input type="hidden" value="${vo3.optName}" class="${vo2.mmNum}">
								<input type="hidden" value="${vo3.optPrice}" class="optM${vo2.mmNum}">
							</c:forEach>
							</div>
							<div class="mselect">
							${vo2.mmPrice}원</div>
							<input type="hidden" value="${vo2.mmPrice}" class="m${vo2.mmNum}">	
						</c:if>
					</c:forEach>
				</c:forEach>
				<div class="box3_inner">　# Beverage</div>
				<c:forEach items="${list}" var="vo">
					<c:forEach items="${vo.menuVO}" var="vo2" varStatus="i">
						<c:if test="${vo2.cmNum eq 2 }">
							<div class="mselect">
							<input type="button" value="${vo2.mmName}" class="btnclick" data-toggle="modal" data-target="#myModal" title="${vo2.mmNum}" name="optM${vo2.mmNum}">
							<input type="hidden" value="${vo2.menuFiles.mfName}" class="art${vo2.mmNum}">
							<c:forEach items="${vo2.menuOptions}" var="vo3">
								<input type="hidden" value="${vo3.optName}" class="${vo2.mmNum}">
								<input type="hidden" value="${vo3.optPrice}" class="optM${vo2.mmNum}">
							</c:forEach>
							</div>
							<div class="mselect">
							${vo2.mmPrice}원</div>
							<input type="hidden" value="${vo2.mmPrice}" class="m${vo2.mmNum}">	
						</c:if>
					</c:forEach>
				</c:forEach>
				<div class="box3_inner">　# Dessert</div>
				<c:forEach items="${list}" var="vo">
					<c:forEach items="${vo.menuVO}" var="vo2" varStatus="i">
						<c:if test="${vo2.cmNum eq 3 }">
							<div class="mselect">
							<input type="button" value="${vo2.mmName}" class="btnclick" data-toggle="modal" data-target="#myModal" title="${vo2.mmNum}" name="optM${vo2.mmNum}">
							<input type="hidden" value="${vo2.menuFiles.mfName}" class="art${vo2.mmNum}">
								<c:forEach items="${vo2.menuOptions}" var="vo3">
									<input type="hidden" value="${vo3.optName}" class="${vo2.mmNum}">
									<input type="hidden" value="${vo3.optPrice}" class="optM${vo2.mmNum}">
								</c:forEach>
							</div>
							<div class="mselect">
							${vo2.mmPrice}원</div>
							<input type="hidden" value="${vo2.mmPrice}" class="m${vo2.mmNum}">							
						</c:if>
					</c:forEach>
				</c:forEach>
			</div><!-- box3 끗 -->
			
			
			  <div class="modal fade" id="myModal" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			        
			        	<h3 style ="border-bottom: 1px solid #ff712d; padding: 20px;">선택 메뉴</h3>
			        	<input type="text" id="cc" readonly="readonly">
			        	<img src="" class="artt" onerror="this.src='../images/header/mm.png'">
			        	<div class="opt">
			        	
			        	</div>
			        	<div class="money">
			        	</div>
			        	<button class="orderGO">담기</button>
			        	<input type="hidden" value="${storeVO.ssNum}" class="ssNum">
			        </div>
			        
			          <button type="button" class="bclose" data-dismiss="modal">취소 X</button>
			        
			      </div>
			      
			    </div>
			  </div>
			  
			  
			  <script type="text/javascript">
			  var menu ="";
			  var j =0;
			  var optTitle =new Array();
			      //음료 선택 모달창
			  	  $(".btnclick").click(function() {
			  		menu = $(this).val();
			  		var n = $(this).prop('title');
			  		
			  		
			  		//파일이름
					var art = "${pageContext.request.contextPath}/menu/"+$(".art"+n).val();
					var money = $(".m"+n).val();
					var optMoney = new Array();
					optTitle =new Array();
					var opt =new Array();
			  		j =0;
			  		
					//옵션
			  		$("."+$(this).prop('title')).each(function(index, item){
						opt[index] = $(this).val();
						j = index+1;
					  });

					//옵션가격
					$("."+$(this).prop('name')).each(function(index,item){	
						optMoney[index] = $(this).val();
						optTitle[index] = "title"+index
					});

					
			  			if(${sessionScope.member eq null}){
			  				alert("로그인을 해주세요");
			  				location.href="../member/memberLogin";
			  				
			  			}else{
				  			$(".artt").attr('src',art);
			  				$("#cc").val(menu);
			  				$(".opt").empty();
			  				$(".money").empty();
			  				$(".money").append("<div class='moneyBox'><input type='text' readonly='readonly' class='moneyTotal' value='"+money+"'>　원</div>");
			  				if(j>0){
				  				$(".opt").append("<div class='optTitle'>옵션 추가</div>");

				  				}
						   	for(var i=0; i<j;i++){
							   
							   	$(".opt").append("<input type='text' class='opttt "+optTitle[i]+"' readonly ='readonly' value ='"+opt[i]+"'>"
									   	+"<input type='button' value='-' class='m' title='"+optTitle[i]+"'name='"+optMoney[i]+"'>"
									   	+"<input type='text' class='optCount' id='"+optTitle[i]+"' readonly ='readonly' value='0'>"
									   	+"<input type='button' value='+' class='p' title='"+optTitle[i]+"'name='"+optMoney[i]+"'>");
							}
		  				}

			  	  });

			  	  //옵션 +
			  	  $("body").on("click",".p",function(){
				  	  var num = Number($(this).prop('name'));
				  	  var money = Number($(".moneyTotal").val());
				  	  
				  	  var pid = $(this).prop('title');
				  	  var op = $("#"+pid).val();
				  	  if(op<10){
					  	op++;
					  	$("#"+pid).val(op);  
				  	    money = money + num;
					  }else{
						  alert("더이상 추가할 수 없습니다");
						 
						}
				  	  $(".moneyTotal").val(money);
				   });

				//옵션 -
			  	$("body").on("click",".m",function(){
				  	  var num = Number($(this).prop('name'));
				  	  var money = Number($(".moneyTotal").val());
				  	  	  	  
				  	  var pid = $(this).prop('title');
				  	  op = $("#"+pid).val();
				  	  if(op>0){
					  	op--;
					  	$("#"+pid).val(op);  
				  	    money = money - num;
					  }else{
						  alert("추가된 옵션이 없습니다.");
						 
						}
				  	  $(".moneyTotal").val(money);
				   });
				   

				//장바구니 담기
			  	$("body").on("click",".orderGO",function(){
					var ssNum = $(".ssNum").val();
					
				  	var moneyTotal = $(".moneyTotal").val();
				  	var optName = new Array();
				  	var optCountt =new Array();
				  	var optList = new Array();
				  	//옵션이 포함된 음료
				  	if(j>0){
					  	for(var k in optTitle){
						  	optCountt[k] = $("#"+optTitle[k]).val();
							optList[k] = $("."+optTitle[k]).val();
						  }
					}

				  	jQuery.ajaxSettings.traditional = true;
			  		$.ajax({
  						url:"./storeCart",
  						type:'GET',
  						
  						data:{
  							"moneyTotal":moneyTotal,
  							"menu":menu,
  							"ssNum":ssNum,
  							"optCountt":optCountt,
  							"optList":optList
  						},
  						success : function() {
  				            $(".orderBox").html();
  				      
  				            
  				         },
  						error:function(){
  							alert("실패");
  						}
  						
  						
  					});
			  		
			    });
  	  
  	</script>
		
	</div>
<c:import url="../layout/footer.jsp" />
</div>
</body>
</html>
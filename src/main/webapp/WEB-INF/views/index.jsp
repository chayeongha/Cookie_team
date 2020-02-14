<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<title>Cookie Order Main</title>
<link href="/css/reset.css" rel="stylesheet"/>
<link href="/css/header.css" rel="stylesheet"/>
<link href="/css/body.css" rel="stylesheet"/>
<link href="/css/footer.css" rel="stylesheet"/>
<link href="/css/main/main_body.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=df2f1bd915d5ed98ee4e1782f47aff61&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">

</script>
</head>
<body>

	<c:import url="./layout/header.jsp" />

	<!-- body -->	
	<div class="body_main">
		<div class="b"></div>
		<div class="bar">
			<div class="bar_inner">
				<ul>
					<li class="barselect"><a href="#m1">1</a></li>
					<li class="barselect"><a href="#m2">2</a></li>
					<li class="barselect"><a href="#m3">3</a></li>
					<li class="barselect"><a href="#m4">4</a></li>
					<li class="barselect"><a href="#m5"><img src="./images/main/top.png" style="width: 50px; height: 50px"></a></li>
				</ul>
			</div>
			<!-- <a href="#"><img src="./images/main/top.png"></a> -->
		</div><!-- bar 끝 -->
		<div class="m_1_top" id="m5">
			<div class="m_1">
				<h4>아직도 매장에서 주문하고 계시나요?</h4>
				<h1>Cookie Order</h1>
				<p style="font-size: 25px;">매장에서 음식을 먹든, 테이크아웃을 하든 초간편 웹으로 미리 주문하세요.</p>
				<p style="font-size: 25px; margin-bottom: 30px;">단, 1초도 기다릴 필요가 없습니다.</p>
				<!-- <img src="./images/main/mainC.gif"> -->
				<div>
					<div class="m1_img m1_img1"></div>
					<div class="m1_img m1_img2"></div>
					<div class="m1_img m1_img3"></div>
					<div class="m1_img m1_img4"></div>
					<div class="m1_img m1_img5"></div>
				</div>
				<div class="m_1inner2"></div>
			</div>
		</div><!-- m_1_top끝 -->
		<div class="m1_top2"></div>
		<p class="m1_t2">바쁜 현대인의 주문 솔루션 Cookie Order</p>
		<div style="height: 400px; overflow: hidden;">
			<div class="m1_t2_1">
				<img style="margin-left:110px; margin-top:20px"src="./images/main/ic-feature-01.png">
				<div class="m1_t2_txt">
					<h2 style="font-family: CookieRun-Black; margin-top:10px">줄서지 않고, 쉽고 빠르게</h2>
					<p>선 주문/결제로 매장에서 줄 서지 않고,<br>바로 음식과 음료를 즐기시거나<br> 테이크아웃하세요.</p>
				</div>
			</div>
			<div class="m1_t2_2">
				<img style="margin-left:110px; margin-top:20px"src="./images/main/ic-feature-02.png">
				<div class="m1_t2_txt">
					<h2 style="font-family: CookieRun-Black; margin-top:10px">지금 있는 곳에서 주문하기</h2>
					<p>종업원에게 메뉴, 포인트 적립 여부를 <br>설명할 필요 없어요.</p>
				</div>
			</div>
			<div class="m1_t2_3">
				<img style="margin-left:110px; margin-top:20px"src="./images/main/ic-feature-03.png">
				<div class="m1_t2_txt">
					<h2 style="font-family: CookieRun-Black; margin-top:10px">전국 어디서나 다양한 매장</h2>
					<p>프렌차이즈가 아닌 일반 매장에서도<br> 선주문하세요</p>
				</div>
			</div>
		</div><!-- 위에끝 -->
		<div class="main_box"></div><!-- 위에 짝대기 -->
		
		<div class="main_1" id="m1">
			<div class="main_title">이용방법</div>
			<div class="main_1_inner">
				<div class="main_1_1"></div>
					<div class="main_1_1_txt"><h1 style="font-family: CookieRun-Black; text-align:left;">Step1. 고객의 주문</h1>
					<br><br>
					<span>쿠키오더 홈페이지를 통해 <br>근처에 있는 매장을 선택한 후 <br>메뉴를 주문하세요.</span>
					</div>
			</div>
			<div class="main_1_down"></div>

			<div class="main_1_inner">
				<div class="main_1_2"></div>
					<div class="main_1_1_txt"><h1 style="font-family: CookieRun-Black; text-align:left;">Step2. 주문 접수</h1>
					<br><br>
					<span>점주가 주문을 확인하고 <br>결제를 승인합니다.</span>
					</div>
			</div>
			<div class="main_1_down"></div>
			
			<div class="main_1_inner">
				<div class="main_1_3"></div>
					<div class="main_1_1_txt"><h1 style="font-family: CookieRun-Black; text-align:left;">Step3. 음식/음료 제조</h1>
					<br><br>
					<span>주문한 음료/음식이 완료되면 <br>고객에게 완료 알람이갑니다.</span>
					</div>
			</div>
			<div class="main_1_down"></div>
			
			<div class="main_1_inner">
				<div class="main_1_4"></div>
					<div class="main_1_1_txt"><h1 style="font-family: CookieRun-Black; text-align:left;">Step3. 음식/음료 제공</h1>
					<br><br>
					<span>매장을 방문한 고객에게 <br>주문한 음식/음료를 제공합니다.</span>
					</div>
			</div>
			
		</div><!-- main_1끝 -->
		
		<div class="main_2" id="m2">
			<div class="main_title2"><br>Cookie Order에 등록이 아직 안 되어있는 점주님!</div>
			<div class="main_box2"></div>
			<h2 style="text-align: center;font-family: CookieRun-Black; width:1500px">인건비는 줄이고, 매출을 늘리세요</h2>
			<div class="main_2_inner">
				<div class="main_2_img"></div>
				<div class="main_2_txt">
					<ul>
						<li><img src="./images/main/check-line.png"><span>　선주문접수 시스템으로 인건비를 줄여보세요.</span></li>
						<li><img src="./images/main/check-line.png"><span>　맞춤형 광고 진행으로 매장 홍보를 지원해드려요.</span></li>
						<li><img src="./images/main/check-line.png"><span>　매장별, 시간대별 자체적인 할인혜택 적용으로 매출을 늘리세요.</span></li>
					</ul>
					<h2 style="text-align: center;font-family: CookieRun-Black; line-height:30px;letter-spacing: 0px;">이미 제휴매장의 월 매출이 상승하고 있습니다!
					<br>초기 진입하셔서 매출 증대의 기회를 놓치지 마세요!</h2>
					<button class="storebtn">점주 회원가입</button>
				</div>
			</div><!-- main2_inner끝 -->
		</div><!-- main_2끝 -->
		
		<div class="main_3" id="m3">
			<h1 style="text-align: center;font-family: CookieRun-Black; padding:45px; color:#181818;width:1400px;">주문가능한 매장을 찾아보세요!</h1>
			<div id="map" style="width:1100px;height:400px;"></div>
		</div>
		
		<div class="main_4" id="m4">
			<div class="main_title2" style="width: 1480px;">적립금도 UP! 혜택도 UP!</div>
			<div class="main_4_box"></div><!-- main4 짝대기 -->
			<div class="main_4_inner">
				<div class="main_4_img"></div>
				<div class="main_4_txt">
					<h1 style="text-align: center;font-family: CookieRun-Black;letter-spacing: 0px">더 커진 혜택!</h1>
					<h1 style="text-align: center;font-family: CookieRun-Black;letter-spacing: 0px">더 높아진 적립금!</h1>
					<br>
					<span>기존 적립금보다 더 높아진 적립금으로 <br>만나볼 수 있습니다.</span>
				</div>
				<div class="m4_img2">
				</div>
			</div>
		</div>
		<br>
		<c:forEach items="${ar}" var="vo" >
			<input type="hidden" value="${vo.sName}" class="cName">
			<input type="hidden" value="${vo.roadFullAddr}" class="cAddr">
		</c:forEach>
		<c:import url="./layout/footer.jsp" />
	</div><!-- bodymain끝 -->
	
	<script type="text/javascript">
			 $(document).on('click','.barselect a',function(event){
				 var headerHeight = $('.bar_inner').outerHeight();
				  event.preventDefault();
				  	$("html,body").animate({
				    	scrollTop : $(this.hash).offset().top
				    },300)
				  });
			 
			
	</script>
	
	
	<script type="text/javascript">
		var v = [];
		var b = [];
						
		
	document.addEventListener("DOMContentLoaded", function() {
		var cName = new Array();
		$(".cName").each(function(index){
			cName.push($(this).val());	
		});
		var cAddr = new Array();
		$(".cAddr").each(function(index){
			cAddr.push($(this).val());	
			
		});

		
		

		
		
    function getLocation(position) {
		
		
        var latitud = position.coords.latitude;
        var longitude = position.coords.longitude;
    	
        var mapContainer = document.getElementById("map")    // 지도를 표시할 DIV
        var mapOption = {
              center : new daum.maps.LatLng(latitud, longitude),    // 지도의 중심좌표
              level : 2    // 지도의 확대레벨
        };

        var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 



		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소-좌표 변환 객체를 생성합니다
		//위도 경도 구하기
		for(var j=0; j<cAddr.length; j++){

			geocoder.addressSearch(cAddr[j], function(result, status) {	
				 if (status === kakao.maps.services.Status.OK) {
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						v.push(result[0].y);
						b.push(result[0].x);
				}
				//마커 찝을 위치
					var positions = new Array();
					for(var i=0; i<cName.length;i++){
						
						positions[i] =
						    	{
						    		
						        	title: cName[i], 
						        	latlng: new kakao.maps.LatLng(v[i], b[i])
						    	}		
					}

					for (var i = 0; i < positions.length; i ++) {
			            
			            // 마커 이미지의 이미지 크기 입니다
			            var imageSize = new kakao.maps.Size(24, 35); 
			            
			            // 마커 이미지를 생성합니다    
			            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			            
			            // 마커를 생성합니다
			            var marker = new kakao.maps.Marker({
			                map: map, // 마커를 표시할 지도
			                position: positions[i].latlng, // 마커를 표시할 위치
			                title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			                image : markerImage // 마커 이미지 
			            });
			        }     

				
			});
		}
		
		   
		//console.log(v);
		//console.log(b);
		//console.log(positions);
        
        
        
		        // 지도를 생성
		        var map = new daum.maps.Map(mapContainer, mapOption);
		        // 마커가 표시될 위치
		        var markerPosition = new daum.maps.LatLng(latitud, longitude);
		        // 마커를 생성
		        var marker = new daum.maps.Marker({ position:markerPosition });
		        marker.setMap(map);
		    }
		    if(navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(getLocation, function(error) {
		            consol.log(error.message);    
		        });
		    } else {
		        consol.log("Geolocation을 지원하지 않는 브라우저 입니다.");
		    }
		});
			

		
	</script>

</body>
</html>
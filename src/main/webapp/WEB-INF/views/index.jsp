<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="/css/reset.css" rel="stylesheet"/>
<link href="/css/header.css" rel="stylesheet"/>
<link href="/css/body.css" rel="stylesheet"/>
<link href="/css/footer.css" rel="stylesheet"/>
<link href="/css/main/main_body.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6ba0b2e0894b510063b292edfad86999"></script>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        function getLocation(position) {

            var latitud = position.coords.latitude;
            var longitude = position.coords.longitude;
        	
            var mapContainer = document.getElementById("map")    // 지도를 표시할 DIV
            var mapOption = {
                  center : new daum.maps.LatLng(latitud, longitude),    // 지도의 중심좌표
                  level : 2    // 지도의 확대레벨
            };
            
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
</head>
<body>

	<!-- header -->
	<div class="header1">
		<div class="h1_1">
			<div class="h1_txt"><a href="#">Join</a></div>
			<div class="h1_txt"><a href="#">Login</a></div>
		</div>
	</div><!-- 위에 헤더 -->
	<div class="header2">
		<div class="h_img">
			<div class="M_imgg"></div>
		</div><!-- 이미지 -->
		<br><br>
		<div class="cate_1">Cookie</div>
		<div class="cate_2">Order</div>
		<div class="cate">
			<p><a href="#">제휴매장</a></p>
			<p><a href="#">공지사항</a></p>

			<p><a href="#">이용후기</a></p>
			<p><a href="#">Q & A</a></p>
			<p><a href="#">매장등록</a></p>
		</div>
		
	</div><!-- 왼쪽 헤더 -->
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
		<!-- footer -->
		<div class="footer">
			<div class="footer_inner">
				<div class="f_title">Cookie Order</div>
				<div class="f_inner">(주)쿠키오더 | 대표 : 쿠키맨 | 사업자 등록번호. 202-00-11400 | 주소. 서울 마포구 쌍용강북센터
				<br>고객센터 | Q & A
				</div>
			</div>
		</div>
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

</body>
</html>
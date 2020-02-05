<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/css/store/storehead.css" rel="stylesheet" />
<link href="/css/reset.css" rel="stylesheet" />
<!--clock js-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//cdn.kaazing.com/releases/enterprise.javascript.client/4.1.0/WebSocket.js"></script>
<script src="//cdn.kaazing.com/releases/enterprise.javascript.client/4.1.0/AmqpClient.js"></script>
<script src="//cdn.kaazing.com/releases/enterprise.javascript.client/4.1.0/JmsClient.js"></script>
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>



</head>
<body>


	<div class="storeHeader">
		<div class="header_Update">

			<a href="./myInfo" style="color: white; font-weight: bold;">My 매장</a>
		</div>
	</div>

	<div class="storesection">
		<div class="storesection_1">
			<div class="clock_icon" style="width: 30px; float: left;">
				<i class="fa fa-clock-o"
					style="font-size: 42px; color: black; margin-top: 5px; margin-left: 10px;">
				</i>
			</div>
			<body onload="printClock()">
				<div style="width: 270px; height: 30px; margin-top: 10px; float: left; font-family: CookieRun-Black; line-height: 30px; color: black; font-size: 36px; text-align: center;"
					id="clock"></div>
				<button class="section_ok" id="finish">완료목록</button>
				<!-- <button class="section_ok" id="wait">대기</button> -->
				<div class="section_title">Cafe ManageMent</div>
		</div>
		<div class="storesidebar">
			<button class="side1" id="Order">주문대기</button>
			<button class="side1" id="QnaT">리뷰관리</button>
			<button class="side1" id="ReviewT">공지사항</button>
			<button class="side1" id="Money">매출</button>
		</div>
		<div class="storeNextSide"></div>
	</div>




	<div class="storeFooter">
		<form action="storeMyPage" method="post" id="infoBye">
			<input type="hidden" name="ssNum" id="ssNum" value="${store.ssNum}">
			<button class="power_button" id="goOff">
				<i class="fa fa-power-off" style="font-size: 48px; color: white;"></i>
			</button>
		</form>
	</div>




	<script type="text/javascript">
		function printClock() {

			var clock = document.getElementById("clock"); // 출력할 장소 선택
			var currentDate = new Date(); // 현재시간
			var calendar = currentDate.getFullYear() + "-"
					+ (currentDate.getMonth() + 1) + "-"
					+ currentDate.getDate() // 현재 날짜
			var amPm = 'AM'; // 초기값 AM
			var currentHours = addZeros(currentDate.getHours(), 2);
			var currentMinute = addZeros(currentDate.getMinutes(), 2);
			var currentSeconds = addZeros(currentDate.getSeconds(), 2);

			if (currentHours >= 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
				amPm = 'PM';
				currentHours = addZeros(currentHours - 12, 2);
			}

			if (currentSeconds >= 50) {// 50초 이상일 때 색을 변환해 준다.
				currentSeconds = '<span style="color:black;">' + currentSeconds
						+ '</span>'
			}
			clock.innerHTML = currentHours
					+ ":"
					+ currentMinute
					+ ":"
					+ currentSeconds
					+ " <span style='font-size:36px; font-family: CookieRun-Black;'>"
					+ amPm + "</span>"; //날짜를 출력해 줌

			setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
		}

		function addZeros(num, digit) { // 자릿수 맞춰주기
			var zero = '';
			num = num.toString();
			if (num.length < digit) {
				for (i = 0; i < digit - num.length; i++) {
					zero += '0';
				}
			}
			return zero + num;
		}
		
	</script>

	<script type="text/javascript">
		$("#goOff").click(function() {
			$("#infoBye").submit();
		});
	</script>

	<script type="text/javascript">
	/*공지사항*/
		$("#ReviewT").click(function(){
			var ReviewT = $(".storesidebar > #ReviewT");
			var order = $(".storesidebar > #Order");
			ReviewT.css("background-color","#ffd6c8");
			order.removeAttr("style");
			/* var order = $(".storesidebar > #Order").css("background-color","white"); */
			
		$.ajax({
				url : "../store/storeNotice",
				type : 'GET',

				success : function(data) {
					$(".storeNextSide").html(data);
						alert(data);
				},
				error : function() {
					alert("실패");
				}

			});
		});

		var ssNum =$("#ssNum").val();


		/*주문*/
		$("#Order").click(function(){
			var order = $(".storesidebar > #Order").css("background-color","#ffd6c8");
			/* var ReviewT = $(".storesidebar > #ReviewT").css("background-color","white"); */
			var ReviewT = $(".storesidebar > #ReviewT");
			ReviewT.removeAttr("style");
			
		$.ajax({
				url : "../orders/orderListSS",
				type : 'GET',
				data : {
						"ssNum":ssNum
					},
				success : function(data) {
					$(".storeNextSide").html(data);
					alert(data);
				},
				error : function() {
					alert("실패");
				}

			});
		});

		/*제조 완료일떄*/
		$("#finish").click(function(){

			$.ajax({
				url : "../orders/orderListSSF",
				type : 'GET',
				data : {
						"ssNum":ssNum
					},
				success : function(data) {
					$(".storeNextSide").html(data);
					alert(data);
				},
				error : function() {
					alert("실패");
				}

			});


			
			});
		
		/*제조 대기일때  */
		

		/*리뷰관리*/
		
		
		
		
		
		/*매출관리*/
		
		
	</script>


	




</body>
</html>
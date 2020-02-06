<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<link href="/css/member/searchIdPw.css" rel="stylesheet"/>
</head>
<body>
	
	
<div class="body_main">
	<div class="b"></div>	
	

	<div class="full">
		<div class="container">
			
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-white">

					<h1 class="mainTxT">아이디/비밀번호 찾기</h1>
					<p> 인증된 이메일만 정보 찾기가 가능합니다.</p>
				</div>
				<div class="searchBigBox">
					<div class="searchBox ">
						<input type="radio" class="searchBox" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
						<label class=""	for="search_1">아이디 찾기</label>
					</div>
					<div class="searchBox ">
						<input type="radio" class="searchBox" id="search_2" name="search_total" onclick="search_check(2)"> 
						<label class="" for="search_2">비밀번호 찾기</label>
					</div>
				</div>
				<!--아이디검색일때  -->
				<div id="searchI" >
					
						<div class="idpw">
							<label class="" for="inputName_1">NAME</label>
							<input type="text" class="nameCheck" id="inputName_1" name="name" placeholder="ex)차영하">
						</div>
						<div class="idpw">
							<label class="" for="inputPhone_1">PHONE</label>
							<input type="text" class="phoneNum" id="inputPhone_1" name="phone" placeholder="ex) 010-7777-9999" onKeyup="inputPhoneNumber(this);" maxlength="13" >
						</div>
						
						<div class="form-group">
							<button id="idConfirm" type="button" class="bbtn">확인</button>
							<button id="searchBtn" onclick="sendSms();" type="button" class="bbtn" data-toggle="modal" data-target="#myModal" style="display:none">인증번호 받기</button>
							<!-- 문자인증 작동하려면 집어넣기 onclick="sendSms();" -->
						</div>
				</div>
			
				<!--비밀번호검색일때  -->
				<div id="searchP" style="display: none;">

					<form action="sendEmail" method="get">
						<p> 아래 이메일주소를 입력하시면,
							<br> 입력하신 이메일로 새암호를 보내드립니다.<br>
						</p>
						<br>
						<div class="idpw">
							<label class="" for="inputId">아이디</label>
							<input type="text" class="" id="inputId" name="memId" placeholder="ex) godmisu">
						</div>
						<div class="idpw">
							<label class="" for="inputEmail">E-Mail</label>
							<input type="email" class="" id="inputEmail"	name="email" placeholder="ex) E-mail@gmail.com">
						</div>
						
						
						<button id="pwConfirm" type="button" class="bbtn" >확인</button>
						<button id="searchBtn2" type="submit" class="bbtn" style="display:none">임시번호 보내기</button>
						
					</form>
				</div>
				
				<div class="loginGoBox">
					<a class="loginGO" href="./memberLogin">로그인 화면으로 돌아가기</a>
				</div>
			
			</div>
			
		</div>
	</div>
	
	<!-- Modal --><!--fade는 투명 효과  -->
	<div id="myModal" class="modal fade" role="dialog"> 
	  
		  <div class="modal-dialog">
		
		    <div class="modal-content">
		      
			      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">x</button>
				        <h4 class="modal-title">인증페이지</h4>
			      </div>
		     
			     <div class="modal-body">
						
						<div class="attc" style="display: block">
				  			<div class="timer" style="display: none">
		 						<div id="ViewTimer"></div>
		 						<button class="btn btn-warning exTime">시간연장</button>
							</div>
							
							<br>
				  			<b>인증번호 입력</b> 
					        <input type="text" name="sms" id="sms" placeholder="인증 번호 입력" /> 
					        <button onclick="phoneCheck();">인증</button>
					     </div> 
						<!--인증번호 입력시 나오는 아이디값  -->
				        <div class="findedId" style="display: none; color: blue;">
							찾은아이디
						</div>
			      </div>
		      
			      <div class="modal-footer">
			        	<button type="button" class="btn btn-default close" data-dismiss="modal" >Close</button>
			      </div>
		   
		    </div>
		
		  </div>
	</div>
	<!--모달창 끝  -->

	

<script type="text/javascript">

		//찾기종류 선택시 디스플레이가 none이되는 스크립트
		function search_check(num) {
			if (num == '1') {
				document.getElementById("searchP").style.display = "none";
				document.getElementById("searchI").style.display = "";	
			} else {
				document.getElementById("searchI").style.display = "none";
				document.getElementById("searchP").style.display = "";
			}
		}
		
		/*~~~~~~~~~~~~~~~~~~~~~아이디찾기~~~~~~~~~~~~~~~~~~~~~~~~~~  */
		//이름 정규식(한글과 영어만가능하도록.) 완료시주석해제하기
// 		var nameRule =/^[가-힣a-zA-Z]+$/;

// 		 $(".nameCheck").blur(function(){
// 				if($('#inputName_1').val() != "" && nameRule.test($('#inputName_1').val()) != true){
// 					alert("한글이나 영어만 사용가능합니다");
// 					$('#inputName_1').val("");
// 					$('#inputName_1').focus();
// 					return;
// 				}	
// 		 });	 

		//연락처 정규식
		var phoneRule = /^(?:(010-?\d{4})|(01[1|6|7|8|9]-?\d{3,4}))-?\d{4}$/;

		$(".pCheck").blur(function(){
			if($('#inputPhone_1').val() != "" && phoneRule.test($('#inputPhone_1').val()) != true){
				alert("휴대폰 번호 형식에 맞게 입력해주세요");
				$('#inputPhone_1').val("");
				$('#inputPhone_1').focus();
				return;
			}	
		});

		//연락처 입력시 자동으로 하이푼입력되는것.
		function inputPhoneNumber(obj) {
	
		    var number = obj.value.replace(/[^0-9]/g, "");
		    var phone = "";
		
		    if(number.length < 4) {
		        return number;
		    } else if(number.length < 7) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3);
		    } else if(number.length < 11) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 3);
		        phone += "-";
		        phone += number.substr(6);
		    } else {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 4);
		        phone += "-";
		        phone += number.substr(7);
		    }
		    obj.value = phone;
		}
		
		//타이머
		var SetTime = 1000;	// 최초 설정 시간(기본 : 초)

		// 1초씩 카운트
		function msg_time() {	
			m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";// 남은 시간 계산
			
			var msg = "인증번호가 유효한 시간은 <font color='red'>" + m + "</font> 입니다.";
			
			document.all.ViewTimer.innerHTML = msg;// div 영역에 보여줌 
					
			SetTime--;// 1초씩 감소
			
			if (SetTime < 0) {			// 시간이 종료 되었으면..	
				clearInterval(tid);	// 타이머 해제
			}
		}
		//window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };타이머가 시작하는거.
		
		//아이디찾기에서 이름과 폰번호과 같은지 검증
		$("#idConfirm").click(function(){
			$.ajax({
				url:"idSearch",
				type: "POST",
				data: {
					name : $('#inputName_1').val(),
					phone :$('#inputPhone_1').val()	
				},
				success : function(data){
					if(data != ""){
						alert("입력하신 정보가 일치합니다.");
						$('#inputName_1').prop('readonly', true);
						$('#inputPhone_1').prop('readonly', true);
						$('#searchBtn').css('display' , 'block');	
						$('#idConfirm').css('display' , 'none');
						$(".findedId").html("회원님의 ID는 \""+data+"\"입니다.");	
					}else{
						alert("입력하신 정보가 일치하지 않습니다.");
						$('#inputName_1').val("");
						$('#inputPhone_1').val("");
					}		
				}
			});	
		});

		//인증번호 보내기..
		function sendSms() {
			$.ajax({ 
				url: "sendSms", 
				type: "POST", 
				data: { 
					receiver: $(".phoneNum").val()
				}, 
				success: function(data) { 
					if (data != null) { 
					//alert("인증번호 전송");
					$('.timer').css('display' ,'block');
					SetTime=60;//타이머시간을 다시정해준후
					tid=setInterval('msg_time()',1000);//타이머를 시작
					}else {
					alert("인증번호 전송 실패"); 
					}
				} 
			}); 
		} 
	
		//입력한 인증번호가 맞는지 검증..
		function phoneCheck() { 
			$.ajax({ 
				url: "smsCheck", 
				type: "POST", 
				data: { code: $("#sms").val(),
						   SetTime : SetTime
				 }, 
				success: function(result) {
					if(SetTime >0){
						 if (result == "ok") { 
							alert("번호 인증 성공");
							//모달창 닫기 참고
				 			//$('#myModal').modal("hide");
				 			$('.findedId').css('display' , 'block');
				 			$('.attc').css('display' , 'none');
						
				 			//모달창 닫기했을때 지정된주소로~
							$('.close').click(function(){
								location.href="searchIdPw";
							});
						 }else{
					 		alert("인증 실패; 다시입력하세요.");	
						 } 
					}else{
						alert("유효시간이 지났습니다 다시시도하세요")
						$('#myModal').modal("hide");
					}
				}	
			}); 
		}
		
		var count =0;

		//인증시간연장
		$('.exTime').click(function(){
			if(count<1){
			SetTime=60;
			count++;
			}else{
				alert("유효시간 연장은 한번만 가능합니다.")
			}
			
		});

		/*~~~~~~~~~~~~~~~~~~~~~아이디찾기 끝~~~~~~~~~~~~~~~~~~~~~~~  */
		
		/*~~~~~~~~~~~~~~~~~~~~비밀번호 찾기~~~~~~~~~~~~~~~~~~~~~~~~~~  */
		$("#pwConfirm").click(function(){
			//alert("test");
			$.ajax({
				url : "pwSearch",
				type : "POST",
				data : {
					memId : $('#inputId').val(),
					email : $('#inputEmail').val()
				},
				success: function(data){
					alert(data);
				}
			});
		});
		/*~~~~~~~~~~~~~~~~~~~~비밀번호 찾기 끝~~~~~~~~~~~~~~~~~~~~~~~~  */
	
</script>
	
	<c:import url="../layout/footer.jsp" />
</div>

</body>
</html>
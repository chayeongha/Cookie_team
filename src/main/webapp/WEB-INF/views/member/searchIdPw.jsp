<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<c:import url="../template/boot.jsp" />
</head>
<body>
	
	<div class="full">
		<div class="container">
			
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-white">
					<h1>아이디/비밀번호 찾기</h1>
					<p>인증된 이메일만 정보 찾기가 가능합니다 :)</p>
				</div>
				<br>
				
				<div style="margin-bottom: 10px; display: inline;" class="custom-control custom-radio custom-control-inline" >
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-white"	for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline" style="display: inline;">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold text-white" for="search_2">비밀번호 찾기</label>
				</div>
				
				<!--아이디검색일때  -->	
				<div id="searchI" style="display: inline">
						<div class="form-group">
							<label class="font-weight-bold text-white" for="inputName_1">이름</label>
							<div>
								<input type="text" class="form-control nameCheck" id="inputName_1" name="name" placeholder="ex)차영하">
							</div>
						</div>
						<div class="form-group">
							<label class="font-weight-bold text-white" for="inputPhone_1">휴대폰번호</label>
							<div>
								<input type="text" class="form-control phoneNum" id="inputPhone_1" name="phone" placeholder="ex) 010-7777-9999" onKeyup="inputPhoneNumber(this);" maxlength="13" >
							</div>
						</div>
						<div class="form-group">
							<button id="idConfirm" type="button" class="btn btn-primary btn-block" style="display: inline;">확인</button>
							<button id="searchBtn" type="button" class="btn btn-warning btn-block"  style="display: none;" data-toggle="modal" data-target="#myModal">인증번호 받기</button>
							문자인증 작동하려면 집어넣기 onclick="sendSms();"
						
							<!--타이머테스트  -->
							<div class="timer" style="display: inline">
		 						<div id="ViewTimer"></div>
								<button class="btn btn-warning exTime">시간연장</button>
							</div>
							
						</div>
				</div>
			
				<!--비밀번호검색일때  -->
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId" name="inputId_2" placeholder="ex) godmisu">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="inputEmail_2"	name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn2" type="button" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
				</div>
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
						
						<div class="attc" style="display: inline">
<!-- 				  			<div class="timer" style="display: none"> -->
<!-- 		 						<div id="ViewTimer"></div> -->
<!-- 							</div> -->
							
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

	<a class="btn btn-danger" href="${pageContext.request.contextPath}/">쿠키로</a>

<script type="text/javascript">

		//폰넘버입력시 자동으로 하이푼입력되는것.
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

		//다완료했을때 주석풀기.
		//이름 정규식
// 		var nameRule =/^[\u3131-\u318E\uAC00-\uD7A3]*$/; //아마 이렇게 써야되는 이유는 utf-8과의 인코딩문제라고함.

// 		 $(".nameCheck").blur(function(){
// 				 if($('#inputName_1').val() != "" && nameRule.test($('inputName_1').val()) != true){
// 					alert("한글로만 사용해주세요");
// 					$('inputName_1').val("");
// 					$('inputName_1').focus();
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
		
		//타이머
		var SetTime = 5;	// 최초 설정 시간(기본 : 초)

		// 1초씩 카운트
		function msg_time() {	
			m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";// 남은 시간 계산
			
			var msg = "인증번호가 유효한 시간은 <font color='red'>" + m + "</font> 입니다.";
			
			document.all.ViewTimer.innerHTML = msg;// div 영역에 보여줌 
					
			SetTime--;// 1초씩 감소
			
			if (SetTime < 0) {			// 시간이 종료 되었으면..	
				clearInterval(tid);		// 타이머 해제
				alert("유효시간이 초과하였습니다. 다시시도해주세요.");	
			}
		}
		//window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
		
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
						$('#searchBtn').css('display' , 'inline');	
						$('#idConfirm').css('display' , 'none');
						$(".findedId").html("회원님의 ID는 \""+data+"\"입니다.");	
						//타이머테스트~~~~~~~~~~~~~~~~~~~~~~~~~~~~~테스트하고지우자~~~~
						//$('.timer').css('display' ,'inline');
						SetTime=10;
						tid=setInterval('msg_time()',1000);
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
					SetTime=120;
					$('.timer').css('display' ,'inline');
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
				data: { code: $("#sms").val() }, 
				success: function(result) {
					 if (result == "ok") { 
						alert("번호 인증 성공");
						//모달창 닫기 참고
			 			//$('#myModal').modal("hide");
			 			$('.findedId').css('display' , 'inline');
			 			$('.attc').css('display' , 'none');

			 			//모달창 닫기했을때 지정된주소로~
						$('.close').click(function(){
							location.href="searchIdPw";
						});
					 }else{
				 		alert("인증 실패; 다시입력하세요.");	
					 } 
				}
			}); 
		}
		var count =0;
		//인증시간연장
		$('.exTime').click(function(){
			if(count<1){
			SetTime=10;
			count++;
			}else{
				alert("시간연장은 한번만 가능합니다.")
			}
			
		});
		
</script>


</body>
</html>
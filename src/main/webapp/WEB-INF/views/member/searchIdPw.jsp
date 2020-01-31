<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디비밀번호검색</title>
<c:import url="../template/boot.jsp" />
</head>
<body>
	
	<%-- <%@ include file="/WEB-INF/views/modal/userIdSearchModal.jsp" %> --%>
	

	
	<div class="full">
		<div class="container">
			
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-white">
					<h1>아이디/비밀번호 찾기</h1>
					<p>인증된 이메일만 정보 찾기가 가능합니다 :)</p>
				</div>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-white"	for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold text-white" for="search_2">비밀번호 찾기</label>
				</div>
				
				<!--아이디검색일때  -->
				<div id="searchI">
					
						<div class="form-group">
							<label class="font-weight-bold text-white" for="inputName_1">이름</label>
							<div>
								<input type="text" class="form-control nameCheck" id="inputName_1" name="name" placeholder="ex)차영하">
							</div>
						</div>
						<div class="form-group">
							<label class="font-weight-bold text-white" for="inputPhone_1">휴대폰번호</label>
							<div>
								<input type="text" class="form-control pCheck" id="inputPhone_1" name="phone" placeholder="ex) 010-7777-9999" onKeyup="inputPhoneNumber(this);" maxlength="13" >
							</div>
						</div>
						<div class="form-group">
<!-- 								<button type="button" class="btn btn-primary btn-block idsearch">확인</button> -->
								<input type="button" value="확인" id="idConfirm" class="btn btn-primary btn-block idsearch" >
<!-- 							<button id="searchBtn" type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#myModal">확인</button> -->
						<%-- <a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a> --%>
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
	
	<!-- Modal -->
	<!--fade는 투명 효과  -->
	<div id="myModal" class="modal fade" role="dialog"> 
	  
		  <div class="modal-dialog">
		
		    <!-- Modal content-->
		    <div class="modal-content">
		      
			      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">x</button>
				        <h4 class="modal-title">안녕하세요.</h4>
			      </div>
		     
		     <div class="modal-body">
		       
			        <p>안녕히가세요.</p>
			        <input type="text" name="phone" id="phone" placeholder="010-xxxx-xxxx" /> 
			        <button onclick="sendSms();">전송</button> <br /> <br /> 
			       
			        <input type="text" name="sms" id="sms" placeholder="인증 번호 입력" /> 
			        <button onclick="phoneCheck();">인증</button>
			     
		      </div>
		      
		      <div class="modal-footer">
		        	
		        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		     
		      </div>
		   
		    </div>
		
		  </div>
	</div>


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
			
		//검색종류 선택시 디스플레이가 none이되는 스크립트
		function search_check(num) {
			if (num == '1') {
				document.getElementById("searchP").style.display = "none";
				document.getElementById("searchI").style.display = "";	
			} else {
				document.getElementById("searchI").style.display = "none";
				document.getElementById("searchP").style.display = "";
			}
		}

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
							console.log(data);
							if(data !="입력하신 정보가 회원정보와 일치합니다."){
									alert("회원정보가 일치합니다.");
							}else{
									alert("회원정보가 일치하지않습니다.");
							}
				}
				
			});	

		});

		//문자보내기
		function sendSms() {
			$.ajax({ 
				url: "sendSms", 
				type: "POST", 
				data: { 
					receiver: $("#phone").val()
				}, 
				success: function(data) { 
					if (data != null) { 
					alert("인증번호 전송"); 
					}else {
					alert("인증번호 전송 실패"); 
					} 
				} 
			}); 
		} 

		//인증문자검증
		function phoneCheck() { 
			$.ajax({ 
				url: "smsCheck", 
				type: "POST", 
				data: { code: $("#sms").val() }, 
				success: function(result) {
					 if (result == "ok") { 
						alert("번호 인증 성공"); 
					} else {
				 		alert("번호 인증 실패");
					} 
				}
			}); 
		}
		
// 		$(document).ready(function() {
// 			/////////모///달///기///능///////////
// 			// 1. 모달창 히든 불러오기
// 			$('#searchBtn').click(function() {
// 				$('#background_modal').show();
// 			});
// 			// 2. 모달창 닫기 버튼
// 			$('.close').on('click', function() {
// 				$('#background_modal').hide();
// 			});
// 			// 3. 모달창 위도우 클릭 시 닫기
// 			$(window).on('click', function() {
// 				if (event.target == $('#background_modal').get(0)) {
// 		            $('#background_modal').hide();
// 		         }
// 			});
// 		});
				
	
	</script>


</body>
</html>
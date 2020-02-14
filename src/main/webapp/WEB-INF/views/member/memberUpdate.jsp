<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link href="/css/member/memberLogin.css" rel="stylesheet"/>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
</head>
<body>
<div class="body_main">
	<div class="b"></div>
<div class="container">
	
<h1>회원정보 수정</h1>
  <form:form class="form-horizontal" id="upfrm" action="./memberUpdate" modelAttribute="memberVO"  method="post" enctype="multipart/form-data">
    
    <div class="form-group">
	      <label class="control-label col-sm-2" for="memId">Id:</label>
	      <div class="col-sm-10">
	      	<h4>${member.memId}</h4>
	        <input type="hidden" class="form-control" id="memId" value="${member.memId}" readonly="readonly" name="memId">  	
	      </div>
    </div>
    
    <input type="hidden" class="form-control" id="memNum" name="memNum" value="${member.memNum}" readonly="readonly">
			
			
    <div class="form-group">
	      <label class="control-label col-sm-2" for="pw">Password:</label>
	      <div class="col-sm-10">          
		      <form:password path="pw" class="form-control" id="pw" name="pw" placeholder="Enter password"/>
			  <form:errors path="pw" cssStyle="color:red;" /> 
	      </div>
    </div>	
     
    <div class="form-group">
	      <label class="control-label col-sm-2" for="pwCheck">Pw Confirm:</label>
	      <div class="col-sm-10">          
		        <form:password path="pwCheck" class="form-control" id="pwCheck" placeholder="Enter password check" />
				<form:errors path="pwCheck" cssStyle="color:red;" />
	      </div>
    </div>
     
     <div class="form-group">
	      <label class="control-label col-sm-2" for="name">Name:</label>
	      <div class="col-sm-10">
		      	<form:input path="name" class="form-control nameCheck" id="name" value="${member.name}"/>
		      	<form:errors path="name" cssStyle="color:red;" />
	      </div>
    </div>
     
    <div class="form-group">
	      <label class="control-label col-sm-2" for="nickname">Nickname:</label>
	      <div class="col-sm-10">
		      	<form:input path="nickname" class="form-control nickCheck2" id="nickname" value="${member.nickname}" readonly="false" />
				<form:errors path="nickname" cssStyle="color:red;" />
	      </div>
    </div>
    
    <div class="form-group">
      	<label class="control-label col-sm-2" for="email">Phone number:</label>
     	 <div class="col-sm-10">          
        		<form:input path="phone" class="form-control phoneCheck2" value="${member.phone}" id="phone" onKeyup="inputPhoneNumber(this);"  maxlength="13" />
				<form:errors path="phone" cssStyle="color:red;" />
				<div class="pconfirm" style="color: red"></div>
      	</div>
    </div>
     
    <div class="form-group">
     	<label class="control-label col-sm-2" for="email">Email:</label>
    	 <div class="col-sm-10">   
    	   		<form:input path="email" class="form-control emailCheck2" id="email2" value="${member.email}"  readonly="true"/>       
				<form:errors path="email" cssStyle="color:red;" />
<%-- 	     		<form:input path="email"  class="form-control emailCheck2" id="email" value="${member.email}" readonly="false" /> --%>
     	</div>
   </div>
     
    <div class="gradeBox1">
     		<label for="name">grade: </label>
     		
     		<input type="hidden" class="form-control" id="grade" name="grade" value="${member.grade}" readonly="readonly" >
   
      		<c:if test="${member.grade eq 1 }">
	      			<c:if test="${member.memTotal le  100000 }">
	      				<input type="text"  value="BRONZE COOKIE" style="color:#b07a5e" readonly="readonly" class="gradeBox">
	      			</c:if>
	      			<c:if test="${100000 lt member.memTotal  and member.memTotal  le  500000}">
	      				<input type="text"  value="SILVER COOKIE" style="color:#c1c6cd" readonly="readonly" class="gradeBox">
	      			</c:if>
	      			<c:if test="${500000 lt  member.memTotal }">
	      				<input type="text"   value="GOLD COOKIE" style="color:#f0c828" readonly="readonly" class="gradeBox">
	      			</c:if>
      		</c:if>		
   			<c:if test="${member.grade eq 9999}">
   					<input type="text" value="관리자" style="color:#ff0000" readonly="readonly" class="gradeBox">
   			</c:if>
   			<c:if test="${member.grade eq 8888}">
   					<input type="text" value="점주" style="color:#ff0000" readonly="readonly" class="gradeBox">
   			</c:if>
    </div>
     
    <div class="profileBox">
		<label for="files">Profile:</label> 
		<br>
		<div class="form-group">
			<img id="blah" alt="your image" src="../upload/${member.memberFilesVO.fname}" style="width: 150px; height: 150px;" onerror="this.src='../images/header/profile.png'"/>	
		</div> 
			<input type="file"class="form-control" id="files" name="files">

	</div>
	
  		<input type="hidden" class="form-control" id="fnum" name="fnum" value="${member.memberFilesVO.fnum}">
	
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
  		<input type="button" class="cancle" value="cancle">
        <button type="submit" class="btn_update">→ 수정</button>
      </div>
    </div>
  	
  </form:form>
</div>
   
   
<script type="text/javascript">

		//수정취소
		$('.cancle').click(function(){
			if(confirm("수정을취소하시겠습니까?")){
				window.location.href="./memberMypage";
			}
			
			});
		
		//이미지를넣었을 때 미리보여지는것.
		$(function(){
			$("#files").on('change',function(){
				 readURL(this);
			});
		});
		function readURL(input) {
			if(input.files && input.files[0]){
				var reader = new FileReader();
		
				reader.onload = function(e){
					$('#blah').attr('src' , e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		//모든란에 입력을 했는지 확인
		$(".btn_update").click(function(){
			if ($("#memId").val() == "") {
				alert("아이디를 입력하세요!");
				$("#memId").focus();
			}else if($("#pw").val() == ""){
				alert("비밀번호를 입력하세요!");
				$("#pw").focus();
			}else if($("#pwCheck").val() == ""){
				alert("비밀번호확인란을 입력하세요!");
				$("#pwCheck").focus();
			}else if($("#name").val() == ""){
				alert("이름을 입력하세요!");
				$("#name").focus();
			}else if($("#nickname").val() == ""){
				alert("닉네임을 입력하세요!");
				$("#nickname").focus();
			}else if($("#phone").val() == ""){
				alert("연락처를 입력하세요!");
				$("#phone").focus();
			}else if($("#phone").val() == ""){
				alert("이메일을 입력하세요!");
				$("#email").focus();	
			}else {
				$("#upfrm").submit();
			}
		});

		//닉네임중복검사
		$(".nickCheck2").click(function(){
			var nickname= $('#nickname').val();
			window.open("./nickCheck2?nickname="+nickname, "","width=570,height=230,top=200, left=600");
			$('.nickCheck').attr('readonly', true);
		});

		//이메일중복검사
// 		$(".emailCheck2").click(function(){
// 			var email= $('#email2').val();
// 			window.open("./emailCheck2?email="+email, "","width=570,height=230,top=200, left=600");
// 			//$('#email').attr('readonly', true);
			
// 		});

		//이름 정규식
		var nameRule =/^[가-힣a-zA-Z]+$/;

		 $(".nameCheck2").blur(function(){
				 if($('#name').val() != "" && nameRule.test($('#name').val()) != true){
					alert("한글이나 영어만 사용가능합니다");
					$('#name').val("");
					$('#name').focus();
					return;
				}	
		 });	
		
		
		//비밀번호  정규식
		var passwordRule=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,14}$/;

		$("#pw").blur(
			function(){
				if($('#pw').val() != "" && passwordRule.test($('#pw').val()) != true	){
						alert("6~14자리 내에 영문과 숫자 특수문자로만 사용해주세요.");
						$('#pw').val("");
						$('#pw').focus();
						return;
				}	
		});

		//비밀번호 확인 정규식
		$("#pwCheck").blur(
				function(){
					if($('#pwCheck').val() != "" && passwordRule.test($('#pwCheck').val()) != true	){
							alert("6~14자리 내에 영문과 숫자 특수문자로만 사용해주세요.");
							$('#pwCheck').val("");
							$('#pwCheck').focus();
							return;
					}	
			});
		
		//연락처 정규식
		var phoneRule = /^(?:(010-?\d{4})|(01[1|6|7|8|9]-?\d{3,4}))-?\d{4}$/;

		$(".phoneCheck2").blur(function(){
			if($('#phone').val() != "" && phoneRule.test($('#phone').val()) != true){
				alert("휴대폰 번호 형식에 맞게 입력해주세요");
				$('#phone').val("");
				$('#phone').focus();
				return;
			}	
			//연락처 중복검사 	
			$.ajax({
				type : "GET",
				url : "phoneCheck2",
				data : {
					phone : $('#phone').val()
				},
				success: function(data){
					data = data.trim();
					if(data !="사용가능한 번호입니다."){
						$('#phone').val("이미 사용하고 있는 번호입니다.");
						$('#phone').focus();
					}			
				}			
			});
			
		});

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
		
</script>
   
</div>
   <c:import url="../layout/footer.jsp" />	

</body>
</html>
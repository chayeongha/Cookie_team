<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<link href="/css/member/memberJoin.css" rel="stylesheet"/>
</head>
<body>

<!-- <script type="text/javascript">
	history.replaceState({}, null, location.pathname);
</script> -->

<div class="body_main">
	<div class="b"></div>

		<div class="container">
		<c:if test="${memberVO.grade eq 1 }">
			<h1>개인회원 가입</h1>
		</c:if>
		
		 <c:if test="${memberVO.grade eq 8888 }">
		 	<h1>사업자회원 가입</h1>
		 </c:if>
		  
		  <form:form class="form-horizontal" id="frm" action="./memberJoin" modelAttribute="memberVO"  method="post" enctype="multipart/form-data">
			    
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="memId">아이디</label>
			      <div class="col-sm-10">
				      <form:input path="memId" placeholder="한글이나 특수문자를 제외하고 입력하세요" class="form-control idCheck" id="memId" readonly="true"/>
				      <form:errors path="memId" cssStyle="color:red;" />
			      </div>
			    </div>
			    
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="pw">비밀번호</label>
			      <div class="col-sm-10">          
			      <form:password path="pw" class="form-control" id="pw" placeholder="6~14자리 내에 영문과 ,숫자 ,특수기호를 다 사용하여 입력하세요 "/>
					 <form:errors path="pw" cssStyle="color:red;" />
			      </div>
			     </div>
			     
			      <div class="form-group">
			      <label class="control-label col-sm-2" for="pw2">비밀번호 확인</label>
			      <div class="col-sm-10">          
				      <form:password path="pwCheck" class="form-control" id="pwCheck" placeholder="Enter password check"/>
					  <form:errors path="pwCheck" cssStyle="color:red;" />
			      </div>
			     </div>
			     
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="name">이름</label>
			      <div class="col-sm-10">
				      <form:input path="name" class="form-control" id="name" placeholder="Enter name"/>
					  <form:errors path="name" cssStyle="color:red;" />
			      </div>
			    </div>
			     
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="nickname">닉네임 </label>
			      <div class="col-sm-10">
				      <form:input path="nickname" class="form-control nickCheck" id="nickname" placeholder="Enter nickname" readonly="true"/>
					  <form:errors path="nickname" cssStyle="color:red;" />
			      </div>
			    </div>
			    
			     <div class="form-group">
			      	<label class="control-label col-sm-2" for="email">연락처</label>
			     	 <div class="col-sm-10">         
			      		<form:input path="phone" class="form-control phoneCheck" id="phone" placeholder="Enter phone" onKeyup="inputPhoneNumber(this);" maxlength="13" />
					  	<form:errors path="phone" cssStyle="color:red;" />
					  	<div class="pconfirm" style="color: red"></div>
			      	</div>
			     </div>
			     
			     <div class="form-group">
				      <label class="control-label col-sm-2" for="memId">이메일</label>
				      <div class="col-sm-10">
				        <form:input path="email" placeholder="ex) xxxxx@cookie.com" class="form-control emailCheck" id="email"/>
				      	<form:errors path="email" cssStyle="color:red;" />
				      </div>
		   		 </div>
			     
			     <div class="form-group">
			      	<div class="col-sm-10"> 
			     		<input type="hidden" class="form-control" name="kind" value="${kind}">
			     		<input type="hidden" class="form-control" name="grade" value="${memberVO.grade}"> 
			     	</div>
			 	</div>
			   
			    <div class="form-group">
					<label for="files">Profile:</label> 
					<input type="file" class="form-control" id="files" name="files">
					<img id="blah" alt="your image" src="#" style="width: 300px; height: 300px;" onerror="this.src='../images/header/mm.png'"/>	
				</div>
				
			    <div class="form-group">        
			      <div class="col-sm-offset-2 col-sm-10">
			      	<button type="submit" class="btn_join">JOIN</button>
			      </div>
			    </div>
			
		  </form:form>
		</div>
   	
   	<c:import url="../layout/footer.jsp" />

	<script type="text/javascript">
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
					$('#blah').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		//영숫자 특수문자  정규식
		var passwordRule = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,14}$/;

		$("#pw").blur(
			function(){
				if($('#pw').val() != "" && passwordRule.test($('#pw').val()) != true	){
						alert("6~14자리 내에 영문과 숫자 특수문자로만 사용해주세요.");
						$('#pw').val("");
						$('#pw').focus();
						return;
				}	
		});

		//모든란에 입력을 했는지 확인
		$(".btn_join").click(function(){
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
				$("#frm").submit();
			}
			
		});
		
		//아이디중복검사
		$(".idCheck").click(function(){
			var memId= $('#memId').val();
			window.open("./idCheck?memId="+memId, "","width=570,height=230,top=200, left=600");
		});
		
		//닉네임중복검사
		$(".nickCheck").click(function(){
			var nickname= $('#nickname').val();
			window.open("./nickCheck?nickname="+nickname, "","width=570,height=230,top=200, left=600");
		});

		//이메일중복검사
		$(".emailCheck").click(function(){
			var email= $('#email').val();
			window.open("./emailCheck?email="+email, "","width=570,height=230,top=200, left=600");
		});

		//연락처 정규식
		var phoneRule = /^(?:(010-?\d{4})|(01[1|6|7|8|9]-?\d{3,4}))-?\d{4}$/;

		$(".phoneCheck").blur(function(){
			if($('#phone').val() != "" && phoneRule.test($('#phone').val()) != true){
				alert("휴대폰 번호 형식에 맞게 입력해주세요");
				$('#phone').val("");
				$('#phone').focus();
				return;
			}	
			//연락처 중복검사 	
				$.ajax({
				type : "GET",
				url : "phoneCheck",
				data : {
					phone : $('#phone').val()
				},
				success: function(data){
					data = data.trim();
					if(data !="사용가능한 번호입니다."){
						$('#phone').val(data);
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
</body>
</html>
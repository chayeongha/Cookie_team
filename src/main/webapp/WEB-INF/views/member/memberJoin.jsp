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
			
		<h1>${kind} 회원가입</h1>
		  <form:form class="form-horizontal" action="./memberJoin" modelAttribute="memberVO"  method="post" enctype="multipart/form-data">
		    
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="memId">아이디</label>
		      <div class="col-sm-10">
		        <form:input path="memId" placeholder="Enter id" class="form-control" id="memId"/>
		      	<form:errors path="memId" cssStyle="color:red;" />
		      </div>
		    </div>
		    
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="pw">비밀번호</label>
		      <div class="col-sm-10">          
		      <form:password path="pw" class="form-control" id="pw" placeholder="Enter password"/>
				 <form:errors path="pw" cssStyle="color:red;" />
		      </div>
		     </div>
		     
		      <div class="form-group">
		      <label class="control-label col-sm-2" for="pw2">비밀번호 확인</label>
		      <div class="col-sm-10">          
		        <form:password path="pw2" class="form-control" id="pw2" placeholder="Enter password"/>
				<form:errors path="pw2" />
		      </div>
		     </div>
		     
		     <div class="form-group">
		      <label class="control-label col-sm-2" for="name">이름</label>
		      <div class="col-sm-10">
		        <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
		      </div>
		    </div>
		     
		        <div class="form-group">
		      <label class="control-label col-sm-2" for="nickname">닉네임 </label>
		      <div class="col-sm-10">
		        <input type="text" class="form-control" id="nickname" placeholder="Enter nickname" name="nickname">
		      </div>
		    </div>
		    
		     <div class="form-group">
		      	<label class="control-label col-sm-2" for="email">연락처</label>
		     	 <div class="col-sm-10">          
		        	<input type="text" class="form-control" id="phone" placeholder="Enter phone number" name="phone">
		      	</div>
		     </div>
		     
		     <div class="form-group">
		      	<div class="col-sm-10"> 
		  			<input type="hidden" class="form-control" name="grade" value="${grade}"> 
		     		<input type="hidden" class="form-control" name="kind" value="${kind}"> 
		     	</div>
		 	</div>
		   
		    <div class="form-group">
				<label for="files">Profile:</label> 
					<input type="file" class="form-control" id="files" name="files">
					<img id="blah" alt="your image" src="#" style="width: 300px; height: 300px;"/>	
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
					$('#blah').attr('src' , e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

	</script>


</div>
</body>
</html>
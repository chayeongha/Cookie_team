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
  <form:form class="form-horizontal" action="./memberUpdate" modelAttribute="memberVO"  method="post" enctype="multipart/form-data">
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="memId">Id:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="memId" value="${member.memId}" readonly="readonly" name="memId">  	
      </div>
    </div>
    
    <input type="hidden" class="form-control" id="memNum" name="memNum" value="${member.memNum}" readonly="readonly">
			
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="pw">Password:</label>
      <div class="col-sm-10">          
      <form:password path="pw" class="form-control" id="pw" name="pw" placeholder="Enter password" value="${member.pw}"/>
		 
      </div>
     </div>	
     
      <div class="form-group">
      <label class="control-label col-sm-2" for="pw2">Pw Confirm:</label>
      <div class="col-sm-10">          
        <form:password path="pw2" class="form-control" id="pw2" placeholder="Enter password" />
		
      </div>
     </div>
     
     <div class="form-group">
      <label class="control-label col-sm-2" for="name">Name:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="Id" name="name" value="${member.name}">
      </div>
    </div>
     
        <div class="form-group">
      <label class="control-label col-sm-2" for="nickname">Nickname:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="nickname" name="nickname" value="${member.nickname}">
      </div>
    </div>
    
     <div class="form-group">
      	<label class="control-label col-sm-2" for="email">Phone number:</label>
     	 <div class="col-sm-10">          
        	<input type="text" class="form-control" id="phone" name="phone" value="${member.phone}">
      	</div>
     </div>
     
     
     <div class="">
      		<label for="name">grade</label>
      		<c:if test="${member.grade eq 1}">
      			<input type="text"value="Famliy" style="color:#00bb00" readonly="readonly">
      		</c:if>
      		<c:if test="${member.grade eq 2}">
      			<input type="text" value="VIP" style="color:#ff0080" readonly="readonly">
      		</c:if>
      		<c:if test="${member.grade eq 3}">
      			<input type="text" value="SVIP" style="color:#ff0000" readonly="readonly">
      		</c:if>
      		<c:if test="${member.grade eq 9999}">
      			<input type="text" value="관리자" style="color:#ff0000" readonly="readonly">
      		</c:if>
      		<c:if test="${member.grade eq 8888}">
      			<input type="text" value="점장" style="color:#ff0000" readonly="readonly">
      		</c:if>
      		<input type="hidden" class="form-control" id="grade" name="grade" value="${member.grade}" readonly="readonly">
    </div>
     
    
    <div class="">
		<label for="files">Profile:</label> 
		<div class="form-group">
			<img id="blah" alt="your image" src="../upload/${member.memberFilesVO.fname}" style="width: 300px; height: 300px;"/>	
		</div> 
			<input type="file"class="form-control" id="files" name="files">

	</div>
	
  		<input type="hidden" class="form-control" id="fnum" name="fnum" value="${member.memberFilesVO.fnum}">
	
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-primary">update</button>
  		<input type="button" class="btn btn-danger cancle" value="cancle">
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
	
   </script>
   
   <c:import url="../layout/footer.jsp" />	
</div>

</body>
</html>
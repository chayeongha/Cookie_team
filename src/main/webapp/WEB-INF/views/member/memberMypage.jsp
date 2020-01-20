<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp" />
</head>
<body>
		<div class="container">
	
		<h1><b style="color: blue;">${member.memId }</b>님 환영합니다</h1>
			
			<div class="form-group">
				<img alt="이미지를 넣어주세요!" src="../upload/${member.memberFilesVO.fname}" width="50%" height="30%">
			</div> 
			
			<input type="hidden" class="form-control" id="memNum" value="${member.memNum}" readonly="readonly">
			
			<div class="form-group">
      			<label for="name">등급</label>
      			<input type="text" class="form-control" id="grade" value="${member.grade}" readonly="readonly">
    		</div>
			
			<div class="form-group">
      			<label for="id">id:</label>
      			<input type="text" class="form-control" id="memId" value="${member.memId}" readonly="readonly">
    		</div>
    
    		<div class="form-group">
      			<label for="name">name</label>
      			<input type="text" class="form-control" id="name" value="${member.name}" readonly="readonly">
    		</div>
    
     		<div class="form-group">
      			<label for="name">nickname</label>
      			<input type="text" class="form-control" id="nickname" value="${member.nickname}" readonly="readonly">
    		</div>
    
    		<div class="form-group">
      			<label for="name">phone</label>
      			<input type="text" class="form-control" id="phone" value="${member.phone}" readonly="readonly">
    		</div>
    
			
			
			<div class="form-group">
				<button class="btn btn-warning" id="mUp">회원수정</button>
				<button class="btn btn-danger" id="mDel">회원탈퇴</button>
			</div>	
		</div>
		
<script type="text/javascript">

		//정보수정
		 $('#mUp').click(function() {
			
			location.href="./memberUpdate";
				
		});

		//회원탈퇴
		 $('#mDel').click(function(){
				
			if(confirm("회원을 탈퇴하시겠습니까?")){

				$.ajax({
				type : "GET",
				url : "memberDelete",
				data : {
						nickname : $("#nickname").val()
				},
				success : function(data) {
					data =data.trim();

					if (data == 1) {
						alert("성공적으로 회원정보가 삭제되었습니다")
						location.href="./memberIndex";
					}else{
						alert("처리가 실패되었습니다");
					}
				}
			}); 
		   }
		});

</script>
		
		
</body>
</html>
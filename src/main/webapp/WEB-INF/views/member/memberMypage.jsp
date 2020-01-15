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
	
		<h1>${member.id }님 환영합니다</h1>
			
			<div class="form-group">
      			<label for="id">id:</label>
      			<input type="text" class="form-control" id="id" name="id" value="${member.id}" readonly="readonly">
    			</div>
    
    		<div class="form-group">
      			<label for="name">name</label>
      			<input type="text" class="form-control" id="name" name="name" value="${member.name}" readonly="readonly">
    		</div>
    
     		<div class="form-group">
      			<label for="name">nickname</label>
      			<input type="text" class="form-control" id="nickname" name="nickname" value="${member.nickname}" readonly="readonly">
    		</div>
    
    		<div class="form-group">
      			<label for="name">phone</label>
      			<input type="text" class="form-control" id="phone" name="phone" value="${member.phone}" readonly="readonly">
    		</div>
    
			<div class="form-group">
      			<label for="name">grade</label>
      			<input type="text" class="form-control" id="grade" name="grade" value="${member.grade}" readonly="readonly">
    		</div>
			
			<div class="form-group">
				<img alt="이미지없다잉" src="../upload/${member.memberFilesVO.fname}">
			</div> 
			
			<div>
			<button type="submit" class="btn1 btn-primary">정보 수정</button>
			<button type="submit" class="btn2 btn-danger">회원 탈퇴</button>
			</div>
			<a type="button" href="./memberUpdate" class="btn-primary">정보수정</a>
			
			

				
		   </script>
		
		
		</div>
		
</body>
</html>
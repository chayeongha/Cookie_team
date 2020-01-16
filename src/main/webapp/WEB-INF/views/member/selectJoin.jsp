<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
		
		<div class="form-group">  
			<h1>SELECT JOIN PAGE</h1>
		</div>
			  
			  
		<div class="form-group">  
			
			 <form action="./memberJoin" method="get">
			 	<button type="submit" class="btn btn-primary">개인 회원가입</button>
			 	<input type="hidden" name="kind" value="Personal">
			 	<input type="hidden" name="grade" value="1">
			 </form>
		</div>	 
			 
		<div class="form-group">   
			 
			 <form action="./memberJoin" method="get">
			 	<button type="submit" class="btn btn-danger">사업자 회원가입</button>
			 	<input type="hidden" name="kind" value="Buisness">
			 	<input type="hidden" name="grade" value="8888">
			 </form>
		</div>
		
		
	</div>

	


</body>
</html>
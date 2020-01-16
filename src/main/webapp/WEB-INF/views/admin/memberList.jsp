<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp" />
</head>
<body>
			<table class="table table-hover">
				<tr>
					<td> </td>
					<td>Id</td>
					<td>Name</td>
					<td>Nickname</td>
					<td>Phone Number</td>
					<td>Grade</td>	
					<td>  </td>
				</tr>
				<c:forEach items="${list}" var="mem">
				<tr>
					<td></td>
					<td>${mem.id}</td>
					<td>${mem.name}</td>
					<td>${mem.nickname}</td>
					<td>${mem.phone}</td>
					<td>${mem.grade}</td>
					<td></td>
					
				
				</tr>		
				</c:forEach>				
			
			</table>
			
		
</body>
</html>
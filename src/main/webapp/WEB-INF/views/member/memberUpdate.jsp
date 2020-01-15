<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp" />
</head>
<body>

<div class="container">
	
<h1>Update Page</h1>
  <form:form class="form-horizontal" action="./memberUpdate" modelAttribute="memberVO"  method="post" enctype="multipart/form-data">
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">Id:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="Id" value="${member.id}" readonly="readonly" name="id">
      	
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="pw">Password:</label>
      <div class="col-sm-10">          
      <form:password path="pw" class="form-control" id="pw" name="pw" placeholder="Enter password"/>
		 
      </div>
     </div>
     
      <div class="form-group">
      <label class="control-label col-sm-2" for="pw2">Pw Confirm:</label>
      <div class="col-sm-10">          
        <form:password path="pw2" class="form-control" id="pw2" placeholder="Enter password"/>
		
      </div>
     </div>
     
     <div class="form-group">
      <label class="control-label col-sm-2" for="name">Name:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="Id" name="name" placeholder="${member.name}">
      </div>
    </div>
     
        <div class="form-group">
      <label class="control-label col-sm-2" for="nickname">Nickname:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="nickname" name="nickname" placeholder="${member.nickname}">
      </div>
    </div>
    
     <div class="form-group">
      	<label class="control-label col-sm-2" for="email">Phone number:</label>
     	 <div class="col-sm-10">          
        	<input type="text" class="form-control" id="phone" name="phone" placeholder="${member.phone}">
      	</div>
     </div>
     
     
     <div class="form-group">
      		<label for="name">grade</label>
      		<input type="text" class="form-control" id="grade" name="grade" value="${member.grade}" readonly="readonly">
    </div>
     
     
   		
    
<!--     <div class="form-group"> -->
<!-- 		<label for="files">Profile:</label>  -->
<!-- 			<input type="file"class="form-control" id="files" name="files"> -->
<!-- 	</div> -->
	

    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-primary">update</button>
      </div>
    </div>
  
  
  </form:form>
</div>
   

</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
</head>
<body>
<div class="body_main">
	<div class="b"></div>
	<div class="container">
		<% String kind= request.getParameter("kind");%>
	<h1><%=kind %> Join Page</h1>
	  <form class="form-horizontal" action="./memberJoin" method="post" enctype="multipart/form-data">
	    
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="id">Id:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="Id" placeholder="Enter id" name="id">
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="pw">Password:</label>
	      <div class="col-sm-10">          
	        <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">
	      </div>
	     </div>
	     
	      <div class="form-group">
	      <label class="control-label col-sm-2" for="pw2">Pw Confirm:</label>
	      <div class="col-sm-10">          
	        <input type="password" class="form-control" id="pw" placeholder="Enter password" >
	      </div>
	     </div>
	     
	     <div class="form-group">
	      <label class="control-label col-sm-2" for="name">Name:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="Id" placeholder="Enter name" name="name">
	      </div>
	    </div>
	     
	        <div class="form-group">
	      <label class="control-label col-sm-2" for="nickname">Nickname:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="nickname" placeholder="Enter nickname" name="nickname">
	      </div>
	    </div>
	    
	     <div class="form-group">
	      <label class="control-label col-sm-2" for="email">Phone number:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="phone" placeholder="Enter phone number" name="phone">
	      </div>
	     </div>
	     
	     <div class="form-group">
	      <label class="control-label col-sm-2" for="grade">Grade:</label>
	      <div class="col-sm-10"> 
	     	<% String grade= request.getParameter("grade");%>
	  		<input type="text" class="form-control" name="grade" value="<%=grade %>"  readonly="readonly"> 
	     </div>
	 	</div>
	    
		
	    
	    <div class="form-group">
			<label for="files">Files:</label> 
			<input type="file"class="form-control" id="files" name="files">
		</div>
		
	
	    
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-primary">JOIN</button>
	      </div>
	    </div>
	  
	  
	  </form>
	</div>
   
</div>
</body>
</html>
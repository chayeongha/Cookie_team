<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
<h1>Menu Insert Page</h1>

<div class="container">
  <form action="./menuInsert"  id="frm" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label for="mmName">메뉴 이름</label>
      <input type="text" class="form-control" id="mmName" placeholder="Enter mmName" name="mmName">
    </div>
    
    <div class="form-group">
      <label for="mmPrice">가격:</label>
      <input type="text" class="form-control" id="mmPrice" placeholder="Enter mPrice" name="mmPrice">
    </div>
    

    
     <div class="form-group">
      <label for="mmCounte">재고수량</label>
      <input type="text" class="form-control" id="mmCount" placeholder="Enter mCount" name="mmCount">
    </div>
    
     <div class="form-group">
      <label for="cmNuml">카테고리 </label>
      <select name="cmNum" id="cmNum">
      	<option value="1">coffee</option>
      	<option value="2">non-coffee</option>
      	<option value="3">tea</option>
      	<option value="4">desert</option>
      </select>
      
    </div>
       <div class="form-group">
      <label for="mmTemp">아이스/핫</label>
     <input type="radio" name="mmTemp" value="0">아이스
     <input type="radio" name="mmTemp" value="1">핫
    </div>
    
    <div class="row" >
		    	<input type="button"  class="btn btn-info col-sm-3" id="add" value="ADD FILE">
		    	<div id="files" class="col-sm-12"></div>
		    </div>
      <button type="submit" class="btn btn-default">Submit</button>
    
</form> 
</div>





<script type="text/javascript" src="../../js/fileCount.js"></script>

</body>

</html>
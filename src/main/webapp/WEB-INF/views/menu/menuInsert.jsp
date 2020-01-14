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

div class="container">
  <form action="./menuInsert" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label for="mName">메뉴 이름</label>
      <input type="text" class="form-control" id="mName" placeholder="Enter mName" name="mName">
    </div>
    
    <div class="form-group">
      <label for="mPrice">가격:</label>
      <input type="text" class="form-control" id="mPrice" placeholder="Enter mPrice" name="mPrice">
    </div>
    

    
     <div class="form-group">
      <label for="mCounte">재고수량</label>
      <input type="text" class="form-control" id="mCount" placeholder="Enter mCount" name="mCount">
    </div>
    
     <div class="form-group">
      <label for="cNuml">카테고리 </label>
      <select name="cNum" id="cNum">
      	<option value="1">coffee</option>
      	<option value="2">non-coffee</option>
      	<option value="3">tea</option>
      	<option value="4">desert</option>
      </select>
      
    </div>
       <div class="form-group">
      <label for="mTemp">아이스/핫</label>
     <input type="radio" name="mTemp" value="0">아이스
     <input type="radio" name="mTemp" value="1">핫
    </div>
      <button type="submit" class="btn btn-default">Submit</button>
    
</form>






</body>
</html>
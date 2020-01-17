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
      	<option value="2">beverage</option>
      	<option value="3">tea</option>
      	<option value="4">desert</option>
      </select>
      
    </div>
       <div class="form-group">
      <label for="mmTemp">아이스/핫</label>
     <input type="radio" name="mmTemp" value="0">아이스
     <input type="radio" name="mmTemp" value="1">핫
    </div>
    
     <div class="form-group">
      <label for="mopt">옵션 </label>
      <div class="opt_group">
      <input type="checkbox" class="opt_checkbox" name="opto"  id="checkbox1" value="시럽:200">시럽
     <!--  <input type="hidden" class="optName" name="" value="시럽">
	  <input type="hidden" class="optPrice" name="" value="200" /> -->
		 
	  <input type="checkbox" class="opt_checkbox" name="opto" id="checkbox2" value="샷추가:500">샷 추가
<!--       <input type="hidden" class="optName" name="" value="샷 추가">
	  <input type="hidden" class="optPrice" name="" value="" />
	   -->
	  <input type="checkbox" class="opt_checkbox" name="opto" id="checkbox3" value="휘핑:500">휘핑
<!--       <input type="hidden" class="optName" name="" value="휘핑 추가">
	  <input type="hidden" class="optPrice" name="" value="500" /> -->
	  <%-- <input type="hidden" class="storeNum" name="sNum" value="${store.sNum}"> --%>
      <div class="form-group">
      <label for="mmCounte">옵션 추가</label>
      
      <input type="button"  class="btn btn-info col-sm-3" id="addOpt" value="옵션 추가">
      <div id="addOpts" class="col-sm-12"></div>
      </div>
      </div>
      
    </div>
    
    
    <div class="row" >
		    	<input type="button"  class="btn btn-info col-sm-3" id="add" value="ADD FILE">
		    	<div id="files" class="col-sm-12"></div>
		    </div>
      <button type="submit" class="btn_submit">Submit</button>
    
</form> 
</div>
   
 

<script type="text/javascript" src="../../js/fileCount.js"></script>
<script type="text/javascript" src="../../js/optAdd.js"></script>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<link href="/css/reset.css" rel="stylesheet" />
<link href="/css/menu/menuIn.css" rel="stylesheet" />

</head>
<body>


	<div class="storeHeader">
		<div class="AddMenuTi">Add Menu</div>
		<div class="AddMenuTi2">판매할 메뉴를 추가해주세요!</div>
	</div>

<div class="container">
  <form action="./menuInsert"  id="frm" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label for="mmName" class="mlabel">메뉴 이름</label>
      <input type="text" class="form-control" id="mmName" placeholder="메뉴명을 입력해주세요" name="mmName">
    </div>
    
    <div class="form-group">
      <label for="mmPrice" class="mlabel">가격:</label>
      <input type="text" class="form-control" id="mmPrice" placeholder="메뉴 가격을 입력해주세요" name="mmPrice">
    </div>
    

    
     <div class="form-group">
      <label for="mmCounte" class="mlabel">재고수량</label>
      <input type="text" class="form-control" id="mmCount" placeholder="재고수량을 입력해주세요" name="mmCount">
    </div>
    
     <div class="form-group" id="selectOp">
      <label for="cmNuml">카테고리 </label>
      <select name="cmNum" id="cmNum">
      	<option value="1">coffee</option>
      	<option value="2">beverage</option>
      	<option value="3">dessert</option>
      </select>
      
    </div>
     <!--   <div class="form-group" id="selectOp">
      <label for="mmTemp">아이스/핫</label>
     <input type="radio" name="mmTemp" value="0">아이스
     <input type="radio" name="mmTemp" value="1">핫
     <input type="radio" name="mmTemp" value="3">디저트
    </div> -->
    
    <div class="con">
	<div class="con_radio">종류</div>
  <ul>
  <li>
    <input type="radio" id="f-option" name="mmTemp" value="0">
    <label for="f-option">아이스</label>
    
    <div class="check"></div>
  </li>
  
  <li>
    <input type="radio" id="s-option" name="mmTemp" value="1">
    <label for="s-option">핫</label>
    
    <div class="check"><div class="inside"></div></div>
  </li>
  
  <li>
    <input type="radio" id="t-option" name="mmTemp" value="3">
    <label for="t-option">디저트</label>
    
    <div class="check"><div class="inside"></div></div>
  </li>
</ul>
</div>
    
    
    <div class="optCon">
     <div class="form-group">
      <label for="mopt" id="optMainBox">옵션 </label>
      <div class="opt_group">
      <input type="checkbox" class="opt_checkbox" name="opto"  id="checkbox1" value="시럽:200">
      <label for="checkbox1"><span></span>시럽</label>
     <!--  <input type="hidden" class="optName" name="" value="시럽">
	  <input type="hidden" class="optPrice" name="" value="200" /> -->
		 
	  <input type="checkbox" class="opt_checkbox" name="opto" id="checkbox2" value="샷추가:500">
	  <label for="checkbox2"><span></span>샷 추가</label>
<!--       <input type="hidden" class="optName" name="" value="샷 추가">
	  <input type="hidden" class="optPrice" name="" value="" />
	   -->
	  <input type="checkbox" class="opt_checkbox" name="opto" id="checkbox3" value="휘핑:500">
	   <label for="checkbox3"><span></span>휘핑</label>
<!--       <input type="hidden" class="optName" name="" value="휘핑 추가">
	  <input type="hidden" class="optPrice" name="" value="500" /> -->
	  <div>
	  <input type="text" class="storeNum" name="ssNum" placeholder="스토어 번호 자리입니다 테스트시  꼭 입력해주세요" value="${store.ssNum}">
	  </div>
	  <br>
      <div class="form-group">
      <label for="mmCounte"></label>
      <input type="button"  class="btn btn-info col-sm-3" id="addOpt" value="옵션 추가">
      <div id="addOpts" class="col-sm-12"></div>
      </div>
      </div>
      <br><br>
    </div>
    </div>
    
    <br><br>
    
    <div class="form-group">
    <br>

	  <img id="blah" src="../images/header/mm.png" alt="your image" style="width: 300px; height: 300px; margin-left: 250px; margin-top: 50px; clear: both;"/>
		<br>    
		<label for="files"></label> 
		<input type="file"class="form-control" id="files" name="files">
	</div>
	
      <button type="submit" class="btn_submit">Submit</button>
      <br>
    
</form> 
</div>
   
 

<script type="text/javascript" src="../../js/optAdd.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#files").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }


    </script>


</body>

</html>
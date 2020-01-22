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
      	<option value="3">desert</option>
      </select>
      
    </div>
       <div class="form-group">
      <label for="mmTemp">아이스/핫</label>
     <input type="radio" name="mmTemp" value="0">아이스
     <input type="radio" name="mmTemp" value="1">핫
     <input type="radio" name="mmTemp" value="3">디저트
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
	  <div>
	  <input type="text" class="storeNum" name="ssNum" placeholder="스토어 번호 자리입니다 테스트시  꼭 입력해주세요" value="${store.ssNum}">
	  </div>
      <div class="form-group">
      <label for="mmCounte">옵션 추가</label>
      
      <input type="button"  class="btn btn-info col-sm-3" id="addOpt" value="옵션 추가">
      <div id="addOpts" class="col-sm-12"></div>
      </div>
      </div>
      
    </div>
    
    <div class="form-group">
		<label for="files">MenuPhoto:</label> 
		<input type="file"class="form-control" id="files" name="files">
		
		  <img id="blah" src="#" alt="your image" />

	</div>
	

     
      
    
	

	
	
	
      <button type="submit" class="btn_submit">Submit</button>
    
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
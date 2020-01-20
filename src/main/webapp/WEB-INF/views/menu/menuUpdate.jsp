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
  <form action="./menuUpdate"  id="frm" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label for="mmName">메뉴 이름</label>
      <input type="text" class="form-control" id="mmName" value="${vo.mmName}" placeholder="Enter mmName" name="mmName">
    </div>
    
    <div class="form-group">
      <label for="mmPrice">가격</label>
      <input type="text" class="form-control" id="mmPrice" value="${vo.mmPrice}" placeholder="Enter mPrice" name="mmPrice">
    </div>
    

    
     <div class="form-group">
      <label for="mmCounte">재고수량</label>
      <input type="text" class="form-control" id="mmCount" value="${vo.mmCount}" placeholder="Enter mCount" name="mmCount">
       <input type="hidden" class="form-control" id="mmNum" value="${vo.mmNum}" placeholder="" name="mmNum">
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
      
      <c:forEach items="${vo.menuOptions}" var="opt">
     <div class="form-group">
      <label for="mmCounte">옵션 이름</label>
     <input type="text" name="optName2" placeholder="옵션이름" value="${opt.optName}">
     </div>
      <div class="form-group">
      <label for="mmCounte">금액</label>
     <input type="text" name="optPrice2" placeholder="금액(원)" value="${opt.optPrice}">
     <input type="hidden" name="optNum2" id="optNum" value="${opt.optNum}">
     </div>
  
      </c:forEach>
	 
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
		<input type="hidden" class="form-control" id="mfNum" name="mfNum" value="${vo.menuFiles.mfNum}">
		  <img id="blah" src="../menu/${vo.menuFiles.mfName}" alt="your image" />

	</div>
	

     
      
    
	

	
	
	
      <button type="submit" class="btn_submit">Submit</button>
    
</form> 
</div>
   
 

<script type="text/javascript" src="../../js/optAdd.js"></script>
    <script type="text/javascript">
    /* 파일 미리보기 */
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

        /* value로 selected  */
        $("#cmNum").val("${vo.cmNum}").prop("selected", true);

        /* value로 checked  */
         $(":radio[value=${vo.mmTemp}]").prop("checked", true);
    </script>


</body>

</html>
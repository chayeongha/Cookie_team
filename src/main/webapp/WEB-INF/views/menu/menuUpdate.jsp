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
<link href="/css/menu/menuUpdate.css" rel="stylesheet" />
</head>
<body>

<c:if test="${member.grade ne 8888}">
<c:import url="../error/400error.jsp" />
</c:if>

<c:if test="${member.grade eq 8888}">

<div class="storeHeader">
		<div class="AddMenuTi">Menu Update</div>
		<div class="AddMenuTi2">메뉴를 수정해주세요!</div>
	</div>


<div class="container">
  <form action="./menuUpdate"  id="frm" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label for="mmName" class="mlabel">메뉴 이름</label>
      <input type="text" class="form-control" id="mmName" value="${vo.mmName}" placeholder="Enter mmName" name="mmName">
    </div>
    
    <div class="form-group">
      <label for="mmPrice" class="mlabel">가격</label>
      <input type="text" class="form-control" id="mmPrice" value="${vo.mmPrice}" placeholder="Enter mPrice" name="mmPrice">
    </div>
    

    
     <div class="form-group">
      <label for="mmCounte" class="mlabel">재고수량</label>
      <input type="text" class="form-control" id="mmCount" value="${vo.mmCount}" placeholder="Enter mCount" name="mmCount">
       <input type="hidden" class="form-control" id="mmNum" value="${vo.mmNum}" placeholder="" name="mmNum">
    </div>
    <br>
     <div class="form-group">
      <label for="cmNuml" class="cateName">카테고리 </label>
      <select name="cmNum" id="cmNum">
      	<option value="1">coffee</option>
      	<option value="2">beverage</option>
      	<option value="3">desert</option>
      </select>
      </div>
      
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
    
     <div class="form-group">
    
      <div class="opt_group">
      
      <c:forEach items="${vo.menuOptions}" var="opt" varStatus="p">
     <div class="optBoxForm" id="optbox${p.index}">
      <label for="mmCounte" class="optN">옵션 이름</label>
     <input type="text" name="optName2" class="optN2" placeholder="옵션이름" value="${opt.optName}">
      <label for="mmCounte" class="optN">금액</label>
     <input type="text" name="optPrice2" class="optN2" placeholder="금액(원)" value="${opt.optPrice}">
     <input type="hidden" name="optNum2" id="opn${p.index}" value="${opt.optNum}">
     <input type="hidden" name="mmNum2" id="mn${p.index}" value="${vo.mmNum}">
     <br>
     <input type="button" id="optbtn${p.index}" class="optbtn" value="옵션 삭제" style="cursor: pointer;">
     </div>
  
      </c:forEach>
	 
      <div class="form-group">
      <br>
      <input type="button"  class="btn btn-info col-sm-3" id="addOpt" value="옵션 추가">
      <div id="addOpts" class="col-sm-12"></div>
      </div>
      </div>
      
    </div>
    
    <div class="form-group">
        <br>
        <br>
        <div style="margin-top: 850px; margin-left: 250px; font-family: CookieRun-Regular; font-size: 24px;">Menu Photo</div>
		  <img id="blah" src="../menu/${vo.menuFiles.mfName}" alt="your image" class="imgF" style="width: 300px; height: 300px; margin-left: 250px; margin-top: 50px; clear: both; margin-right: 300px;"/>
		    <br>
		<input type="file"class="form-control" id="files" name="files" value="">
		<input type="hidden" class="form-control" id="mfNum" name="mfNum" value="${vo.menuFiles.mfNum}">

	</div>

      <button type="submit" id="btn_submit" class="btn_submit">Submit</button>
      <a href="./menuList?ssNum=${vo.ssNum}"> <input type="button" value="수정 취소" class="btn_submit" style="cursor: pointer; "></a>
    
</form> 
</div>
</c:if>   
 

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

         /* 옵션 삭제*/
             		
            for(var p=0; p<${vo.menuOptions.size()};p++){
                 var btn = document.getElementById('optbtn'+p)
                 var mmNum = $("#mn"+p).val();
                 var sbtn = document.getElementById('btn_submit')
                btn.onclick=function(){
    				$(this).parent().attr('style', 'display:none');
    				$(this).parent().addClass('rmopt');
                     };
                    
                 }; 

            
                 sbtn.onclick=function(){
               	 jQuery.ajaxSettings.traditional = true;
                	 for(var st =0; st<${vo.menuOptions.size()}; st++){
                		 var optnum= new Array();
        		 			var index=0;

        		 			for( var st=0; st<${vo.menuOptions.size()}; st++){
        		 				
        		 				if($('#optbox'+st).hasClass('rmopt')){
        		 					optnum[index] = $('#opn'+st).val();
        		 					index++;
        		 				}
                    	 
                	 }
                	 };
                	 $.ajax({
     					type : "POST",
     					url : "./moptDelete",
     					data : {
     				optnum : optnum
     				},
     				success : function(data){
     					
     				}
                	 
     					});
                      
                     }; 
             
         
         
    </script>



</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Notice Write</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/board/boardWrite.css" rel="stylesheet">
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
</head>
<body>
<div class="body_main">
	<div class="b"></div>
		<!-- 서브 타이틀 -->
	<div class="subTitle_wrap">
		<div class="subTitle_inner">
			<h2>${boardName} 글쓰기</h2>
		</div>
	</div>
	
   <div class="container">
     <form:form action="noticeWrite" modelAttribute="noticeVO" id="frm" enctype="multipart/form-data">
        <div class="form-group">
         <label for="title" style="font-family: CookieRun-Black; font-size:25px; color:#f23600;">제목</label>
         <form:input path="title" placeholder="Enter Title" class="form-control" id="title" />
         <form:errors path="title" cssStyle="color:red;" />
       </div>
       
       <div class="form-group">
         <label for="writer" style="font-family: CookieRun-Black; font-size:25px; color:#f23600;">작성자</label>
         <form:input path="writer" class="form-control" id="writer" value=""/>
       </div>
       
<%--        <div class="form-group">
         <label for="contents"></label>
         <form:textarea path="contents" class="form-control" id="contents" placeholder="Enter Cotents" />
         <form:errors path="contents" />
       </div>
        --%>
        
          <div class="form-group">
         <label for="contents"></label>
         <textarea name="contents" class="form-control" id="contents" placeholder="Enter Cotents"></textarea>
        
       </div>
       <button class="btngo">등록</button>
       <input type="button" id="btn_add" class="btn_add" value="Add File">
       <div id="files">
         
       </div>
       
       
       
        
       <input type="button" class="btn btn-primary" id="write" value="Submit">
     </form:form>
     
     <a href="./noticeList" class="btn btn-warning">목록</a>
   </div>
   
<script type="text/javascript">
   //var files = $('#files').html();
   var files = ' <div class="form-group tt">     <label for="file"></label>      <br>       <div class="col-sm-11">          <input type="file" class="form-control" id="file" name="files">       </div>       <div class="col-sm-1">          <input type="button" class="del" value="X">       </div>     </div>';
   $('#files').empty(); //remove vs empty ; 나 포함 전체 지우기 vs 자식만 지우기
   var check = 0;
   var index = 0; //index 번호
   
   $('#files').on("click", ".del", function() {
      //event.preventDefault();
      //alert("del");
      //$("#files div:last").remove(); //선택된 게 지워지질 않아 ㅜㅠ
      //1. $(this).closest(".tt").remove(); //가장 가까운 거!!
      //2. $(this).parent().parent().remove();
      //3. $(this).parents(".form-group").remove();
      $(this).parentsUntil("#files").remove();
      check--;
   });   //add file은 버튼을 눌러야 추가되는데, 추가되기 전에 이벤트가 실행되므로 이벤트가 실행되지 않는다.
         
   $('#btn_add').click(function() {
      //alert(files);
      if(check<5){
         $('#files').append(files);
         check++;
      }else {
         alert("최대 5개까지 가능합니다.");
      }
   });

 
	$("#write").click(function() {
		//다른 input들 검증.
		if($("#contents").summernote('isEmpty')) {
			alert("내용을 입력해주세요.");
		}else {
			$("#frm").submit();
		}
	});
	var formData = null;
	//summer Note
	$("#contents").summernote(
			{
				height : 400,
				callbacks : {
					onImageUpload : function(file) {
						var formData = new FormData();
						formData.append('file', file[0]);

						$.ajax({
							type : "POST",
							url : "./summerFile",
							data : formData,
							enctype : "multipart/form-data",
							cache : false,
							contentType : false,
							processData : false,
							success : function(data) {
								data = data.trim();
								//console.log(data);
								data = '../summernote/'+data;
								//console.log(data);
								$('#contents').summernote('insertImage', data);
								console.log("썸머");
								formData.delete('file');
							}
						});
					},
					//OnImageUpload End
					onMediaDelete : function(files) {
						var fileName = $(files[0]).attr('src');
						//console.log(fileName);
						fileName = fileName.substring(fileName.lastIndexOf('/')+1);
						//console.log(fileName);
						$.ajax({
							type : "POST",
							url : "./summerFileDelete",
							data : {
								fileName : fileName
							},
							success : function(data) {
								//console.log(data);
							}
						});
					}
				//onMediaDelete End
				}
			});
</script>
   <!-- <script type="text/javascript" src="../js/summernote.js"></script> -->
   <!-- <script type="text/javascript" src="../js/fileCount.js"></script> -->
	<c:import url="../layout/footer.jsp" />
</div>
</body>
</html>
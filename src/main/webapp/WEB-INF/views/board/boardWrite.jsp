<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp" />
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
</head>
<body>

   <div class="container">
     <h2>공지사항 글쓰기</h2>
     
     <form:form modelAttribute="noticeVO" id="frm" enctype="multipart/form-data">
        <div class="form-group">
         <label for="title">Title:</label>
         <form:input path="title" placeholder="Enter Title" class="form-control" id="title" />
         <form:errors path="title" cssStyle="color:red;" />
       </div>
       
       <div class="form-group">
         <label for="writer">Writer:</label>
         <form:input path="writer" class="form-control" id="writer" value=""/>
       </div>
       
       <div class="form-group">
         <label for="contents">Contents:</label>
         <form:textarea path="contents" class="form-control" id="contents" placeholder="Enter Cotents" />
         <form:errors path="contents" />
       </div>
       
       <div id="files">
          <div class="form-group tt">
            <label for="file">File:</label>
            <br>
            <div class="col-sm-11">
               <input type="file" class="form-control" id="file" name="files">
            </div>
            <div class="col-sm-1">
               <input type="button" class="btn btn-danger del" value="Del">
            </div>
          </div>
       </div>
       
       <input type="button" id="btn_add" class="btn btn-success" value="Add File">
       
       <input type="button" class="btn btn-primary" id="write" value="Submit">
     </form:form>
     
   </div>
   
<script type="text/javascript">
   var files = $('#files').html();
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

	//summer Note
	$("#contents").summernote(
			{
				height : 400,
				callbacks : {
					onImageUpload : function(files) {
						var formData = new FormData();
						formData.append('file', files[0]);

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
							}
						});
					},
					//OnImageUpload End
					onMediaDelete : function(files) {
						var fileName = $(files[0]).attr('src');
						console.log(fileName);
						$.ajax({
							type : "POST",
							url : "./summerFileDelete",
							data : {
								fileName : fileName
							},
							success : function(data) {
								console.log(data);
							}

						});
					}
				//onMediaDelete End

				}
			});
</script>
   <!-- <script type="text/javascript" src="../js/summernote.js"></script> -->
   <!-- <script type="text/javascript" src="../js/fileCount.js"></script> -->

</body>
</html>
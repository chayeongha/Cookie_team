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
			<h2>${boardName} 수정</h2>
		</div>
	</div>
	
   <div class="container">
     <form:form modelAttribute="noticeVO" id="frm" enctype="multipart/form-data">
       <form:hidden path="num" value="${update.num}" readonly="true" class="form-control" id="num" />
       
        <div class="form-group">
         <label for="title" style="font-family: CookieRun-Black; font-size:25px; color:#f23600;">제목</label>
         <form:input path="title" value="${update.title}" placeholder="Enter Title" class="form-control" id="title" />
         <form:errors path="title" cssStyle="color:red;" />
       </div>
       
       <div class="form-group">
         <label for="writer" style="font-family: CookieRun-Black; font-size:25px; color:#f23600;">작성자</label>
         <form:input path="writer" value="${update.writer}" class="form-control" id="writer"/>
       </div>
       
       <div class="form-group">
         <label for="contents"></label>
         <textarea class="form-control" id="contents" name="contents">${update.contents}</textarea>
         <%-- <form:errors path="contents" /> --%>
       </div>
       
       <button class="btngo">등록</button>
       
       <input type="button" id="btn_add" class="btn_add" value="첨부파일">

		<div>
			<ul>
				<c:forEach items="${update.noticeFilesVO}" var="file" varStatus="i">
					<li>
						<span class="oname">${file.oname}</span>
						<input type="hidden" class="fnum" value="${file.fnum}">
						<input type="button" class="del" id="del_${i}" value="X">
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<script type="text/javascript">
			$('.del').click(function(){
				var fnum = $(this).parent().find('.fnum').val();
				//alert(fnum);
				$(this).parent().find('.fnum').attr("name", "fnums");
				//console.log($(this).parent().find('.fnum').attr("name"));
				$(this).parent().find('.oname').remove();
				$(this).remove();
			    check--;
			    //alert(check);
			});
		</script>
		
		<div id="files">
			<div class="form-group tt">
				<label for="file"></label> <br>
				<div class="col-sm-11">
					<input type="file" class="form-control" id="file" name="files">
				</div>
				<div class="col-sm-1">
					<input type="button" class="del" value="X">
				</div>
			</div>
		</div>

		
     </form:form>
     
     <a class="listgo" href="./noticeList">목록으로..</a>
   </div>
   
<script type="text/javascript">
   var files = $('#files').html();
   $('#files').empty(); //remove vs empty ; 나 포함 전체 지우기 vs 자식만 지우기
   var check = $('.oname').length;
   var index = 0; //index 번호
	//alert(check);
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
	<c:import url="../layout/footer.jsp" />
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Qna Answer Update</title>
<c:import url="../template/boot.jsp" />
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/board/qnaWrite.css" rel="stylesheet">
</head>
<body>
	<div id="popWrap">
			<div id="popHead">
				<div class="popHeadEnd">
					<h1>문의답변 수정</h1>
				</div>
			</div>
			<div class="popBody_con">
				<div class="pop_qna_wrap">
					<div class="tbl_wrap">
						<table class="tbl">
							<caption>문의답변 수정</caption>
							<colgroup>
								<col style="width:25%">
								<col style="width:75%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="first alignL">
										<label for="popCont">문의내용</label>
									</th>
									<td class="alignL">
										<textarea disabled="disabled" rows="10" cols="80">${question.contents}</textarea>
									</td>
								</tr>
								<tr>
									<th scope="row" class="first alignL">
										<label for="popCont">답변내용</label>
									</th>
									<td class="alignL">
										<textarea name="contents" id="popCont" rows="10" cols="80" placeholder="답변 내용을 작성해 주세요">${answer.contents}</textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
			<!-- 버튼 -->
				<div class="btn_wrap">
					<input type="hidden" name="num" value="${answer.num}">
					<input type="hidden" name="writer" value="${answer.writer}">
					<input type="hidden" name="secret" value="${question.secret}">
					<button id="btnSave" class="popbtn popbtn1" title="등록"><span>등록</span></button>
					<button id="btnClose" class="popbtn popbtn2" title="취소"><span>취소</span></button>
				</div>
			</div>
	</div>
	
<script type="text/javascript">

	//등록 버튼
	$('#btnSave').click(function(){
		var num = $('input[name="num"]').val();
		var writer = $('input[name="writer"]').val();
		var contents = $('#popCont').val();
		var secret = $('input[name="secret"]').val();

		if(writer == null || writer == ""){
			alert("로그인 후 이용하세요");
			self.close();
		}else {
		
			if (contents != "") {
		
				$.ajax({
					type : "POST",
					url : "./qnaAnswerUpdate",
					data : {
						num : num,
						writer : writer,
						contents : contents,
						step : 1,
						secret : secret,
						acheck : 1
					},
					success : function(data) {
						if (data > 0) {
							opener.location.reload();
							self.close();
						} else {
							alert("잠시 후에 다시 시도해주세요.");
						}
					},
					error : function() {
						alert("잠시 후에 다시 시도해주세요.");
					}
				});
			} else {
				alert("답변내용을 입력해주세요.");
			}//if contents
		}//if writer
	});//클릭버튼

	//취소 버튼
	$('#btnClose').click(function() {
		window.close();
	});
</script>
</body>
</html>
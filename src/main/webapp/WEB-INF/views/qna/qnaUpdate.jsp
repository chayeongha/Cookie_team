<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Qna Update</title>
<c:import url="../template/boot.jsp" />
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/board/qnaWrite.css" rel="stylesheet">
</head>
<body>
	<div id="popWrap">
			<div id="popHead">
				<div class="popHeadEnd">
					<h1>문의내용 수정</h1>
				</div>
			</div>
			<div class="popBody_con">
				<div class="pop_qna_wrap">
					<div class="tbl_wrap">
						<table class="tbl">
							<caption>문의내용 작성</caption>
							<colgroup>
								<col style="width:25%">
								<col style="width:75%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="first alignL">
										<label for="popCont">내용</label>
									</th>
									<td class="alignL">
										<textarea name="contents" id="popCont" rows="10" cols="80" placeholder="궁금하신 내용을 작성해 주세요">${update.contents}</textarea>
									</td>
								</tr>
							<!-- captcha -->
								<tr>
									<th scope="row" class="first alignL">
										<label for="popCont">보안문자</label>
									</th>
									<td class="alignL">
										<div style="overflow:hidden">
											<img id="ccimage" alt="캡차이미지" src="./captchaImg">
											<div id="ccaudio" style="display:none"></div>
										</div>
										<div style="padding:3px">
											<input id="reload" type="button" onclick="javaScript:getImage()" value="새로고침">
											<!-- <input id="soundOn" type="button" onclick="audio()" value="음성듣기"> -->
										</div>
										
										<p class="cap_wrap">
											<input type="text" id="captcha" name="captcha" placeholder="보안문자를 입력해 주세요.">
											<span class="cap_help">영문, 숫자 조합을 공백없이 입력하세요(대소문자구분)</span>
										</p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				<!-- 비밀글 -->
					<div class="chk_wrap">
						<label for="secret">
							<c:if test="${update.secret == 1}">
							<input type="checkbox" checked="checked" name="secret" id="secret" value="1" class="chk"> 비밀글로 문의하기
							</c:if>
							<c:if test="${update.secret == 0}">
							<input type="checkbox" name="secret" id="secret" value="0" class="chk"> 비밀글로 문의하기
							</c:if>
						</label>
					</div>
				<!-- 공지사항 -->
					<div class="notice_box">
						<h2 class="tit">알아두세요!</h2>
						<ul>
							<li>전화번호, 이메일, 배송지 주소, 환불계좌정보 등 개인정보가 포함된 글은, 비밀글로 문의해 주시기 바랍니다.</li>
							<li>
								부적절한 게시물 등록시 ID이용 제한 및 게시물이 삭제될 수 있습니다.
								<ul>
									<li>- 전화번호, 이메일 주소 등 연락처를 기재하여 할인/직거래 등을 유도</li>
									<li>- 비방/욕설/명예훼손, 가격비교정보, 물품과 관련 없는 광고글 등</li>
									<li>- 다만 상품에 대한 단순 불만, 판매자에게 불리한 내용이라는 이유만으로는 삭제하지 않습니다.</li>
								</ul>
							</li>
							<li>게시글에 회원님의 이메일, 휴대폰번호와 같은 개인 정보의 입력은 금지되어 있으며, 발생하는 모든 피해에 대해 Cookie Order는 책임지지 않습니다.</li>
						</ul>
					</div>
				</div>
			<!-- 버튼 -->
				<div class="btn_wrap">
					<input type="hidden" name="num" value="${update.num}">
					<input type="hidden" name="writer" value="${update.writer}">
					<button id="btnSave" class="popbtn popbtn1" title="수정"><span>수정</span></button>
					<button id="btnClose" class="popbtn popbtn2" title="취소"><span>취소</span></button>
				</div>
			</div>
	</div>
<script type="text/javascript">

///captcha/////////////////////////////////////////////////////////////
	getImage(); //이미지 가져오기

	//매번 랜덤값을 파라미터로 전달하는 이유 : IE의 경우 매번 다른 임의 값을 전달하지 않으면 '새로고침'을 클릭해도 정상 호출되지 않아 이미지가 변경되지 않는 문제가 발생된다
	function audio(){
		var rand = Math.random();
		var uAgent = navigator.userAgent;
		var soundUrl = './captchaAudio?rand='+rand;

		if(uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1){
			//IE 경우
			audioPlayer(soundUrl);
		}else if(!!document.createElement('audio').canPlayType){
			//Chrome 경우
			try {
				new Audio(soundUrl).play();
			} catch (e) {
				audioPlayer(soundUrl);
			}
		}else {
			window.open(soundUrl, '', 'width=1, height=1');
		}
	}

	function getImage(){
		var rand = Math.random();
		var url = './captchaImg?rand='+rand;

		$('#ccimage').attr('src', url);
	}

	function audioPlayer(objUrl){
		$('#ccaudio').html('<bgsoun src="'+objUrl+'">');
	}

//////////////////////////////////////////////////////////////////////////////////
	
	//수정 버튼
	$('#btnSave').click(function(){
		if($('input[name="secret"]').is(":checked")){
			$('input[name="secret"]').val(1);
		}else {
			$('input[name="secret"]').val(0);
		}

		var num = $('input[name="num"]').val();
		var writer = $('input[name="writer"]').val();
		var contents = $('#popCont').val();
		var secret = $('input[name="secret"]').val();

		if(writer == null || writer == ""){
			alert("로그인 후 이용하세요");
			self.close();
		}else {
			
			if(contents != ""){
				var params = $('#captcha').val();
				
				if(params != null && params !=""){
				
					$.ajax({
						type: 'POST',
						url: 'chkAnswer',
						data: {
							answer: params
						},
						success: function(data){
							//alert(data);
							if(data == 200){
								alert('입력값이 일치합니다.');
	
								$.ajax({
									type: "POST",
									url: "./qnaUpdate",
									data: {
										num: num,
										writer: writer,
										contents: contents,
										secret: secret
									},
									success: function(data){
										//alert(data);
										if(data > 0){
											opener.location.reload();
											self.close();
										}else{
											alert("잠시 후에 다시 시도해주세요.");
										}
									},
									error: function(){
										alert("잠시 후에 다시 시도해주세요.");
									}
								});
							}else {
								alert('보안문자 입력값이 일치하지 않습니다.\n다시 입력해주세요.');
								getImage();
								$('#captcha').val('');
							}
						},
						error: function() {
							alert("error");
						}
					});
				}else {
					alert("보안문자를 입력해주세요.");
				}
			}else {
				alert("문의내용을 입력해주세요.");
			}
		}
	});
	
	//취소 버튼
	$('#btnClose').click(function(){
		window.close();
	});
</script>
</body>
</html>
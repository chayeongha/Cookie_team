<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Qna Write</title>
<c:import url="../template/boot.jsp" />
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/board/qnaWrite.css" rel="stylesheet">
</head>
<body>
	<div id="popWrap">
		<form name="frmMain" method="post">
			<div id="popHead">
				<div class="popHeadEnd">
					<h1>문의내용 작성</h1>
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
										<textarea name="contents" id="popCont" rows="10" cols="80" placeholder="궁금하신 내용을 작성해 주세요"></textarea>
									</td>
								</tr>
								<tr>
									<th scope="row" class="first alignL">
										<label for="popCont">보안문자</label>
									</th>
									<td class="alignL">
										<p class="cap_wrap">
											<input type="text" id="captcha" name="captcha" placeholder="보안문자를 입력해 주세요.">
											<span class="cap_help">영문, 숫자 조합을 공백없이 입력하세요(대소문자구분)</span>
										</p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				<!-- 비밀글 && captcha -->
					<div class="chk_wrap">
						<label for="secret">
							<input type="checkbox" name="secret" id="secret" value="1" class="chk"> 비밀글로 문의하기
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
					<input type="hidden">
					<a href="#" id="btnSave" class="popbtn popbtn1" title="등록"><span>등록</span></a>
					<a href="#" id="btnClose" class="popbtn popbtn2" title="취소"><span>취소</span></a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
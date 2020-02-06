<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Notice</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/board/qnaList.css" rel="stylesheet">
</head>
<body>
<div class="body_main">
	<div class="b"></div>
	<!-- 서브 타이틀 -->
	<div class="subTitle_wrap">
		<div class="subTitle_inner">
			<h2>문의사항</h2>
		</div>
	</div>

	<!-- container -->
	<div class="container">
		<div class="qna_filter"></div>
		<table class="qna_tb">
			<colgroup>
				<col style="width:85px;">
				<col style="width:auto;">
				<col style="width:96px;">
				<col style="width:115px;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">문의번호</th>
					<th scope="col">문의/답변</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td class="td_num">${list.num}</td>
						<td class="td_view">
							<span class="state">미완료</span>
							<c:if test="${list.secret == 1}">비밀글입니다.</c:if>
							<c:if test="${list.secret == 0}">
								<a href="javascript:void(0)" id="showCloseDetail" class="view_txt">${list.contents}</a>
							</c:if>
						</td>
						<td class="td_writer">${list.writer}</td>
						<td class="td_date"><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd HH:mm" /></td>
					</tr>
					<tr class="trQna" style="display: table-row;">
						<td colspan="4" class="qna_wrap" style="display: table-cell;">
							<div class="question">
								<span class="iconQ">질문</span>
								${list.contents}
								<br>
								<div class="reply_wrap">
									<a href="javascript:void(0)" class="btn_reply">답변하기 ></a>
								</div>
							</div>
							<c:if test="${list.step > 0}">
								<div class="answer">
									<span class="iconA">답변</span>
									${list.contents}
									<br>
								</div>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="btn_wrap">
			<!-- <a href="./qnaWrite" id="write" class="btn_write">문의하기</a> -->
			<input type="button" value="문의하기" onclick="openChild()">
			<br>
			전달할 값 : <input type="text" id="pInput"> <input type="button" value="전달" onclick="setChildText()">
		</div>
		
		<ul class="pagination">
			<c:if test="${pager.curBlock gt 1}">
				<li class="previous"><a href="./qnaList?curPage=${pager.startNum-1}"><</a></li>
			</c:if>
			
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<c:if test="${pager.curPage == i}">
					<li class="list"><a href="./qnaList?curPage=${i}" style="color: #f23600; text-decoration: underline;">${i}</a></li>
					
				</c:if>
				<c:if test="${pager.curPage != i}">
					<li class="list"><a href="./qnaList?curPage=${i}">${i}</a></li>
				</c:if>
			</c:forEach>
			
			<c:if test="${pager.curBlock lt pager.totalBlock}">
				<li class="next"><a href="./qnaList?curPage=${pager.lastNum+1}">></a></li>
			</c:if>
		</ul>
	</div>
		<c:import url="../layout/footer.jsp" />
</div>
<script type="text/javascript">


////////////////////////////////////////////////////////////////////
	var openWin;

	function openChild() {
		//window.name = "부모창 이름";
		window.name = "parentForm";
		//window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("./qnaWrite", "childForm", "top=100, left=10, width=920, height=700, resizable = no, scrollbars = no");
	}

	function setChildText() {
		openWin.document.getElementById("cInput").value = document.getElementById("pInput").value;
	}


// 	function PostOpen() {
// 		var f = document.write_form;
// 		var is_status = "toolbar=no,directories=no,scrollbars=yes,resizable=no,status=yes,menubar=no, top=10,left=30, width=920, height=700"; 
// 		var p_window = window.open("","p_window",is_status); // post 는 우선 url 이 없다.

// 		f.target = "p_window";

// 		f.action = "open.asp";

// 		f.submit();

// 		p_window.focus();
// 	}
	
// 	function fnWindowOpen() {
// 		var target = 'pop';
// 		window.open('', target); //새창을 띄운다

// 		var from = document.form;
// 		form.action = ""; //form에 url 설정
// 		form.target = target; //form 타깃에 새창(popup)과 같은 타깃명을 설정한다.
// 		form.submit();
// 	}
	
// 	function open_pop(arg1, arg2){
// 		var frmPop = document.frmPopup;
// 		var url = 'popup.php';
// 		window.open('', 'popupView', '옵션');

// 		frmPop.action = url;
// 		frmPop.target = 'popupView'; //window.open()의 두번째 인수와 같아야 하며 필수다
// 		frmPop.arg1.value = arg1;
// 		frmPop.arg2.value = arg2;
// 		frmPop.submit();
// 	}
	
// 	function action_popup(idx) {

// 		var lPos = screen.availWidth / 2 - 300 / 2;

// 		var windowUrl = 'about:blank';

// 		var windowName = 'TARGET_' + idx;

// 		var popupWindow = window.open(windowUrl, windowName, 'left='+lPos+',top=10,scrollbars=yes,width=300,height=640');

// 		var popupForm = document.popupForm;

// 		if(!document.popupForm) {

// 			popupForm = document.createElement("form");

// 			popupForm.setAttribute("name", "popupForm");

// 			popupForm.setAttribute("method", "post");

// 			popupForm.setAttribute("action", "popup.html");

// 			var input = document.createElement('input');

// 			input.setAttribute("type", "hidden");

// 			input.setAttribute("name", "idx");

// 			input.setAttribute("value", "");

// 			popupForm.appendChild(input);

// 			popupForm.target = windowName;

// 			document.body.appendChild(popupForm);

// 		}

// 		popupForm.idx.value = idx;

// 		popupForm.submit();

// 	}

// 	function onSubmit(){
// 		 var myForm = document.popForm;
// 		 var url = "/test/popForm.do";
// 		 window.open("" ,"popForm",
// 		       "toolbar=no, width=540, height=467, directories=no, status=no,    scrollorbars=no, resizable=no");
// 		 myForm.action =url;
// 		 myForm.method="post";
// 		 myForm.target="popForm";
// 		 myForm.testVal = 'test';
// 		myForm.submit();
// 		}


// 		<form name="popForm">
// 		    <input type="hidden" name="cmd" value="openPop" />
// 		    <input type="hidden" name="testval" />
// 		</form>





		

			
	
	//날짜 변환 함수
	function changeDate(date){
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		hour = date.getHours();
		minute = date.getMinutes();
		//second = date.getSeconds();
		strDate = year + "-" + month + "-" + day + " " + hour + ":" + minute;
		return strDate;
	}
</script>	
</body>
</html>				
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/store/storeNotice.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	
	<form action="storeNotice" method="post" name="form" id="form" enctype="multipart/form-data">
	
			<input type="text" id="ssNum" name="ssNum" value="${store.ssNum}">
		<div class="NoticeContent">
		<div class="NoticeH"><p>매장 공지사항</p></div>
			<div class="NoticeW"><p>매장공지사항을 적어주세요</p></div>
			<div class="NoticeContent_2">
				<textarea rows="7" cols="70" name="sNotice" id="sNotice" style="resize: none;">${store.sNotice}</textarea>
			</div>
			<div class="btnBox"><button class="btnWrite">작성</button></div>
		</div>
</form>



	<script type="text/javascript">
		$('.btnWrite').click(function{
			$("#form").submit();
			});
	
	</script>


</body>
</html>
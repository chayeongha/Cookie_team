<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<link href="/css/reset.css" rel="stylesheet" />
<link href="/css/member/memberPoint.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<c:if test="${member.nickname ne pointListVO.nickname}">
<h1>올바른 접근 경로가 아닙니다!</h1>
</c:if>

<c:if test="${member.nickname eq pointListVO.nickname}">

<div class="pointHeader">
	<div class="pointPre">
		
		<div class="history"><i class="fa fa-arrow-circle-left" style="font-size: 42px; margin-left: 20px; color: white; cursor: pointer;"></i></div>
	</div>
	<div class="pointTi">
		My Point
	</div>
</div>
<div class="container">
	<table class="table">
			<tr class="tableTR">
				<td>NUM</td>
				<td>스토어</td>
				<td>날짜</td>
				<td>적립/차감금액</td>
				<td>적립/차감</td>
			</tr>

			<c:forEach items="${lists}" var="po">
				<tr >
					<td>${po.poNum}</td>
					<td>
					<c:if test="${po.storeVO.ssNum eq 0}">
					출석포인트
					</c:if>
					<c:if test="${po.storeVO.ssNum ne 0}">
					${po.storeVO.sName}
					</c:if>
					</td>
					<td>${po.poDate}</td>
					<td>${po.poChange}</td>
					<td>
					<c:if test="${po.poUse eq 0}">
					<div id="plus">적립</div>
					</c:if>
					<c:if test="${po.poUse  eq 1}">
					<div id="minus">차감</div>
					</c:if>
					</td>
				</tr>
		

</c:forEach>
</table>
</div>

<script type="text/javascript">
$(".history").click(function(){
	window.history.back();
	
})
</script>
</c:if>

</body>
</html>
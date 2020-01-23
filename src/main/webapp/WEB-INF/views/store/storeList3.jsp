<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/css/store/storeList.css" rel="stylesheet">

<body>
<div class="wrap">
		<div>
			<c:if test="${empty ar}">
				<div class="no" style="padding: 40px;">
				등록된 매장이 없습니다. ㅠㅠ
				</div>
			</c:if>
			<input type="hidden" id="s1"value="${v}">
			<input type="hidden" id="s2"value="${v2}">
			<c:if test="${not empty ar}">
				
				<c:forEach items="${ar}" var="vo">
					<div class="sList">
					<img src="${pageContext.request.contextPath}/upload/${vo.storeFilesVO.fName}">
					<div style="float:right">주문하기</div>
					</div>
				</c:forEach>
					
			</c:if>
			
		</div>
		
	</div>
</body>

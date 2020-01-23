<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/css/store/storeList.css" rel="stylesheet">

<body>
<div class="wrap">
		<div style="padding: 30px">
			<c:if test="${empty ar}">
				<div class="no">
				등록된 매장이 없습니다. ㅠㅠ
				</div>
			</c:if>
		</div>
	</div>
</body>

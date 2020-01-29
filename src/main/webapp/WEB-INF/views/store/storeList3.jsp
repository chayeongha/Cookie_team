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
					<c:if test="${vo.sOn eq 1}">
						<div class="sList">
						<img src="${pageContext.request.contextPath}/upload/${vo.storeFilesVO.fName}">
						<div style="float:right">
							<div class="volist">
								<br><br><br><br>
								<div>${vo.sName}</div>
								<div>${vo.sTel}</div>
								<a href="./storeGoods?ssNum=${vo.ssNum}">주문하기</a>
							</div>
						</div>
						</div>
					</c:if>
					<c:if test="${vo.sOn eq 0}">
						<div class="sList" style="opacity: 0.5">
						<img src="${pageContext.request.contextPath}/upload/${vo.storeFilesVO.fName}">
						<div style="float:right">
							<div class="volist">
								<br><br><br><br>
								<div>${vo.sName}</div>
								<div>${vo.sTel}</div>
								<div>영업시간이 아닙니다.</div>
							</div>
						</div>
						</div>
					</c:if>
				</c:forEach>
					
			</c:if>
			<script type="text/javascript">
				$(".sList").click(function(){
					
					});
			</script>
		</div>
				
	</div>
</body>

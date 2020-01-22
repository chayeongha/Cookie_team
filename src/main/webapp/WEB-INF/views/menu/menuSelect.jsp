<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
<div class="contents">
	<h1>메뉴명 :${vo.mmName}</h1>
	<h1>가격:${vo.mmPrice}</h1>
	<img alt="제품이미지" src="../menu/${vo.menuFiles.mfName}">
	<h3>${vo.menuFiles.mfName}</h3>

	
	<c:forEach items="${vo.menuOptions}" var="opt">
	<h3>${opt.optName}</h3>
	<h3>${opt.optPrice}</h3>
	</c:forEach>


 <a href="./menuList?ssNum=${vo.ssNum}"> <input type="button" value="리스트로" style="cursor: pointer;"></a>
  <a href="./menuUpdate?mmNum=${vo.mmNum}"> <input type="button" value="메뉴 수정" style="cursor: pointer;"></a>
     <a href="./menuDelete?mmNum=${vo.mmNum}"> <input type="button" value="메뉴 삭제" style="cursor: pointer;"></a>
</div>

</body>
</html>
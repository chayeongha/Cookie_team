<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>ddd</h1>

매장명 :${store.sName}
매장 번호: ${store.sTel}
매장 위치: ${store.sSite}


<a href="./storeUpdate?sNum=${store.sNum}">매장 정보 수정하기</a>
</body>
</html>
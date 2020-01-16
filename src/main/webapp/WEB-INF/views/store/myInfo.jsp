<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/store/storeJoin.css" rel="stylesheet" />
<link href="/css/reset.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
</head>
<body>

	<div class="storeHeader">
		<div class="store_back">
			<a href="../" style="color: white;"><i class="fa fa-home"
				style="font-size: 42px; margin-left: 20px;"></i></a>
		</div>
		<div class="storeJoinTi">매장 정보</div>
	</div>
	<div class="class_select_store">매장을 선택해주세요</div>


	<div class="storeSection">
		<div class="storeSection_1">
			<c:forEach items="${list}" var="list">
				<div class="store_list_box">
					<div class="store_list_photo">
						<img alt="img" src="../upload/${list.storeFilesVO.fName}"
							width="300px" height="300px" class="photo_store">
					</div>
					<div class="store_list_text">
						<a href="./myinfoS?sNum=${list.sNum}" class="store_name">지점명 :
							${list.sName}</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>






</body>
</html>
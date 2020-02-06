<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie Cart</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<link href="${pageContext.request.contextPath}/css/store/storeDetail.css"
	rel="stylesheet">
</head>
<body>
	<div class="body_main">
		<div class="b"></div>
		<div id="container">
			<div id="contents">
					<h1>Cookie Cart</h1>
					<div class="cart_step_wrap">
						<ul class="cart_step_unit">
							<li class="step1 active">
								<span>STEP 01</span>
								<strong>장바구니</strong>
							</li>
							<li class="step2">
								<span>STEP 02</span>
								<strong>결제하기</strong>
							</li>
							<li class="step3">
								<span>STEP 03</span>
								<strong>결제완료</strong>
							</li>
						</ul>
					</div>
					<div class="cart_list_wrap">
						<p class="cart_all_wrap">
							<input type="checkbox" id="checkbox_all" class="custom_checkbox_all" checked="checked">
							<label for="checkbox_all">
								전체선택
							</label>
							<strong class="checkbox_name">상품명</strong>
							<strong class="checkbox_price">판매금액</strong>
							<strong class="checkbox_amount">수량</strong>
							<strong class="checkbox_total">구매금액</strong>
							<strong class="checkbox_select">선택</strong>
						</p>
						
						
						<ul class="cart_list_style">
				
					<c:set var="sum" value="0" />
				
					<c:forEach items="${cartList}" var="cartList">
						<input type="checkbox" class="cart_checkbox" id="checkbox${cartList.cartNum}" value="${cartList.cartNum}" checked="checked">
						<a href="storeSelect?store_num=<%-- ${cartList.store_num} --%>" class="product_info_img">
								<%-- <img alt="${cartList.store_name}" src="../resources/upload/store/th/${cartList.store_thumbimg}"> --%>
								<strong class="product_info_name"><%-- ${cartList.store_name} --%></strong>
								<input type="hidden" class="sname" id="input_sname${cartList.cartNum}" value="<%-- ${cartList.store_name} --%>">
								<span class="product_info_note"><%-- ${cartList.store_note} --%></span>
						</a>
												
					</c:forEach>
				</ul>
						
						
					</div>



			</div>
		</div>
<c:import url="../layout/footer.jsp" />
</div>

</body>
</html>
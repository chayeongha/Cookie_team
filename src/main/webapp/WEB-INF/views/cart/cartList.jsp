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
						
						<form action="../order/orderList" method="post" id="frm">
			
							<ul class="cart_list_style">
<!-- --aaaaaaaaaaaaaaaaaaaaaaa -->							
				
					<c:set var="sum" value="0" />
				
					<c:forEach items="${cartList}" var="cartList">
					
						<li id="cart_item_idx_${cartList.cartNum}">
							<input type="checkbox" class="cart_checkbox" id="checkbox${cartList.cartNum}" value="${cartList.cartNum}" checked="checked">
							
							<label for="checkbox${cartList.cartNum}"></label>
							
							<a href="storeSelect?store_num=${cartList.cartNum}" class="product_info_img">
								<img alt="${cartList.cartNum}" src="../resources/upload/store/th/${cartList.cartNum}">
								<strong class="product_info_name">${cartList.cartNum}</strong>
								<input type="hidden" class="sname" id="input_sname${cartList.cartNum}" value="${cartList.store_name}">
								<span class="product_info_note">${cartList.cartNum}</span>
							</a>
							
							<div class="product_info_onePrice_wrap">
								<span class="product_info_onePrice"><fmt:formatNumber value="${cartList.store_price}" pattern="###,###,###" /></span>
								<input type="hidden" class="sprice" id="input_sprice${cartList.cart_num}" value="${cartList.store_price}">
							</div>
							
							<div class="product_info_amount_wrap">
								<span class="product_info_count" id="count${cartList.cart_num}">${cartList.cart_amount}</span>
								<input type="hidden" class="camount" id="input_camount${cartList.cart_num}" value="${cartList.cart_amount}">
								<a href="#none" class="btn_amount_plus btn_amount_plus${cartList.cart_num}">+</a>
								<a href="#none" class="btn_amount_minus btn_amount_minus${cartList.cart_num}">-</a>
								<a href="#none" class="btn_amount_change btn_amount_change${cartList.cart_num}">변경</a>
							</div>
							
							<span class="product_info_price product_info_price${cartList.cart_num}"><fmt:formatNumber value="${cartList.store_price*cartList.cart_amount}" pattern="###,###,###" /></span>
							
						<script type="text/javascript">
							//,찍어주는 정규식 함수
							function addComma(price) {
							  var regexp = /\B(?=(\d{3})+(?!\d))/g;
							  return price.toString().replace(regexp, ',');
							}
							//총액 계산 함수
							function calTotal() {
								var price = 0;
								var amount = 0;
								
								$('input[class="cart_checkbox"]:checked').each(function(i) {
									
									if($(this).attr("checked") == "checked"){
										//alert($(this).attr("checked"));
										tprice = parseInt($(this).parent().find('.product_info_price').text().replace(/[^\d.-]/g, ''));
										//var salePrice = parseInt($(this).parent().find().text().replace(/[^\d.-]/g, ''));
										//amount = parseInt($(this).parent().find('.product_info_count').text().replace(/[^\d.-]/g, ''));
										
										price += tprice;
									}
									//총 상품금액
									$('#sales_price').text(addComma(price));
									//총 결제 예상 금액
									$('#total_price').text(addComma(price));
								});
							}
							//수량 박스 증가
							$('.btn_amount_plus'+${cartList.cart_num}).click(function() {
								var count = $('#count'+${cartList.cart_num}).text();
								//alert(count);
								count++;
								//alert(count);
								$('#count'+${cartList.cart_num}).text(count);
							});
							//수량 박스 감소
							$('.btn_amount_minus'+${cartList.cart_num}).click(function() {
								var count = $('#count'+${cartList.cart_num}).text();
								count--;
								if(count<1){
									count = 1;
								}
								$('#count'+${cartList.cart_num}).text(count);
							});
							//수량 박스 변경
							$('.btn_amount_change'+${cartList.cart_num}).click(function() {
								var cart_amount = $('#count'+${cartList.cart_num}).text();
								var cart_num = ${cartList.cart_num};
								
								$.ajax({
									url: "cartUpdate",
									type: "post",
									async: false,
									data: {
										cart_amount: cart_amount,
										cart_num: cart_num
									},
									success: function(data) {
										//alert(data);
										if(data>0){
											alert("수량이 변경되었습니다.");
											var price = cart_amount * ${cartList.store_price};
											price = addComma(price);
											$('.product_info_price'+${cartList.cart_num}).text(price);
											
											$('#input_camount'+${cartList.cart_num}).val(cart_amount);
											calTotal();
										}else {
											alert("수량 변경 실패");
										}
									},
									error: function() {
										alert("에러");
									}
								});
							});
						</script>
<!-- ------------------------------------------------------------ -->
							<div class="product_info_btn_wrap">
								<button type="submit" id="btn_now${cartList.cart_num}">바로구매</button>
							</div>
							
						<script type="text/javascript">
							$('#btn_now'+${cartList.cart_num}).click(function() {
								$('#input_sname'+${cartList.cart_num}).attr("name", "sname");
								$('#input_sprice'+${cartList.cart_num}).attr("name", "sprice");
								$('#input_camount'+${cartList.cart_num}).attr("name", "camount");
							});	
						</script>
<!-- ------------------------------------------------------------ -->
							<a href="#" class="btn_product_del btn_product_del${cartList.cart_num}">삭제</a>
							
						<script type="text/javascript">
							$('.btn_product_del'+${cartList.cart_num}).click(function() {
								var confirm_val = confirm("선택하신 상품을 삭제하시겠습니까?");
								
								if(confirm_val){
									var array_check = new Array();
									
									//alert($('#checkbox'+${cartList.cart_num}).val());
									array_check.push($('#checkbox'+${cartList.cart_num}).val());
									
									//alert(array_check);
									
									$.ajax({
										url: "cartDelete",
										type: "POST",
										data: { list : array_check},
										success: function(result) {
											if(result == 1){
												alert("삭제되었습니다.");
												location.href = "cartList";
											}else {
												alert("삭제 실패");
											}
										},
										error: function() {
											alert("error");
										}
									});
								}
							});
						</script>
					
						</li>
							<c:set var="sum" value="${sum + (cartList.store_price*cartList.cart_amount)}" />	
						
						
<!-- aaaaaaaaaaaaaaaaaa -->	
								
									
								</c:forEach>
							</ul>
						</form>
					
						
						
					</div>



			</div>
		</div>
<c:import url="../layout/footer.jsp" />
</div>

</body>
</html>
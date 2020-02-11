<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link href="${pageContext.request.contextPath}/css/store/storeDetail.css"
	rel="stylesheet">
</head>
<body>
	<div class="body_main">
		<div class="b"></div>
		<div id="container">
			<div id="contents">
					<h1>Cookie My Cart</h1>
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
					<c:forEach items="${cartList.menuVOs}" var="menuVO">
					
						<li id="cart_item_idx_${cartList.cartNum}">
							<input type="checkbox" class="cart_checkbox" id="checkbox${cartList.cartNum}" value="${cartList.cartNum}" checked="checked">
							
							<label for="checkbox${cartList.cartNum}"></label>
							
							<a href="storeSelect?store_num=${cartList.cartNum}" class="product_info_img">
								<img alt="${cartList.cartNum}" onerror="this.src='../images/header/mm.png'" src="${pageContext.request.contextPath}/menu/${menuVO.menuFiles.mfName}">
								<strong class="product_info_name">${menuVO.mmName}</strong>
								<input type="hidden" class="sname" id="input_sname${cartList.cartNum}" value="${cartList.ssNum}">
								<span class="product_info_note">
									<c:if test="${not empty cartList.cartOptionVOs}">
										<c:forEach items="${cartList.cartOptionVOs}" var="cartoptVO">
											<c:forEach items="${cartoptVO.moptVOs}" var="moptVO">
												<p>${moptVO.optName} + ${moptVO.optCount}</p>
											</c:forEach>
										</c:forEach>
									</c:if>
									<c:if test="${empty cartList.cartOptionVOs}">
										추가된 옵션이 없습니다.
									</c:if>
								</span>
							</a>
							
							<div class="product_info_onePrice_wrap">
								<span class="product_info_onePrice"><fmt:formatNumber value="${cartList.cartTotal}" pattern="###,###,###" /></span>
								<input type="hidden" class="sprice" id="input_sprice${cartList.cartNum}" value="${cartList.cartTotal}">
							</div>
							
							<div class="product_info_amount_wrap">
								<span class="product_info_count" id="count${cartList.cartNum}">${cartList.mmCount}</span>
								<input type="hidden" class="camount" id="input_camount${cartList.cartNum}" value="${cartList.mmCount}">
								<a href="#none" class="btn_amount_plus btn_amount_plus${cartList.cartNum}">+</a>
								<a href="#none" class="btn_amount_minus btn_amount_minus${cartList.cartNum}">-</a>
								<a href="#none" class="btn_amount_change btn_amount_change${cartList.cartNum}">변경</a>
							</div>
							
							<span class="product_info_price product_info_price${cartList.cartNum}"><fmt:formatNumber value="${cartList.cartTotal*cartList.mmCount}" pattern="###,###,###" /></span>
							
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
							$('.btn_amount_plus'+${cartList.cartNum}).click(function() {
								var count = $('#count'+${cartList.cartNum}).text();
								//alert(count);
								count++;
								//alert(count);
								$('#count'+${cartList.cartNum}).text(count);
							});
							//수량 박스 감소
							$('.btn_amount_minus'+${cartList.cartNum}).click(function() {
								var count = $('#count'+${cartList.cartNum}).text();
								count--;
								if(count<1){
									count = 1;
								}
								$('#count'+${cartList.cartNum}).text(count);
							});
							//수량 박스 변경
							$('.btn_amount_change'+${cartList.cartNum}).click(function() {
								var cart_amount = $('#count'+${cartList.cartNum}).text();
								var cart_num = ${cartList.cartNum};
								var cart_price = $(this).parent().parent().find($(".product_info_onePrice")).text();
								cart_price = cart_price.replace(",","");
								
								$.ajax({
									url: "./cartUpdate",
									type: "post",
									
									data: {
										"cart_amount": cart_amount,
										"cart_num": cart_num,
										"cart_price": cart_price
									},
									success: function(data) {
										//alert(data);
										if(data>0){
											alert("수량이 변경되었습니다.");
											//var price = mmCount * ${cartList.cartTotal};
											//price = addComma(price);
											//$('.product_info_price'+${cartList.cartNum}).text(price);
											
											//$('#input_camount'+${cartList.cartNum}).val(cart_amount);
											//calTotal();
											location.href = "cartList";
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
								<button type="submit" id="btn_now${cartList.cartNum}">바로구매</button>
							</div>
							
						<script type="text/javascript">
							$('#btn_now'+${cartList.cartNum}).click(function() {
								$('#input_sname'+${cartList.cartNum}).attr("name", "sname");
								$('#input_sprice'+${cartList.cartNum}).attr("name", "sprice");
								$('#input_camount'+${cartList.cartNum}).attr("name", "camount");
							});	
						</script>
<!-- ------------------------------------------------------------ -->
							<a href="#" class="btn_product_del btn_product_del${cartList.cartNum}">삭제</a>
							
						<script type="text/javascript">
							$('.btn_product_del'+${cartList.cartNum}).click(function() {
								var confirm_val = confirm("선택하신 상품을 삭제하시겠습니까?");
								
								if(confirm_val){
									var array_check = new Array();
									
									//alert($('#checkbox'+${cartList.cartNum}).val());
									array_check.push($('#checkbox'+${cartList.cartNum}).val());
									
									jQuery.ajaxSettings.traditional = true;
									$.ajax({
										url: "./cartDelete",
										type: "POST",
										data: {
											"list" : array_check,
											
											},
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
							<c:set var="sum" value="${sum + (cartList.cartTotal*cartList.mmCount)}" />	
						
						

								
								</c:forEach>	
								</c:forEach>
							</ul>
						</form>
							
							
				<a href="#none" class="btn_del_selected">
					선택 상품 삭제
					<span class="span_btn"></span>
				</a>
				
			<script type="text/javascript">
				//버튼 활성화, 비활성화 배경색 변경
				function btn_active() {
					if($('.cart_checkbox:checked').length > 0){
						$('.btn_wrap .btn_buy').css("background-color", "#fb4357");
					}else{
						$('.btn_wrap .btn_buy').css("background-color", "#373e46");
					}
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
				
				//체크박스 모두 선택, 해제
				$('.span_btn').css("display", "inline");
				$('.span_btn').text($('.cart_checkbox').length);
				
				$('#checkbox_all').click(function() {
					if($('#checkbox_all').prop("checked")){
						$('.cart_checkbox').prop("checked", true);
						$('.span_btn').css("display", "inline");
						$('.span_btn').text($('.cart_checkbox:checked').length);
						calTotal();
						
						$('.btn_wrap .btn_buy').css("background-color", "#fb4357");
					}else {
						$('.cart_checkbox').prop("checked", false);
						$('.span_btn').css("display", "none");
						//총 상품금액
						$('#sales_price').text(0);
						//총 결제 예상 금액
						$('#total_price').text(0);
						
						$('.btn_wrap .btn_buy').css("background-color", "#373e46");
					}
				});
				//체크박스 선택, 해제
				$('.cart_checkbox').click(function() {
					
					//전체 선택
					if($('.cart_checkbox:checked').length == $('.cart_checkbox').length){
						$('#checkbox_all').prop("checked", true);
					}else{
						$('#checkbox_all').prop("checked", false);
					}
					//선택 상품 개수
					$('.span_btn').css("display", "inline");
					
					if($('.cart_checkbox:checked').length > 0) {
						$('.span_btn').text($('.cart_checkbox:checked').length);
					}else {
						$('.span_btn').css("display", "none");
					}
					
					calTotal();
					btn_active();
				});
				//선택 삭제
				$('.btn_del_selected').click(function() {
					var confirm_val = confirm("선택하신 상품을 삭제하시겠습니까?");
					
					if(confirm_val){
						var array_check = new Array();
						
						$('input[class="cart_checkbox"]:checked').each(function() {
							array_check.push($(this).val());
						});
						
						
						jQuery.ajaxSettings.traditional = true;
						$.ajax({
							url: "./cartDelete",
							type: "POST",
							data: { 
								"list": array_check
								},
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
<!-- ------------------------------------------------------------ -->				
				
				<table class="cart_total_price_wrap">
					<colgroup>
						<col style="width:30%">
						<col style="width:36%">
						<col style="width:34%">
					</colgroup>
					<thead>
						<tr>
							<th>총 상품 금액</th>
							<th>할인 금액</th>
							<th>총 결제 예정 금액</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td>
								<strong>
									<span id="sales_price">
										<fmt:formatNumber value="${sum}" pattern="###,###,###"/>
									</span>
								</strong>
							</td>
							<td class="cart_calculator">
								<strong>
									<span id="total_discount">0</span>
								</strong>
							</td>
							<td>
								<strong class="cart_total_price">
									<span id="total_price">
										<fmt:formatNumber value="${sum}" pattern="###,###,###"/>
									</span>
								</strong>
							</td>
						</tr>
					</tbody>
				</table>
			
				<div class="btn_wrap">
					<input type="hidden" class="">
					<button class="btn_buy">결제하기</button>
				</div>
				
						
				
			<script type="text/javascript">
				function parameter() {
					
					var sn_i = $('input[name="sname"]').length;
					var sp_i = $('input[name="sprice"]').length;
					var ca_i = $('input[name="camount"]').length;
					var sname = new Array(sn_i);
					var sprice = new Array(sp_i);
					var camount = new Array(ca_i);
					
					for(var i=0; i<sn_i; i++){
						sname[i] = $('input[name="sname"]')[i].value;
					}
					for(var i=0; i<sp_i; i++){
						sprice[i] = $('input[name="sprice"]')[i].value;
					}
					for(var i=0; i<ca_i; i++){
						camount[i] = $('input[name="camount"]')[i].value;
					}
				}	
			
				$('.btn_wrap .btn_buy').click(function() {


					 var IMP = window.IMP; // 생략가능
						IMP.init('imp12494718'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
						IMP.request_pay({
						    pg : 'html5_inicis',
						    pay_method : 'card',
						    merchant_uid : 'merchant_' + new Date().getTime(),
						    name : 'CookieOrder',
						    amount : 1000,
						    buyer_email : ${memberVO.email},
						    buyer_name : ${memberVO.nickname},
						    buyer_tel : ${memberVO.phone},
						    buyer_addr : '@@',
						    buyer_postcode : '123-456'
						}, function(rsp) {
						    if ( rsp.success ) {
						        var msg = '결제가 완료되었습니다.';
						        msg += '고유ID : ' + rsp.imp_uid;
						        msg += '상점 거래ID : ' + rsp.merchant_uid;
						        msg += '결제 금액 : ' + rsp.paid_amount;
						        msg += '카드 승인번호 : ' + rsp.apply_num;
						    } else {
						        var msg = '결제에 실패하였습니다.';
						        msg += '에러내용 : ' + rsp.error_msg;
						    }
						    alert(msg);
						});
					
					
					if($('.cart_checkbox:checked').length > 0){
						
							if($('.cart_checkbox:checked')){
								$('.cart_checkbox:checked').parent().children().find('input[class="sname"]').attr("name", "sname");
								$('.cart_checkbox:checked').parent().children().find('input[class="sprice"]').attr("name", "sprice");
								$('.cart_checkbox:checked').parent().children().find('input[class="camount"]').attr("name", "camount");
							}else {
								$('input[class="sname"]').removeAttr("name");
								$('input[class="sprice"]').removeAttr("name");
								$('input[class="camount"]').removeAttr("name");
							}
						
							$("#frm").submit(); //sname, sprice, camount

							
							
					}else{
						alert("상품을 선택하세요.");
					}
				});

				 
			</script>
						
						
					</div>



			</div>
		</div>
<c:import url="../layout/footer.jsp" />
</div>

</body>
</html>
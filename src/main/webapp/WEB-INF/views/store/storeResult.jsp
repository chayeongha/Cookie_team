<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/reset.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/store/storeResult.css"
	rel="stylesheet">
</head>
<body>
	
	
	<div class="MenuStyle">
		<img alt="" src="${pageContext.request.contextPath}/menu/${Detail.menuFiles.mfName}" onerror="this.src='../images/header/mm.png'" style="width: 300px; height: 300px;" class="MeImg">

		<!-- 메뉴 -->
		<div class="DName">
			${Detail.mmName}
			<div class="menuPrice" style="display: none">${Detail.mmPrice}원</div>
		</div>
		수량
		<div class="quantity">
			 <button class="aMinus">-</button>
			<input type="text" class="mcount" value="1" readonly="readonly" name="mmCount">
			<button class="aPlus">+</button>
		</div>
		<div class="totalMenu" style="display: none;">${Detail.mmPrice}</div>

	</div>
	<!--옵션  -->
	
	<c:forEach items="${Detail.menuOptions}" var="de">
		<div class="ODName">extra. ${de.optName} ${de.optPrice}원</div>
		<input type="hidden" value="${de.optNum}" class="optNum">
		<div class="quantity">
			<button class="optMinus" id="${de.optPrice}">-</button>
			<input type="text" class="ocount" value="0" readonly="readonly" name="optCount">
			<button class="optPlus" id="${de.optPrice}">+</button>
			<input type="hidden" class="optPrice" value="0">
		</div>
		<%-- <div class="ODPrice"> <input type="text" value="${de.optPrice}" id="${de.optNum}"></div> --%>
	</c:forEach>
	
	<div class="totalOpt"></div>
	
	<div class="fBox">
		총<div class="totalPrice">${Detail.mmPrice}</div>　원
		<button class="inputCart">담기</button>

	</div>
	<script type="text/javascript">

	var opt_PM = 1;
		//메뉴 수량 감소
		$('.aMinus').click(function() {
			opt_PM = $('.mcount').val();
			var num = $('.mcount').val();
			var minusNum = num - 1;
			var price = ${Detail.mmPrice};
			
			if (minusNum <= 0) {
				$('.mcount').val(1);
			} else {
				$('.mcount').val(minusNum);
				price = price * minusNum;
			}

			$('.totalMenu').text(price);
			totalPrice();
		});

		//메뉴 수량 증가
		$('.aPlus').click(function() {
			opt_PM = $('.mcount').val();
			var num = $('.mcount').val();
			var price = ${Detail.mmPrice};
			opt_PM++;
			
			num++;
			$('.mcount').val(num);

			var price = price * num

			$('.totalMenu').text(price);
			totalPrice();
		});

		//옵션 수량 감소
		$('.optMinus').click(function() {
			var num = $(this).parent().find('input.ocount').val();
			//alert(num);
			var minusNum = num - 1;
			var price = $(this).attr("id");
			
			if (minusNum <= 0) {
				$(this).parent().find('input.ocount').val(0);
				//$(this).parent().parent().find('input.optNum').removeAttr("name");
				price = 0;
			} else {
				$(this).parent().find('input.ocount').val(minusNum);
				$(this).parent().parent().find('input.optNum').attr("name", "optNum");
				
				price = price * minusNum * opt_PM;
			}

			$(this).parent().find('input.optPrice').val(price);

			totalPrice();
		});
		
		//옵션 수량 증가
		$('.optPlus').click(function() {
			var num = $(this).parent().find('input.ocount').val();
			//alert(num);
			var price = $(this).attr("id");
			//alert(price);
			
			num++;
			$(this).parent().find('input.ocount').val(num);

			var price = price * num * opt_PM;;
			
			$(this).parent().find('input.optPrice').val(price);
			if(num>0){
				$(this).parent().parent().find('input.optNum').attr("name", "optNum");
				
			}
			totalPrice();
		});

		function totalPrice() {
			var oPrice = 0;
			//총액계산
			$('input.optPrice').each(function(i) {

				var optPrice = parseInt($(this).val().replace(/[^\d.-]/g, ''));
				oPrice = oPrice + optPrice;
				//alert(oPrice);

			})

			var menuPrice = parseInt($('div.totalMenu').text().replace(/[^\d.-]/g, ''));

			var totalPrice = oPrice + menuPrice;
			//alert(totalPrice);
			$('.totalPrice').text(totalPrice);
		}



		
	//////장바구니 버튼 클릭했을 때/////////////////
		$('.inputCart').click(function() {
			var mmNum = ${Detail.mmNum};
			var mmCount = $('input.mcount').val();

			var optNum = new Array();
			var optCount = new Array();
			
			$('input[name="optNum"]').each(function(index, item){
				optNum[index] = $(this).val(); 
               
             });

			$('input[name="optCount"]').each(function(index, item){
				optCount[index] = $(this).val(); 
               
             });
			

	
			
			for(var i=0;i<optNum.length;i++){
				
				if(optCount[i]==0){
					if(i==0){
						optNum.shift();
						optCount.shift();

						}else{
					optNum.splice(i,i);
					optCount.splice(i,i);
						}
				}
			}
			
// 			$.ajax({
// 				url: "cartSelect",
// 				type: "POST",
// 				//async: false,
// 				data: { ssNum : ssNum },
// 				success: function(data) {
// 					//alert(data.result);
// 					//동일 상품 존재 O - Update
// 					if(data.result == 1){
// 						//alert(data.cart_num);
						
// 						var confirm_val = confirm("장바구니에 동일한 상품이 존재합니다.\n수량을 변경하시겠습니까?");
						
// 						if(confirm_val){
// 							var cart_num = data.cart_num;
// 							cart_amount = cart_amount + data.cart_amount;
// 							//alert(cart_amount);
							
// 							$.ajax({
// 								url: "cartUpdate",
// 								type: "POST",
// 								//async: false,
// 								data: {
// 									cart_amount: cart_amount,
// 									cart_num: cart_num
// 								},
// 								success: function(result) {
// 									//alert(result);
// 									if(result == 1){
// 										modal();
// 									}else {
// 										alert("수량 변경 실패");
// 									}
// 								},
// 								error: function() {
// 									alert("에러");
// 								}
// 							});
// 						}
// 					//동일 상품 존재 X - Insert
// 					}else if(data.result == 2){
					var cartTotal = $(".totalPrice").text();
					
					jQuery.ajaxSettings.traditional = true;
						$.ajax({
							url: "../cart/cartInsert",
							type: "POST",
							//async: false,
							data: {
								mmNum: mmNum,
								mmCount: mmCount,
								optNum: optNum,
								optCount:optCount,
								cartTotal:cartTotal
							},
							success: function() {
								alert("장바구니에 추가되었습니다.");	
							},
							error: function() {
								alert("에러");
							}
						});
// 					//로그인 X
// 					}else{
// 						var confirm_val = confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?");
// 						if(confirm_val){
// 							location.href = "../member/memberLogin";
// 							//이동후에 로그인하면 다시 원래 페이지로 돌아오는 방법이 없을까?
// 						}
// 					}
// 				},
// 				error: function() {
// 					alert("에러");
// 				}
// 			});
		});
	/////////////////////////////




		
	</script>

</body>
</html>
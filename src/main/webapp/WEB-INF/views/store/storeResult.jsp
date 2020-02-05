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
		<img alt="" src="${pageContext.request.contextPath}/menu/${Detail.menuFiles.mfName}" style="width: 250px; height: 250px;" class="MeImg">

		<!-- 메뉴 -->
		<div class="DName">
			이름 : ${Detail.mmName}
			<div class="menuPrice">${Detail.mmPrice}원</div>
		</div>
		<div class="quantity">
			메뉴 갯수: <a href="javascript:void(0)" class="aMinus">◁</a>
			<input type="text" class="mcount" value="1" readonly="readonly" name="mmCount">
			<a href="javascript:void(0)" class="aPlus">▷</a>
		</div>
		<div class="totalMenu">${Detail.mmPrice}</div>

	</div>
	<!--옵션  -->

	<c:forEach items="${Detail.menuOptions}" var="de">
		<div class="ODName">옵션 이름 : ${de.optName} ${de.optPrice}원</div>
		<input type="hidden" value="${de.optNum}" class="optNum">
		<div class="quantity">
			옵션 횟수: <a href="javascript:void(0)" class="optMinus" id="${de.optPrice}">◁</a>
			<input type="text" class="ocount" value="0" readonly="readonly" name="optCount">
			<a href="javascript:void(0)" class="optPlus" id="${de.optPrice}">▷</a>
			<input type="hidden" class="optPrice" value="0">
		</div>
		<%-- <div class="ODPrice"> <input type="text" value="${de.optPrice}" id="${de.optNum}"></div> --%>
	</c:forEach>

	<div class="totalOpt"></div>
	<div class="totalPrice">${Detail.mmPrice}</div>


	<button class="inputCart">담기</button>

	<script type="text/javascript">
		//메뉴 수량 감소
		$('.aMinus').click(function() {
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
			var num = $('.mcount').val();
			var price = ${Detail.mmPrice};

			num++;
			$('.mcount').val(num);

			var price = price * num;

			$('.totalMenu').text(price);
			totalPrice();
		});

		//옵션 수량 감소
		$('.optMinus').click(function() {
			var num = $(this).parent().find('input.ocount').val();
			//alert(num);
			var minusNum = num - 1;
			var price = $(this).attr("id");
			//alert(price);

			if (minusNum <= 0) {
				$(this).parent().find('input.ocount').val(0);
				price = 0;
			} else {
				$(this).parent().find('input.ocount').val(minusNum);
				$(this).parent().find('input.optNum').attr("name", "optNum");
				price = price * minusNum;
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

			var price = price * num;

			$(this).parent().find('input.optPrice').val(price);
			$(this).parent().find('input.optNum').attr("name", "optNum");

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
			alert(mmNum);
			var mmCount = $('input.mcount').val();
			alert(mmCount);

			var optNum_i = $('input[name="optNum"]').length;
			var optNum = new Array(optNum_i);


			$('input[name="optNum"]').each(function(index, item){
				optNum[index] = $(this).val(); 
               
               });
			
			console.log($('input[name="optNum"]').val())
			
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
						$.ajax({
							url: "../cart/cartInsert",
							type: "POST",
							//async: false,
							data: {
								mmNum: mmNum,
								mmCount: mmCount,
								optNum: optNum
							},
							success: function() {
								alert("성공");	
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
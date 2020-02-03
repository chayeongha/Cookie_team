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
<link href="${pageContext.request.contextPath}/css/store/storeResult.css"
	rel="stylesheet">
</head>
<body>

<div class="MenuStyle">
	<img alt="" src="${pageContext.request.contextPath}/menu/${Detail.menuFiles.mfName}"
		style="width: 250px; height: 250px;" class="MeImg">

	<!-- 메뉴 -->
	<div class="DName">이름 : ${Detail.mmName}
	<div class="menuPrice">${Detail.mmPrice}원</div>
	</div>
	<div class="quantity">메뉴 갯수: 
			<a href="javascript:void(0)" class="aMinus">◁</a> 
			<input type="text" class="mcount" value="1" readonly="readonly" name="mmCount"> 
			<a href="javascript:void(0)" class="aPlus">▷</a>
		</div>
	<div class="totalMenu"></div>
	
</div>
	<!--옵션  -->

	<c:forEach items="${Detail.menuOptions}" var="de">
		<div class="ODName">옵션 이름 : ${de.optName}  ${de.optPrice}원</div>

		<div class="quantity">옵션 횟수: 
			<a href="javascript:void(0)" class="optMinus" id="${de.optPrice}">◁</a> 
			<input type="text" class="ocount" value="0" readonly="readonly" name="optCount"> 
			<a href="javascript:void(0)" class="optPlus" id="${de.optPrice}">▷</a>
			<input type="hidden" class="optPrice" value="0">
		</div>
		<%-- <div class="ODPrice"> <input type="text" value="${de.optPrice}" id="${de.optNum}"></div> --%>
	</c:forEach>
	
	<div class="totalOpt"></div>
	<div class="totalPrice">${Detail.mmPrice}</div>

	<script type="text/javascript">

	//메뉴 수량 감소
	$('.aMinus').click(function() {
		var num = $('.mcount').val();
		var minusNum = num - 1;
		var price = ${Detail.mmPrice};
	
		
		if(minusNum <= 0){
			$('.mcount').val(1);
		}else {
			$('.mcount').val(minusNum);
			price =  price * minusNum;
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
			alert(price);
			
			if(minusNum <= 0){
				$(this).parent().find('input.ocount').val(0);
				price = 0;
			}else {
				$(this).parent().find('input.ocount').val(minusNum);
				price =  price * minusNum;
			}

				$(this).parent().find('input.optPrice').val(price);

				totalPrice();
			});
	
	
		//옵션 수량 증가
		$('.optPlus').click(function() {
			var num = $(this).parent().find('input.ocount').val();
			//alert(num);
			var price = $(this).attr("id");
			alert(price);
			
			num++;
			$(this).parent().find('input.ocount').val(num);
			
			var price = price * num;
			
			$(this).parent().find('input.optPrice').val(price);

			totalPrice();
		});


		
		function totalPrice() {
			var oPrice = 0;
			//총액계산
			$('input.optPrice').each(function(i) {
				
				var optPrice = parseInt($(this).val().replace(/[^\d.-]/g, ''));

				
				oPrice = oPrice + optPrice;
				
				alert(oPrice);
				

			})

			var menuPrice = parseInt($('div.totalMenu').text().replace(/[^\d.-]/g, ''));

			
			var totalPrice = oPrice + menuPrice;
			alert(totalPrice);
			$('.totalPrice').text(totalPrice);
		}

		

	

		
	</script>

</body>
</html>
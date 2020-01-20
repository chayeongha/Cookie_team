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

<h1>메뉴 프리셋 페이지</h1>
<h2>기본 메뉴만 추가하는 페이지입니다. 가격과 옵션 수량은 수정 페이지에서 설정해주세요</h2>

<div class="container">
	<form action="./menuPreset" id="frm" method="post" enctype="multipart/form-data">
	<div class="form-group">
	<!-- 스토어번호 히든으로 바꿔야함  -->
      <input type="text" class="form-control" id="sNum" value="${store.sNum}" placeholder="Enter sNum" name="sNum">
	</div>
	
	<h2>Coffee</h2>
	
	<h3>Hot</h3>
												<!-- value 이름:가격:수량:카테고리넘버:온도 순  null값이 들어가면 안되므로-->
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="Hot 아메리카노:0:0:1:1">Hot 아메리카노
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="Hot 카페라떼:0:0:1:1">Hot 카페라떼
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="Hot 카페모카:0:0:1:1">Hot 카페모카
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="Hot 카라멜마끼아또:0:0:1:1">Hot 카라멜마끼아또
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="Hot 바닐라라떼:0:0:1:1">Hot 바닐라라떼
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="Hot 카푸치노:0:0:1:1">Hot 카푸치노
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="에스프레소:0:0:1:1">에스프레소
	
	<H3>ICE</H3>
	<input type="checkbox" class="opt_checkbox" name="menuP"  id="checkbox1" value="ICED 아메리카노:0:0:1:0">ICED 아메리카노
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="ICED 카페라떼:0:0:1:0">ICED 카페라떼
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="ICED 카페라떼:0:0:1:0">ICED 카페모카
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="ICED 카라멜마끼아또:0:0:1:0">ICED 카라멜마끼아또
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="ICED 바닐라라떼:0:0:1:0">ICED 바닐라라떼
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="ICED 카푸치노:0:0:1:0">ICED 카푸치노
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="콜드브루:0:0:1:0">콜드브루
	
	
	<H2>Beverage</H2>
	<h3>Hot</h3>
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="Hot 초콜렛:0:0:2:1">Hot 초콜렛
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="레몬 티:0:0:2:1">레몬 티
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="밀크티:0:0:2:1">밀크티 
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="로즈마리:0:0:2:1">로즈마리
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="얼그레이:0:0:2:1">얼그레이
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="캐모마일:0:0:2:1">캐모마일
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="유자차:0:0:2:1">유자차
	
	
	
	<H3>ICE</H3>
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="ICED 초콜렛:0:0:2:0">ICED 초콜렛
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="레몬 에이드:0:0:2:0">레몬 에이드
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="복숭아 에이드:0:0:2:0">복숭아 에이드
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="유자 에이드:0:0:2:0">유자 에이드
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="아이스 티 레몬:0:0:2:0">아이스 티 레몬
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="아이스 티 레몬:0:0:2:0">아이스 티 복숭아
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="딸기 스무디:0:0:2:0">딸기 스무디
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="요거트 스무디:0:0:2:0">요거트 스무디
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="자바칩 프라푸치노:0:0:2:0">자바칩 프라푸치노
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="카라멜 프라푸치노:0:0:2:0">카라멜 프라푸치노
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="바닐라 프라푸치노:0:0:2:0">바닐라 프라푸치노
	
	
	<h2>Desert</h2>
	
	<h3>Bread</h3>
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="허니 브레드:0:0:3:3">허니 브레드
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="갈릭 버터 브레드:0:0:3:3">갈릭 버터 브레드
	
	<h3>Cake</h3>
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="티라미수:0:0:3:3">티라미수
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="레드벨벳:0:0:3:3">레드벨벳
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="초콜릿 무스:0:0:3:3">초콜릿 무스	
	
	<h3>Ice Cream</h3>
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="소프트 아이스크림:0:0:3:3">소프트 아이스크림	
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="아포가토:0:0:3:3">아포가토	
	
	<h3>마카롱/초콜릿</h3>
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="블루베리 마카롱:0:0:3:3">블루베리 마카롱
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="산딸기 마카롱:0:0:3:3">산딸기 마카롱
	<input type="checkbox" class="Menu_checkbox" name="menuP"  id="checkbox1" value="그린티 마카롱:0:0:3:3">그린티 마카롱
	
	<div>
	 <button type="submit" class="btn_submit">Submit</button>
	 </div>
	</form>
</div>

	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="/css/menu/menuPre.css" rel="stylesheet"/>
<link href="/css/reset.css" rel="stylesheet" />
</head>
<body>
<div class="storeHeader">
<div class="mTitle">Menu Page</div>
<div class="MsemiTitle">기본 메뉴만 추가하는 페이지입니다. 가격과 옵션 수량은 수정 페이지에서 설정해주세요</div>
</div>
	<form action="./menuPreset" id="frm" method="post" enctype="multipart/form-data">

	<div class="form-group">
	<!-- 스토어번호 히든으로 바꿔야함  -->
      <input type="text" class="form-control" id="sNum" value="${store.sNum}" placeholder="Enter mmName" name="sNum">
	</div>
	
	<div class="preMain">
	<br>
	<div class="Tipre">　#Coffee</div>
	<br>
	<div class="preBox1">								
	
	<h3>Hot</h3>
	<br>
												<!-- value 이름:가격:수량:카테고리넘버:온도 순  null값이 들어가면 안되므로-->
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c1" value="Hot 아메리카노:0:0:1:1">
	<label for="c1"><span></span>Hot 아메리카노</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c2" value="Hot 카페라떼:0:0:1:1">
	 <label for="c2"><span></span>Hot 카페라떼</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c3" value="Hot 카페모카:0:0:1:1">
	 <label for="c3"><span></span>Hot 카페모카</label>
	
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c4" value="Hot 카라멜마끼아또:0:0:1:1">
	 <label for="c4"><span></span>Hot 카라멜마끼아또</label>
	
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c5" value="Hot 바닐라라떼:0:0:1:1">
	 <label for="c5"><span></span>Hot 바닐라라떼</label>
	
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c6" value="Hot 카푸치노:0:0:1:1">
	 <label for="c6"><span></span>Hot 카푸치노</label>
	
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c7" value="에스프레소:0:0:1:1">
	 <label for="c7"><span></span>에스프레소</label>
	 </div>	
	

	<div class="preBox1_1">
		<br>
	<H3>ICE</H3>
		<br>
	<input type="checkbox" class="opt_checkbox" name="menuP" id="c8" value="ICED 아메리카노:0:0:1:0">
	 <label for="c8"><span></span>ICED 아메리카노</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c9" value="ICED 카페라떼:0:0:1:0">
	 <label for="c9"><span></span>ICED 카페라떼</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c10" value="ICED 카페라떼:0:0:1:0">
	 <label for="c10"><span></span>ICED 카페모카</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c11" value="ICED 카라멜마끼아또:0:0:1:0">
	 <label for="c11"><span></span>ICED 카라멜마끼아또</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c12" value="ICED 바닐라라떼:0:0:1:0">
	 <label for="c12"><span></span>ICED 바닐라라떼</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c13" value="ICED 카푸치노:0:0:1:0">
	 <label for="c13"><span></span>ICED 카푸치노</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c14" value="콜드브루:0:0:1:0">
	 <label for="c14"><span></span>콜드브루</label>
	 </div>
	
	
	
	<br>
	<div class="Tipre1">　#Beverage</div>
		<br>
	<div class="preBox2">
	
	<h3>Hot</h3>
		<br>
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c15" value="Hot 초콜렛:0:0:2:1">
	 <label for="c15"><span></span>Hot 초콜렛</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c16" value="레몬 티:0:0:2:1">
	 <label for="c16"><span></span>레몬 티</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c17" value="밀크티:0:0:2:1">
	 <label for="c17"><span></span>밀크티 </label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c18" value="로즈마리:0:0:2:1">
	 <label for="c18"><span></span>로즈마리</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c19" value="얼그레이:0:0:2:1">
	 <label for="c19"><span></span>얼그레이</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c20" value="캐모마일:0:0:2:1">
	 <label for="c20"><span></span>캐모마일</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c21" value="유자차:0:0:2:1">
	 <label for="c21"><span></span>유자차</label>
	</div>
	
	
	<div class="preBox3">
		<br>
	<H3>ICE</H3>
		<br>
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c22" value="ICED 초콜렛:0:0:2:0">
	 <label for="c22"><span></span>ICED 초콜렛</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c23" value="레몬 에이드:0:0:2:0">
	 <label for="c23"><span></span>레몬 에이드</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c24" value="복숭아 에이드:0:0:2:0">
	 <label for="c24"><span></span>복숭아 에이드</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c25" value="유자 에이드:0:0:2:0">
	 <label for="c25"><span></span>유자 에이드</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c26" value="아이스 티 레몬:0:0:2:0">
	 <label for="c26"><span></span>아이스 티 레몬</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c27" value="아이스 티 레몬:0:0:2:0">
	 <label for="c27"><span></span>아이스 티 복숭아</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c28" value="딸기 스무디:0:0:2:0">
	 <label for="c28"><span></span>딸기 스무디</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c29" value="요거트 스무디:0:0:2:0">
	 <label for="c29"><span></span>요거트 스무디</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c30" value="자바칩 프라푸치노:0:0:2:0">
	 <label for="c30"><span></span>자바칩 프라푸치노</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c31" value="카라멜 프라푸치노:0:0:2:0">
	 <label for="c31"><span></span>카라멜 프라푸치노</label>
	 
	<input type="checkbox" class="Menu_checkbox" name="menuP" id="c32" value="바닐라 프라푸치노:0:0:2:0">
	 <label for="c32"><span></span>바닐라 프라푸치노</label>
	</div>

<br>
<div class="Tipre2">　#Dessert</div>
	<br>
   <div class="preBox4">
   
   <h3>Bread</h3>
   	<br>
   <input type="checkbox" class="Menu_checkbox" name="menuP"  id="c33" value="허니 브레드:0:0:3:3">
   <label for="c33"><span></span>허니 브레드</label>
   <input type="checkbox" class="Menu_checkbox" name="menuP"  id="c34" value="갈릭 버터 브레드:0:0:3:3">
    <label for="c34"><span></span>갈릭 버터 브레드</label>
   </div>
   
   <div class="preBox5">
   <h3>Cake</h3>
   	<br>
   <input type="checkbox" class="Menu_checkbox" name="menuP"  id="c35" value="티라미수:0:0:3:3">
    <label for="c35"><span></span>티라미수</label>
   <input type="checkbox" class="Menu_checkbox" name="menuP"  id="c36" value="레드벨벳:0:0:3:3">
    <label for="c36"><span></span>레드벨벳</label>
   <input type="checkbox" class="Menu_checkbox" name="menuP"  id="c37" value="초콜릿 무스:0:0:3:3">
    <label for="c37"><span></span>초콜릿 무스</label>
   </div>
   
   <div class="preBox6">
   <h3>Ice Cream</h3>
   	<br>
   <input type="checkbox" class="Menu_checkbox" name="menuP"  id="c38" value="소프트 아이스크림:0:0:3:3">
   <label for="c38"><span></span>소프트 아이스크림</label>
   <input type="checkbox" class="Menu_checkbox" name="menuP"  id="c39" value="아포가토:0:0:3:3">
   <label for="c39"><span></span>아포가토 </label>
   </div>
   
   <div class="preBox7">
   <h3>마카롱/초콜릿</h3>
   <br>
   <input type="checkbox" class="Menu_checkbox" name="menuP"  id="c40" value="블루베리 마카롱:0:0:3:3">
   <label for="c40"><span></span>블루베리 마카롱 </label>
   <input type="checkbox" class="Menu_checkbox" name="menuP"  id="c41" value="산딸기 마카롱:0:0:3:3">
   <label for="c41"><span></span>산딸기 마카롱 </label>
   <input type="checkbox" class="Menu_checkbox" name="menuP"  id="c42" value="그린티 마카롱:0:0:3:3">
   <label for="c42"><span></span>그린티 마카롱 </label>
   </div>
   </div>
   
   <div class="submitBtn8">
    <button type="submit" class="btn_submit">Submit</button>
    </div>
   
   </form>

	
	


</body>
</html>
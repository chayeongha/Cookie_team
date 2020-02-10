<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

</head>
<body>
		
		  <script>
    $(document).ready(function(){
      $('.slider').bxSlider();
    });
  </script>

</head>
<body>

  <div class="slider">
   	<c:forEach items="${smList }" var="sm">
   	
    <div>
    <img alt="이미지를 넣어주세요!" onerror="this.src='../images/header/mm.png'" src="../upload/${sm.storeFilesVO.fName}" style="width: 200px; height: 200px;">
   <p> ${sm.sName}</p>
   <p> ${sm.roadFullAddr}</p>
    </div>
    
   	</c:forEach>
  </div>



<%-- 		<c:forEach items="${smList}" var="sm"> --%>
<!-- 					<ul class="bxslider"> -->
<%-- 						<li><img alt="이미지를 넣어주세요!" onerror="this.src='../images/header/mm.png'" src="../upload/${sm.storeFilesVO.fName}" style="width: 200px; height: 200px;"></li> --%>
				
<!--     				</ul> -->
<%-- 		</c:forEach> --%>
		
		<script type="text/javascript">
// 		$(document).ready(function () {

// 		    $('.bxslider').bxSlider({ // 클래스명 주의!

// 		        auto: true, // 자동으로 애니메이션 시작

// 		        speed: 500,  // 애니메이션 속도

// 		        pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)

// 		        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)

// 		        autoControls: true, // 시작 및 중지버튼 보여짐

// 		        pager: true, // 페이지 표시 보여짐

// 		        captions: true, // 이미지 위에 텍스트를 넣을 수 있음

// 		    });

// 		});


		</script>	
		
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>jQuery Circle Bars Plugin Demos</title>
    <link href="//www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/assets/circle.css">
    <link rel="stylesheet" type="text/css" href="/css/assets/demo.css">
    <link rel="stylesheet" type="text/css" href="/css/assets/skins/yellowcircle.css">
    <link rel="stylesheet" type="text/css" href="/css/assets/skins/purplecircle.css">
    <link rel="stylesheet" type="text/css" href="/css/assets/skins/firecircle.css">
    <link rel="stylesheet" type="text/css" href="/css/assets/skins/whitecircle.css">
    <link rel="stylesheet" type="text/css" href="/css/assets/skins/simplecircle.css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400" rel="stylesheet">
    <script type="text/javascript" src="/css/assets/circle.js"></script>
</head>
<body>

<div style="display: none;">
	<input type="hidden" value="${store.ssNum}">
	<c:forEach items="${money}" var="m">
		<div class="money" id="${m.ordersVO.ooDate}" title="${m.ordersVO.ooTotal}">${m.ordersVO.ooTotal}</div>
		<div class="TDate">${m.ordersVO.ooDate}</div>
	</c:forEach>
</div>	
<!-- <div class="MoneyT">
<p>우리카페 목표금액 : 2,500,000원</p>
<div class="TMWrap"><input type="text" value="누적 매출 : "><div class="TodayM"></div><div class="Mw">원</div></div>
<div class="totalMoney" style="display: none;"></div>

</div>
 -->


   <div class="circles-container bg-white">
           <div class="MoneyT">
<p>우리카페 목표금액 : 2,500,000원</p>
<div class="TMWrap"><input type="text" value="현재 누적 매출은 ?"><div class="TodayM"></div><div class="Mw">원</div></div>
<div class="totalMoney" style="display: none;"></div>

</div>
    <div class="circlebar" data-circle-startTime=0 data-circle-maxValue="" data-circle-dialWidth=10 data-circle-size="400px" data-circle-type="progress">
                <div class="loader-bg">
                    <div class="text">00:00:00</div>
                </div>
            </div>
            
        </div>


        
        
        

	<script type="text/javascript">
		var first = 0;
		var total = $(".money").attr("title");

		total = parseInt(total); //String 타입>Int 타입으로 형변환(돈계산이니까)
		//alert(typeof total);	//number 형태로 형변환 확인
		//alert(typeof first);

		$('div.money').each(function(i) {
			first = first + total;
			
			//alert(first);

		});

		$('.TodayM').text(first);
		
		
		//하루 총 목표 금액이 250만원이라면  평균 퍼센테이지 구할수 있음

		var avg = 2500000/first;
		//avg = Math.floor(avg);
		//alert(avg+"%"); 
		
		$('.totalMoney').text(avg);

		$('.circlebar').attr("data-circle-maxValue",avg);
	

		
		
	</script>

	<script>
        $(document).ready(function() {
        	 
            var t2 = new Circlebar({
                element: ".circlebar",
                maxValue: avg,
                fontColor: "#777",
                fontSize: "30px",
                skin: "fire",
                type: "progress"
            });
        });
    </script>

	<script type="text/javascript">
			  var _gaq = _gaq || [];
			  _gaq.push(['_setAccount', 'UA-36251023-1']);
			  _gaq.push(['_setDomainName', 'jqueryscript.net']);
			  _gaq.push(['_trackPageview']);
			  (function() {
			    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			  })();
	</script>



</body>
</html>
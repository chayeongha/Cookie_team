<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store List</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/board/boardList.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/store/storeList.css" rel="stylesheet">
</head>
<body>
<div class="body_main">
	<div class="b"></div>
	
	<!-- 서브 타이틀 -->
	<div class="subTitle_wrap">
		<div class="subTitle_inner">
			<h2>제휴매장</h2>
		</div>
	</div>
	
	<div class="container">

		<div class="wrap">
			<div class="e">
				<p>
				<input type="button" value="서울" class="map1" id="">
				<input type="button" value="부산" class="map1">
				<input type="button" value="대구" class="map1">
				<input type="button" value="인천" class="map1">
				<input type="button" value="광주" class="map1">
				<input type="button" value="대전" class="map1">
				</p>
				<p>
				<input type="button" value="울산" class="map1">
				<input type="button" value="세종" class="map1">
				<input type="button" value="경기" class="map1">
				<input type="button" value="강원" class="map1">
				<input type="button" value="충북" class="map1">
				<input type="button" value="충남" class="map1">
				</p>
				<p>
				<input type="button" value="전북" class="map1">
				<input type="button" value="전남" class="map1">
				<input type="button" value="경북" class="map1">
				<input type="button" value="경남" class="map1">
				<input type="button" value="제주" class="map1">
				</p>
			</div><!-- map1끝 -->
		</div>
		
		<div class="wrap">
			<div class="map2">
			
			</div>
		</div>

		
		
		<script type="text/javascript">
			
			$(".map1").click(function(){
				
				var v =$(this).val();
				$(".map1").removeClass('a');
				$(".map1").addClass('map1');
				$(this).addClass('a');
				$(".map2").empty();
				var ar = 
				$.ajax({
					url:"./storeList2",
					type:'get',
					data:{
						"v":v
						},
					success:function(data){
						$(".map2").html(data);
						}
				});
				
			
				});	
		</script>
		
		
	</div>
<c:import url="../layout/footer.jsp" />
</div>
</body>
</html>
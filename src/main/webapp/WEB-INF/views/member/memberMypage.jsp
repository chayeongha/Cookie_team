<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<link href="/css/member/memberLogin.css" rel="stylesheet"/>
<link href="/css/member/memberMypage.css" rel="stylesheet"/>
<!--이미지슬라이더  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

</head>
<body>
<div class="body_main">
	<div class="b"></div>
		<div class="container">

		<h1>${member.name}님 환영합니다</h1>
		<div class="mypageBox">
			<div class="myImg">
				<img alt="이미지를 넣어주세요!" onerror="this.src='../images/header/profile.png'" src="../upload/${member.memberFilesVO.fname}" >
			</div> 
			
			<input type="hidden" class="form-control" id="memNum" value="${member.memNum}" readonly="readonly">
			
			<div class="box">
      			
      			<label for="name" class="e">회원 등급</label>
      		<c:if test="${member.grade eq 1 }">
      			<c:if test="${member.memTotal le  100000 }">
      			<input type="text" class="" id="grade" value="BRONZE COOKIE" style="color:#b07a5e" readonly="readonly">
      			</c:if>
      			<c:if test="${100000 lt member.memTotal  and member.memTotal  le  500000}">
      			<input type="text" class="" id="grade" value="SILVER COOKIE" style="color:#c1c6cd" readonly="readonly">
      			</c:if>
      			<c:if test="${500000 lt  member.memTotal }">
      			<input type="text" class="" id="grade" value="GOLD COOKIE" style="color:#f0c828" readonly="readonly">
      			</c:if>
      		</c:if>		
      			<c:if test="${member.grade eq 9999}">
      			<input type="text" value="관리자" style="color:#ff0000" readonly="readonly">
      			</c:if>
      			<c:if test="${member.grade eq 8888}">
      			<input type="text" value="점주" style="color:#ff0000" readonly="readonly">
      			</c:if>
    		</div>
			
			<div class="box">
      			<label for="id">ID</label>
      			<input type="text" class="" id="memId" value="${member.memId}" readonly="readonly">
    		</div>
    
    		<div class="box">
      			<label for="name">이름</label>
      			<input type="text" class="" id="name" value="${member.name}" readonly="readonly">
    		</div>
    
     		<div class="box">
      			<label for="nickname">닉네임</label>
      			<input type="text" class="" id="nickname" value="${member.nickname}" readonly="readonly">
    		</div>
    			
    		<div class="box">
      			<label for="phone">phone</label>
      			<input type="text" class="" id="phone" value="${member.phone}" readonly="readonly">
    		</div>
    		
    		<div class="box">
      			<label for="email">email</label>
      			<input type="text" class="" id="email" value="${member.email}" readonly="readonly">
    		</div>
    		
    	<%-- <c:if test="${member.grade ne 8888}">	
    		<div class="point">
      			<label for="name"> 적립금</label>
      			<input type="text" class="point2" id="memPoint" value="${member.memPoint}포인트" readonly="readonly">
    		</div>
    		
    		<div class="point">
      			<label for="name" > 총 사용금액</label>
      			<input type="text" class="point2" id="memTotal" value="${member.memTotal}원" readonly="readonly">
    		</div>
    	</c:if>	 --%>

		</div><!-- mypageBox끝 -->
		
		<c:if test="${member.kind eq null}">
			<div class="e3">
					<a class="bt" id="mDel">회원탈퇴</a>
					<a class="bt" id="mUp">회원수정</a>	
					<c:if test="${member.grade eq 1 }">
						<a class="bt" href="${pageContext.request.contextPath}/calendar/calmain">출석체크 하러가기</a>
					</c:if>
			</div>		
		</c:if>
		
		
		<div class="box2">
			<div class="box3_inner">
				<h1>전국의 매장을 만나보세요.</h1>
				<div class="storeMiniList">
				</div>			
			</div>
			<div class="box4_inner">

				<h1>포인트 내역</h1> <div class=""></div>

				<c:if test="${member.grade ne 8888}">	
    		<div class="point">
      			<label for="name"> 적립금</label>
      			<input type="text" class="point2" id="memPoint" value="${member.memPoint}포인트" readonly="readonly">
    		</div>
    		<br>
    		<div class="point">
      			<label for="name" > 총 사용금액</label>
      			<input type="text" class="point2" id="memTotal" value="${member.memTotal}원" readonly="readonly">
    		</div>
    	</c:if>	
			</div>
			 
			<div class="box2_inner">
				<%-- <button class="btn" onclick="location='../orders/orderListList?nickname=${member.nickname}'">더 보기</button> --%>
			
				<div class="orderList">
				</div>
			</div>
		</div>
		
	</div>
</div>	

	<c:import url="../layout/footer.jsp" />	

<script type="text/javascript">
		var nickname2=$("#nickname").val();
		//정보수정
		$('#mUp').click(function() {
			location.href="./memberUpdate";
		});

		//회원탈퇴
		$('#mDel').click(function(){
			console.log(nickname2);
			if(confirm("회원을 탈퇴하시겠습니까?")){

				$.ajax({
				type : "GET",
				url : "memberDelete",
				data : {
						nickname : $("#nickname").val()
				},
				success : function(data) {
					data =data.trim();

					if (data == 1) {
						alert("성공적으로 회원정보가 삭제되었습니다")
						location.href="../";
					}else{
						alert("처리가 실패되었습니다");
					}
				}
			}); 
		   }
		});

		//해당div에 스토어 미니 리스트를 출력해줌.
		$(document).ready(function(){
		    $(".storeMiniList").load("./storeMiniList");
		});
		//해당div에  오더리스트를 출력해줌.
		$(document).ready(function(){
		    $(".orderList").load("../orders/orderListList?nickname="+nickname2);
		});
		
</script>
		
	
</body>
</html>
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
</head>
<body>
<div class="body_main">
	<div class="b"></div>
		<div class="container">

		<h1>${member.name}님 환영합니다</h1>
		<div class="mypageBox">
			<div class="myImg">
				<img alt="이미지를 넣어주세요!" onerror="this.src='../images/header/mm.png'" src="../upload/${member.memberFilesVO.fname}">
			</div> 
			
			<input type="hidden" class="form-control" id="memNum" value="${member.memNum}" readonly="readonly">
			
			<div class="box">
      			<label for="name" class="e">회원 등급</label>
      			<c:if test="${member.grade eq 1}">
      			<input type="text" class="" id="grade" value="Famliy" style="color:#00bb00" readonly="readonly">
      			</c:if>
      			<c:if test="${member.grade eq 2}">
      			<input type="text" class="" id="grade" value="VIP" style="color:#ff0080" readonly="readonly">
      			</c:if>
      			<c:if test="${member.grade eq 3}">
      			<input type="text" class="" id="grade" value="SVIP" style="color:#ff0000" readonly="readonly">
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
    		
    		<div class="box">
      			<label for="name" class="e2">월 사용금액</label>
      			<input type="text" class="" id="phone" value="" readonly="readonly">
    		</div>
    		

		</div><!-- mypageBox끝 -->
		<div class="e3">
				<button class="bt" id="mDel">회원탈퇴</button>
				<button class="bt" id="mUp">회원수정</button>
		</div>		
		
		<div class="box2">
			<h1>주문내역</h1>
			<div class="box2_inner">
				<h1>222</h1>
				<h1>222</h1>
				<h1>222</h1>
				<h1>222</h1>
				<h1>222</h1>
			</div>
		</div>
	
	</div>
</div>	

	<c:import url="../layout/footer.jsp" />	

<script type="text/javascript">

		//정보수정
		 $('#mUp').click(function() {
			
			location.href="./memberUpdate";
				
		});

		//회원탈퇴
		 $('#mDel').click(function(){
				
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
						location.href="./memberIndex";
					}else{
						alert("처리가 실패되었습니다");
					}
				}
			}); 
		   }
		});

</script>
		
</div>		
</body>
</html>
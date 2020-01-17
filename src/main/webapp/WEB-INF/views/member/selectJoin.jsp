<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<link href="/css/member/member.css" rel="stylesheet"/>
</head>
<body>
<div class="body_main">
	<div class="b"></div>
	<div class="sinner">
		<div class="container">

			<h1 style="font-family: CookieRun-Black; color:#270c0c; padding:40px">쿠키오더 회원 가입</h1>
 			<div class="select_member">
 				<div class="mem1">
 					<div><img src="/images/member/mem2.png"></div>
					<form action="./memberJoin" method="get">
		             <button type="submit" class="me1">개인 회원가입</button>
		             <input type="hidden" name="jkind" value="Personal">
		             <input type="hidden" name="grade" value="1">
		          </form>
      			</div>    

				
				<div class="mem2">
					<div><img src="/images/member/mem.png"></div>
					<form action="./memberJoin" method="get">
		             <button type="submit" class="me1">사업자 회원가입</button>
		             <input type="hidden" name="jkind" value="Buisness">
		             <input type="hidden" name="grade" value="8888">
		          </form>
				</div>
				
			</div>
			</div>	
		</div><!--sinner-->
	<c:import url="../layout/footer.jsp" />


</div><!-- body_main끝 -->
</body>
</html>
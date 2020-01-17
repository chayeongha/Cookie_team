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
<link href="/css/member/memberLogin.css" rel="stylesheet"/>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<div class="body_main">
	<div class="b"></div>	
	<div class="container">
	  		<h1>Cookie Login</h1>
	  <form action="./memberLogin" method="post" class="frm">
	    <div>
	      <label for="id" class="la">ID </label>
	      <input type="text" class="" id="id" placeholder="Enter id" name="id">
	    </div>
	    <div>
	      <label for="pw" class="la">PW </label>
	      <input type="password" class="" id="pw" placeholder="Enter password" name="pw">
	    </div>
	    <div class="checkbox">
	      <label><input type="checkbox" name="remember"> Remember me</label>
	    </div>
	    <button type="submit" class="btn_Login">로그인</button>
	    <button type="button" class="btn_Login" id="join_go">회원가입</button>
	  </form>
	  
	  <div class="add_join">
	  		<h2>간편 로그인</h2>
			<!-- 네이버아이디로로그인 버튼 노출 영역 -->
		  <div id="naver_id_login"></div>
		  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
		  <script type="text/javascript">
		  	var naver_id_login = new naver_id_login("nG_EsxFXAS7FGKZ4Z6ED", "http://localhost/member/memberNaver");
		  	var state = naver_id_login.getUniqState();
		  	naver_id_login.setButton("white", 2,40);
		  	naver_id_login.setDomain("hLdQpMn4Ur");
		  	naver_id_login.setState(state);
		  	naver_id_login.setPopup();
		  	naver_id_login.init_naver_id_login();
		  </script>
	  </div>
	  
	  
	  
	</div><!-- container끝 -->
	<c:import url="../layout/footer.jsp" />
	<script type="text/javascript">
		$("#join_go").click(function(){
			location.href="selectJoin";

			});
	</script>
	
	
</div>	
</body>
</html>
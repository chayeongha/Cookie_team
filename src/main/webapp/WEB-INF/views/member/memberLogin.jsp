<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Login</title>
<c:import url="../template/boot.jsp" />
<c:import url="../layout/header.jsp" />
<link href="/css/member/memberLogin.css" rel="stylesheet"/>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
</head>
<body>
<div class="body_main">
	<div class="b"></div>	
	<div class="container">

	  		<h1>Cookie Login</h1>
	  <form action="./memberLogin" method="post" class="frm">
	    <div>
	      <label for="id" class="la">ID </label>
	      <input type="text" class="" id="memId" placeholder="Enter id" name="memId">
	    </div>
	    <div>
	      <label for="pw" class="la">PW </label>
	      <input type="password" class="" id="pw" placeholder="Enter password" name="pw">
	    </div>
	    <div class="checkbox">
	      <label><input type="checkbox" name="remember"> Remember me</label>
	    </div>
	    <div class="idpw">	    
		    <a href="./searchIdPw">아이디 / 비밀번호 찾기</a>
		</div>
	    <button type="submit" class="btn_Login">로그인</button>
	    <button type="button" class="btn_Login" id="join_go">회원가입</button>
	  </form>
	  
	  <div class="add_join">
	  		<h2>간편 로그인</h2>
	  		<div class="aj">SNS 계정으로도 이용이 가능합니다.</div>
	  			
		<!-- 네이버아이디로로그인 버튼 노출 영역 -->
		  <div id="naver_id_login" style="display: none"></div>
		  <div class="nv_btn" onclick="document.getElementById('naver_id_login_anchor').click();"></div>
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
		  
			<div  class="btn-login-sns-box login-form-box panel-body" >
					<a id="kakao-login-btn"></a>
					
			</div>
			<script type='text/javascript'>

			$(".sns-login-kakao-logo").click(function() {
			    $("#kakao-login-btn").click();
			 });
			
			  //<![CDATA[
			    // 사용할 앱의 JavaScript 키를 설정해 주세요.
			    Kakao.init('df2f1bd915d5ed98ee4e1782f47aff61');

			    Kakao.Auth.createLoginButton({
				      container: '#kakao-login-btn',
				      success: function(authObj) {
				        // 로그인 성공시, API를 호출합니다.
				        Kakao.API.request({
				          url: '/v2/user/me',
				          success: function(res) {
				            
				       		 $.ajax({
					        	type: "POST",
					        	url:"./memberKakao",
					        	data:{
						        	nickname: res.properties.nickname,
						        	email:res.kakao_account.email
					        	}, 
					        	success : function(res)
					        	{
					        	  alert('로그인 성공');    
					        	},
					        	error: function(res) {
								  alert('로그인실패');
								},
								complete : function(res) {
									location.href="../";
								}
				       		 
					        });
				          },
				          fail: function(error) {
				            alert(JSON.stringify(error));
				          }
				        });
				      },
				      fail: function(err) {
				        alert(JSON.stringify(err));
				      }
				    });
				  //]]>	

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
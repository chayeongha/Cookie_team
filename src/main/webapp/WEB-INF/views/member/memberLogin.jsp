<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		      <label><input type="checkbox" name="remember" id ="idSaveCheck"> Remember me</label>
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
		      <!-- //네이버아이디로로그인 버튼 노출 영역 끝 -->
				  
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

	</div>
	<!-- container끝 -->
	
	<c:import url="../layout/footer.jsp" />

	<script type="text/javascript">

		//회원가입하러가기
		$("#join_go").click(function(){
			location.href="selectJoin";
		});

		//아이디 기억하기
		$(document).ready(function(){
			var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기

			$("input[name='memId']").val(userInputId); 
			// 그 전에 ID를 저장해서 처음 페이지 로딩
			if($("input[name='memId']").val() != ""){ // 아이디 저장하기 체크되어있을 시,
				$("#idSaveCheck").attr("checked", true); // 아이디 저장하기를 체크 상태로 두기.
			}

			//체크박스에 변화가 생길때
			$("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
		        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
		            var userInputId = $("input[name='memId']").val();
		            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		        }else{ // ID 저장하기 체크 해제 시,
		            deleteCookie("userInputId");
       			 }
    		});
			
			 // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		    $("input[name='memId']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
		            var userInputId = $("input[name='memId']").val();
		            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		        }
		    });
		});

		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		 
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		 
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
		//아이디 기억하기 끝
		
	</script>
	
	
	

</div>	
<!--Class= body_main  끝 -->

</body>
</html>
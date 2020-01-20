<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/store/storeJoin.css" rel="stylesheet" />
<link href="/css/reset.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";

	function goPopup() {
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/popup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	/** API 서비스 제공항목 확대 (2017.02) **/
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		document.form.engAddr.value = engAddr;
		document.form.jibunAddr.value = jibunAddr;
		document.form.zipNo.value = zipNo;
		document.form.admCd.value = admCd;
		document.form.rnMgtSn.value = rnMgtSn;
		document.form.bdMgtSn.value = bdMgtSn;
		document.form.detBdNmList.value = detBdNmList;
		/** 2017년 2월 추가제공 **/
		document.form.bdNm.value = bdNm;
		document.form.bdKdcd.value = bdKdcd;
		document.form.siNm.value = siNm;
		document.form.sggNm.value = sggNm;
		document.form.emdNm.value = emdNm;
		document.form.liNm.value = liNm;
		document.form.rn.value = rn;
		document.form.udrtYn.value = udrtYn;
		document.form.buldMnnm.value = buldMnnm;
		document.form.buldSlno.value = buldSlno;
		document.form.mtYn.value = mtYn;
		document.form.lnbrMnnm.value = lnbrMnnm;
		document.form.lnbrSlno.value = lnbrSlno;
		/** 2017년 3월 추가제공 **/
		document.form.emdNo.value = emdNo;

	}
</script>
</head>
<body>

	<div class="storeHeader">

		<div class="store_back">
			<a href="../" style="color: white;"><i
				class="fa fa-arrow-circle-left"
				style="font-size: 42px; margin-left: 20px;"></i></a>
		</div>
		<div class="storeJoinTi">지금 바로 매장 등록을 해보세요!</div>
	</div>
	<div class="storeInsertForm">
		<form action="storeInsert" method="post" enctype="multipart/form-data"
			name="form" id="form">


			<input type="hidden" id="memNum" name="memNum" value="${member.memNum}">
			<div>
				<div class="store_label">점주 아이디:</div>
				<!-- id 세션에서 점주 아이디만 받아오기 -->
				<input type="text" id="memId" name="memId" 
					class="store_input" value="${member.memId}">		
			</div>

			<div>
				<div class="store_label">지점이름:</div>
				<input type="text" id="sName" name="sName" placeholder="	지점이름을 입력해주세요" class="stName store_input"> 
					<input type="button" id="OK" value="중복확인">
			</div>

			<div>
				<div class="store_label">지점전화번호:</div>
				<input type="text" id="sTel" name="sTel" placeholder="	지점의 전화번호를 입력해주세요" class="store_input">
			</div>

			<div>

				<div class="store_label">지점주소:</div>
				<input type="text" id="roadFullAddr" name="roadFullAddr" placeholder="	지점의 주소를 입력해주세요" readonly="readonly"
					class="store_input"> <input type="button"
					onClick="goPopup();" value="주소 검색" class="addrbtn" />
			</div>

			<div>
				<label for="sOn"></label>
				<!-- 영업여부 -->
				<input type="hidden" id="sOn" value="0" name="sOn" placeholder="	영업시간은 가입후 자세히" readonly="readonly"
					class="store_input">
			</div>

			<div>
				<label for="sNotice"></label> <input type="hidden" id="sNotice" name="sNotice" placeholder="	개업시작 공지를 알리세요" class="store_input">
			</div>
			<div>
				<!-- <div class="store_label">로고 등록:</div>
				<input type="file" class="store_input" id="files" name="files"> -->
				
				<div class="filebox">
  					<label for="files">업로드</label><input type="text" readonly="readonly" id="file_route" class="store_input">
  					<input type="file" id="files" name="files" onchange="javascript:document.getElementById('file_route').value=this.value">
				</div>

			</div>
			<input type="button" id="join" value="Join" class="store_join_btn">
		</form>
	</div>
	
	
	



	<script type="text/javascript">
			var scheck =0;
		$("#OK").click(function() {
			var sName = $("#sName").val();

			if (sName == "") {
				alert("매장명을 입력해주세요");
			} else {
				$.ajax({

					type : "post",
					url : "checkStore",
					/* async: false, */
					data : {
						sName : sName
					},
					success : function(data) {
						alert(data);
						if($.trim(data)>0){
							alert("쓰지마");
							$("#sName").val("");
							$("#sName").focus();		
						}else{
							alert("써라");
							scheck=1;
							alert(scheck);
						}
						
					},
					error : function() {
						alert("ajax error");
					}

				});
			}

		});


	$("#join").click(function(){

		if($("#sName").val() ==""){
			alert("매장명 입력해주세요");
		}else if($("#sTel").val()== ""){
			alert("전화번호를 입력해주세요")
		}else if($("#roadFullAddr").val() == ""){
			alert("주소를 입력해주세요")
		}else{
			confirm("회원가입을 하시겠습니까?")
			if(scheck>0){	
			$("#form").submit();
			
			}else{
				alert("중복확인을 해주세요")
				$("#sName").focus();
			}

		}

		});

</script>



</body>
</html>
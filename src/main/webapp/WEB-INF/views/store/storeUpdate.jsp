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



	<input type="hidden" id="sNum" name="sNum" value="${store.sNum}">
	<div class="storeHeader">

		<div class="store_back">
			<a href="../" style="color: white;"><i
				class="fa fa-arrow-circle-left"
				style="font-size: 42px; margin-left: 20px;"></i></a>
		</div>
		<div class="storeJoinTi">매장 정보를 업데이트 하세요!</div>
	</div>
	<div class="storeInsertForm">
		<form action="storeUpdate" method="post" enctype="multipart/form-data"
			name="form" id="form">

			<div>
				<div class="store_label">점주 아이디:</div>
				<!-- id 세션에서 점주 아이디만 받아오기 -->
				<input type="text" id="id" name="id" value="${member.id}"
					class="store_input" readonly="readonly">
			</div>

			<div>
				<div class="store_label">지점이름:</div>
				<input type="text" id="sName" name="sName" class="store_input" value="${store.sName}">
			</div>

			<div>
				<div class="store_label">지점전화번호:</div>
				<input type="text" id="sTel" name="sTel" class="store_input" value="${store.sTel}">
			</div>

			<div>

				<div class="store_label">지점주소:</div>
				<input type="text" id="roadFullAddr" name="roadFullAddr" class="store_input" value="${store.roadFullAddr}"> <input
					type="button" onClick="goPopup();" value="주소 검색" class="addrbtn" />
			</div>

			<div>
				<label for="sOn"></label>
				<!-- 영업여부 -->
				<input type="hidden" id="sOn" value="0" name="sOn" readonly="readonly" class="store_input">
			</div>

			<div>
				<label for="sNotice"></label> <input type="hidden" id="sNotice" name="sNotice" class="store_input">
			</div>
			<div>
				<div class="store_label">로고 등록:</div>
				<input type="file" class="store_input" id="files" name="files">

			</div>
			<input type="submit" id="update" value="Update"
				class="store_join_btn">
		</form>
	</div>
</body>
</html>
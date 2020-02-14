<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/reset.css" rel="stylesheet"/>
<link href="/css/member/agree.css" rel="stylesheet"/>
</head>
<body>
	<c:import url="../template/boot.jsp" />
	<div class="main">
		<div class="mtitle">
			<div class="AgreeJoin">회원가입</div>
		</div>		
		<div class="img"><img alt="" src="/images/header/mm.png" width="150px;" height="150px;"></div>		
			<div class="AgreeSemi">회원가입 약관동의 및 본인인증단계입니다.</div>
			<div class="agreeTi">홈페이지 이용약관 동의 (필수)
			<span class="agree-check">
				<input type="checkbox"name="agree1" id="check1" class="agree check1"> 
				<label for="checkbox"><span></span>동의</label>
				
			</span>
			</div>
			<div class="agreement">
					<div class="privacy_cont">
	           <p class="tit">쿠키 코리아는 고객님을 보호합니다.</p>
	           <p class="t1">쿠키커피 코리아의 서비스의 이용과 관련하여 필요한 사항을 규정합니다.</p>
	           <p class="pri_tit" id="quick_01">제1장 총칙</p>
	           <p class="sub_tit" id="quick_01_01">1. 목적</p>
	           <ol class="pri_con pri_con2 mb40">
	            <ul>
	            <li>
	             1. 쿠키커피 코리아(이하 '회사'라고 칭함)에서 운영하는 사이트는 아래와 같은 약관에 동의하는 이용자들에게 제공되는 인터넷서비스로 이용자와 회사의 권리 및 의무를 규정함을 목적으로 합니다.
	            </li>
	
	            <li>2. 이용자는 회사가 정한 소정의 등록절차를 걸쳐 '회원 가입' 버튼을 클릭하면 이 약관과 함께 이에 동의하는 것으로 간주합니다.</li>
	            <li>3. 회사 홈페이지의 모든 자료는 스타벅스 및 자회사, 계열사 혹은 스타벅스에 의해 자격을 취득한 기타 이해 관계자에 의한 저작권, 등록의장, 등록상표 또는 기타 지적소유권으로 보호되고 있습니다.</li>
	            <li>4. 본 사이트에 포함된 자료는 정보목적으로만 제공됩니다. 귀하는 본 사이트의 내용에 대하여 어떤 방법으로도 배포, 출판, 전송, 변경, 전시, 모방작품의 창조 혹은 개발하지 않을 것에 동의하는 것으로 간주되며, 회사의 권한을 보호하고 옹호함은 물론 본 사이트의 자료를 허가 없이 유용함으로써 발생할 수 있는 어떠한 손해도 입히지 않아야 합니다. 허가 없이 사이트의 내용을 유용하는 경우에는 회사와 Starbucks Corporation에 돌이킬 수 없는 손해를 입힐 수도 있다는 사실을 인지하시기 바랍니다. 이와 같이 인가되지 않은 유용사실에 대하여 회사와 스타벅스는 법적, 재정적으로 가능한 기타 추가적인 배상과 관련한 권한을 가지고 있습니다. 피드백 및 제출자료. 귀하가 제출하는 자료의 내용에 대한 책임은 전적으로 귀하에게 있습니다. 제출자료에 불법, 중상모략, 비난 혹은 비도덕적인 내용이 포함되어서는 안됩니다. 사이트에 저작권, 등록상표권, 사생활권 혹은 기타 사적 권리 혹은 소유권을 포함하는 제삼자의 권리를 침해하는 어떤 자료도 게시하여서는 안됩니다.</li>
	            <li>5. 이용자의 개인정보 보호 및 보안, 개인정보에 대한 수집, 이용 및 저장과 관련한 관행 및 정책에 대하여는 함께 첨부된 개인정보취급방침에 의합니다.</li>
	            </ul>
	           </ol>
	           <p class="sub_tit" id="quick_01_02">2. 약관의 수정</p>
	           <ol class="pri_con pri_con2 mb40">
	            <ul>
	            <li>1. 회사는 약관을 변경할 수 있으며 변경된 약관은 회원에게 화면을 통한 공지 등의 방법으로 공지함으로 효력을 발생합니다.</li>
	            <li>2. 회사는 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 홈페이지에 그 적용일의 7일전부터 공시하거나<br> 회원이 입력한 가장 최근의 <span class="en">e-mail</span>로 전송하는 방법으로 회원에게 고지합니다. 다만, 회원에게 불리한 내용으로 약관을 개정하는 경우에는<br> 적용일로부터30일전까지 홈페이지에 공시하고 회원이 입력한 가장 최근의 <span class="en">e-mail</span>로 전송하는 방법으로 회원에게 고지합니다.<br> 변경된 약관은 공시하거나 고지한 적용일로부터 효력이 발생합니다.</li>
	          </ul>
	           </ol>
	           <p class="sub_tit" id="quick_01_03">3. 이용자의 정의</p>
	           <p class="mb40">'이용자”란 회사 홈페이지에 접속하여 본 약관에 따라 회사 인터넷 회원으로 가입하여 회사 홈페이지가 제공하는 서비스를 받는 자를 말합니다.</p>
	           <p class="pri_tit" id="quick_02">제 2장 회원 관리 및 서비스</p>
	           <ol class="pri_con pri_con2 mb40">
	            <li>
	             <span id="quick_02_01">1. 회원 <span class="en">ID</span>와 비밀번호</span>
	             <ul>
	              
	              <!-- 20151007 남인태 추가 -->
	              <li>회원 가입은 무료이며, 회원ID(회원번호)와 비밀번호(<span class="en">Password</span>)에 관한 모든 관리 책임은 다 이용자에게 있습니다.<br><span class="color_point">다만, 14세 미만 자는 회원으로 가입할 수 없습니다. </span><br>
	              회원ID(계정)는 1인당 1개의 ID만 생성 및 등록이 가능하며, ID생성을 위해 필요한 개인정보를 허위로 제공하거나, 본인이 아닌 타인의 정보를 무단으로 사용하여 회원ID를 만들 수 없습니다.<br>이를 위반할 경우, 회원에게 제공되는 서비스의 제한이 있을 수 있으며, 본 약관 각 조항에서 정하고 있는 불이익을 받을 수 있습니다.<br>
	              가입 시, <span class="en">e</span>-프리퀀시 바코드가 회원계정으로 발급되며, <span class="en">e</span>-프리퀀시 이벤트 기간 일 경우 해당 바코드로 <span class="en">e</span>-프리퀀시 이벤트 참여가 가능합니다.<br> 이용자에게 부여된 회원번호(<span class="en">ID</span>) 및 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 각각의 회원에게 있습니다.<br> 회원 자신의 <span class="en">ID</span>가 부정하게 사용된 경우 이용자는 반드시 회사에 그 사실을 지체 없이 통보하여 조치를 받아야 하며, 통보의 지연으로 인해 발생하는 부분은 회사가 책임지지 않습니다.</li>
	              <!-- 20151007 남인태 추가 end -->
	            
	             </ul>
	            </li>
	            <li>
	             <span id="quick_02_02">2. 회원 탈퇴</span>
	             <ol>
	              <li>
	               1. 회원은 탈퇴를 희망하는 경우, <span class="en">my</span> 스타벅스 페이지에서 “회원 탈퇴” 버튼을 통해 탈퇴 신청을 합니다.
	               <ul>
	                <li>-스타벅스 기명식 선불 충전카드를 보유한 고객의 카드가 잔액이 남아 있고 정지 상태에 있는 회원의 경우, 카드의 환불 및 환급 등의 처리 절차가 모두 완료된 다음에 탈퇴할 수 있습니다.</li>
	                <li>-스타벅스 <span class="en">e</span>-프리퀀시 이벤트 기간 중 탈퇴 시에는 적립 된 <span class="en">e</span>-스티커가 모두 소멸됩니다.</li>
	               </ul>
	              </li>
	              <li>
	               2. 회원 탈퇴 시점이 프리퀀시 이벤트가 진행되는 시점일 경우, 회원 탈퇴 요청일 현재까지 적립된 <span class="en">e</span>-스티커는 자동으로 소멸되며,<br> 재가입 시 소멸된 e-스티커는 복원되지 않습니다.
	              </li>
	              <li>
	               3. 회원 가입은 회원이 가입 후 탈퇴, 재 가입 등을 반복함으로써 회사가 제공하는 쿠폰, 이벤트 혜택 등 경제상의 이익을 취하거나<br> 기타 명의도용 등의 불법적인 행위 등을 방지하기 위하여, 회원 탈퇴를 한 날로부터 30일이 경과 해야만 재가입이 가능합니다.
	              </li>
	              <li>
	               4. 회원이 다음 각 호의 사유에 해당하는 경우, 회사는 관리자의 권한으로 회원자격을 박탈할 수 있습니다.
	               <ul>
	                <li>가. 다른 사람의 회사 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우</li>
	                <li>나. 관계 법령을 위배하거나 미풍양속을 저해하고자 하는 목적으로 회원 가입신청을 할 경우</li>
	                <li>다. 본 약관에 위반한 경우</li>
	                <li>라. 본 회사의 권리를 침해하거나 도용하였을 경우</li>
	                <li>마. 기타 회원으로서의 자격을 지속시키는 것이 부적절하다고 판단되는 경우</li>
	               </ul>
	              </li>
	             </ol>
	            </li>
	            <li>
	             <span id="quick_02_03">3. 서비스의 내용과 수정</span>
	             <ul>
	              <li>회사는 여러 가지 정보서비스를 제공하며 필요에 따라 그 내용이 추가, 변경 및 정지될 수 있습니다. 또한 회사는 천재지변 또는 중계선 고장 등의 불가피한 사정으로 인하여 서비스를 중단할 수 있습니다.</li>
	              <li>회사는 필요한 경우 회원의 동의 없이 회원이 가입 시 기재한 <span class="en">E-mail</span>주소로 <span class="en">E-mail</span>을 발송할 수 있습니다.</li>
	             </ul>
	            </li>
	            <li>
	             <span id="quick_02_04">4. 업무의 제휴</span>
	             <ul>
	              <li>회사는 이용자의 편의를 도모하고 효과적인 서비스 운영을 위해 서비스의 일정 부분에 대해 다른 회사와 제휴할 수 있습니다.<br>제휴회사가 서비스와 관련하여 진행한 활동은 회사가 직접 시행한 활동에 준하는 효력이 있습니다.</li>
	             </ul>
	            </li>
	            <li>
	             <span id="quick_02_05">5 .이벤트 참여</span>
	             <ol>
	              <li>1. 홈페이지 회원의 경우, <span class="en">e</span>-프리퀀시 바코드가 자동 발급됩니다. ”e-프리퀀시 바코드”란 회원 가입 시 회원의 계정에 자동으로 발급되는<br> 온라인 적립 수단이며, e-프리퀀시 이벤트 진행 시, 등록된 e-프리퀀시 바코드에 e-스티커를 적립하여 관련 혜택을 받을 수 있습니다.</li>
	              <li>2. 회사에서 프리퀀시 이벤트가 진행되는 기간 동안, 회원 가입 시 자동으로 발급된 e-프리퀀시 바코드에 회사에서 정한 적립 기준에 따라<br> “e-스티커”를 적립할 수 있습니다. <span class="en">e</span>-프리퀀시 바코드의 구체적인 운영 방침이나 활용 방법 및 혜택은 회사의 마케팅 정책에 따라 변할 수 있으며,이에 대해서는 별도의 방법으로 사전에 안내해 드립니다.</li>
	             </ol>
	            </li>
	            <li>
	             <span id="quick_02_06">6. 사용자 정보</span>
	             <ul>
	              <li>회원 등록 시 기재하는 모든 이용자 정보는 이름을 포함하여 모두 실제 데이타인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은<br>사용자는 법적인 보호를 받을 수 없으며 회사의 서비스 제한 등의 조치를 받을 수 있습니다.</li>
	             </ul>
	            </li>
	            <li>
	             <span id="quick_02_07">7. 회원 등록정보의 이용</span>
	             <ol>
	              <li>1. 회사는 회원 등록정보를 집단적인 통계치 형태로 사용할 수는 있습니다. 아울러 각 이용자 개인 정보는 이용자가 타인에게 피해를 주거나 기타 다른 불온한 문제를 일으킬 경우를 제외하고는 이용자의 동의 없이 공개하지 않습니다.</li>
	              <li>2. 회사는 회원이 회사의 권리를 침해하거나 기타 불법행위를 하는 경우, 정당한 법 절차에 따라 회원의 정보를 이용할 수 있습니다.</li>
	              <li>3. 회사는 수사기관이 수사와 관련하여 정당한 법 절차에 따라 회원의 정보를 요구하는 경우에는 이에 응하여 회원의 등록 정보를<br> 수사기관에 제공할 수 있습니다.</li>
	             </ol>
	            </li>
	            <li class="new_color_point">
	             <span id="quick_02_08">8. 회사 서비스에 포함된 회원 게시물의 관리</span>
	             <ol>
	              <li>1. 회원이 서비스를 이용하여 서비스 상에 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 게시한 '게시물'의 저작권은 적법한 저작권자에게 귀속됩니다. </li>
	              <li>2. 회원 서비스를 이용하는 경우, 회사는 회원의 프로필 사진 및 게시물(예: 캘린더 상 직접 입력 정보, 리뷰, 댓글 등)을 회원 서비스 화면에 표시할 수 있습니다. 이 경우, 회사는 저작권법 규정을 준수하며, 회원은 언제든지 고객센터 또는 홈페이지 내 관리기능을 통해 해당 게시물에 대해 삭제, 비공개 등의 조치를 취할 수 있습니다.</li>
	              <li>3. 회사는 고객의 게시물을 소중하게 생각하며 변조, 훼손, 삭제되지 않도록 최선을 다하여 보호합니다. 그러나 고객의 게시물이 '정보통신망법' 및 '저작권법'등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 게시물의 게시 중단 및 삭제 등을 요청할 수 있으며, 회사는 관련법에 따라 조치를 취하여야 합니다.</li>
	              <li>4. 회사는 전항에 따른 권리자의 요청이 없는 경우라도 권리 침해가 인정될 만한 사유가 있거나 기타 회사 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 '게시물'에 대해 임시 조치 등을 취할 수 있습니다. </li>
	              <li>5. 회사는 바람직한 게시판 문화를 활성화하기 위하여 동의 없는 타인의 신상 공개시 특정부분을 삭제하거나 기호 등으로 수정하여 게시할 수 있습니다.</li>
	              <li>6. 게시물에 관련된 제반 권리와 책임은 작성자 개인에게 있습니다. 또 게시물을 통해 자발적으로 공개된 정보는 보호받기 어려우므로 정보 공개 전에 심사숙고 하시기 바랍니다.</li>
	              <li>7. 가입 해지 시 고객께서 작성하신 게시물은 자동으로 파기됩니다. 보관을 원하시는 게시물은 미리 고객님의 컴퓨터에 저장하셔야 합니다.</li>
	              <li>8. 일부 서비스에 의해서 발생되는 정보는 가입 해지의 경우 삭제되며,  그 외의 경우 명시적 또는 개별적인 경고 후 삭제 조치할 수 있습니다.</li>
	             </ol>
	            </li>
	            <li>
	             <span id="quick_02_09">9. 서비스의 중단</span>
	             <ol>
	              <li>1. 회사는 컴퓨터 등 정보통신설비의 보수 점검 교체 및 고장, 통신의 두절, 기타 불가항력적 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.</li>
	              <li>2. 회사는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상하지 아니합니다. 단 회사의 고의 또는 과실이 있는 경우에는 그러하지 아니합니다.</li>
	             </ol>
	            </li>
	            <li class="new_color_point">
	             <span id="quick_02_10">10. 휴면계정 관리</span>
	             <ol>
	              <li>1. 회사는 회원이 12개월 이상 로그인 하지 않으면, 휴면계정으로 간주하고 회사가 제공하는 서비스 이용을 아래와 같이 제한/상실시킬 수 있습니다. </li>
	              
	              <li>2. 12개월 이상 서비스에 로그인하지 않는 경우에는 휴면계정으로 별도 관리되어 웹서비스 이용이 중단되며, 이후 다시 서비스를 이용하려면 본인확인 절차를 거쳐야 합니다. (30일 전 안내문(전자우편)을 통지) </li>
	              <li>3. 마이 스타벅스 리워드 회원은 등록된 Starbucks Card의 최종 충전일 또는 최종 사용일로부터 5년동안 거래내역이 없으며, 로그인 하지 않았을 경우에 해당되며, 회원자격 상실에 대한 안내문(전자우편)을 상실 30일전 통지하고 회원자격을 상실시킬 수 있습니다.</li>
	            
	             </ol>
	            </li>
	           
	            <li class="new_color_point">
	             <span id="quick_02_11">11. 본인 인증 서비스 </span>
	             <ol>
	              <li>1. 회사는 전기통신사업법 제84조 2항에 따라, 발신번호의 변조 방지를 위해 번호인증을 통한 발신번호 사전 등록서비스를 제공 및 운영합니다.  </li>
	              <li>2. 회사는 이용고객의 회원가입 시 타인의 명의를 도용한 부정가입을 방지하기 위해 본인인증 서비스 사업자가 제공하는 인증방법을 통해 본인인증서비스를 제공 및 운영합니다. </li>
	              <li>3. 회사는 고객의 발신번호 사전등록 및 본인 인증 절차를 거친 후 e-Gift 및 e-Coupon 선물하기 서비스를 제공하여야 합니다.</li>
	              <li>4. 본인 인증 서비스 동의 거부 및 불이익<br>
	                  본인 인증 서비스에 대한 동의를 거부 시, 회원 가입이 불가하며, e-Gift 및 e-Coupon 선물하기 서비스를 이용할 수 없습니다.</li>
	             </ol>
	            </li>
	            
	           </ol>
	           <p class="pri_tit color_point" id="quick_03">제3장 개인위치정보의 수집 및 개인위치정보의 이용 또는 제공</p>
	           <ol class="pri_con new_color_point  mb40">
	            <li>
	             <span id="quick_03_01">1. 위치정보관리책임자</span>
	             <ul>
	              <li>위치정보사업자 및 위치기반서비스사업자로서 회사의 정보 및 위치정보관리책임자는 아래와 같습니다.</li>
	             </ul>
	             <ul>
	              <li>
	             <dl>
	              <dt>가.회사의 정보</dt>
	              <dd>상호 : 쿠키커피 코리아</dd>
	              <dd>주소 : 서울특별시 </dd>
	              <dd>대표전화 : 010-0000-0000</dd>
	              <dt>나. 위치정보관리책임자의 정보</dt>
	              <dd>직위 : 팀장</dd>
	              <dd>성명 : 쿠쿠쿠쿠</dd>
	              <dd>대표전화 : 02-0000-0000</dd>
	              <dd>문의게시판: 고객센터(전화 02-0000-0000 또는 “웹사이트 &gt; 고객 서비스 &gt; 고객의 소리 &gt; 문의하기”) </dd>
	             </dl>
	           </li>
	         </ul>
	            </li>
	            <li>
	             <span id="quick_03_02">2. 위치정보의 수집 방법</span>
	             <ul>
	              <li>회사는 회원이 보유한 스마트폰, 타블렛PC 및 기타 이와 유사한 기기 등 GPS 수신기, 와이파이, 블루투스, 마이크 등을 탑재한 단말기(이하 “통신단말장치”라고 합니다)로부터 옥외에서는 기지국 기반(cell id) 및 GPS 신호를, 옥내에서는 무선 AP들의 와이파이 정보, 고주파 데이터 등을 통해 위치정보를 수집합니다.</li>
	             </ul>
	            </li> 
	            <li>
	             <span id="quick_03_03">3. 회원의 위치정보에 대한 권리 행사 방법</span>
	             <ul>
	              <li>회원의 권리와 그 행사방법은 아래와 같습니다.</li>
	              <li>가. 회원은 회사에 대하여 언제든지 개인위치정보의 수집에 대한 동의 또는 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치정보의 제3자 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다. 이 경우 회사는 수집한 개인위치정보 및 위치정보 수집,이용, 제공사실 확인자료(동의의 일부를 철회한 경우에는 철회한 부분의 개인위치정보 및 위치정보 이용,제공사실 확인자료에 한함)를 파기합니다.</li>
	              <li>나. 회원은 회사에 대하여 언제든지 개인위치정보의 수집, 이용 또는 제공의 일시적인 중지를 요구할 수 있으며, 회사는 이를 거절할 수 없고 이를 위한 기술적 수단을 갖추고 있습니다.</li>
	              <li>다. 회원은 회사에 대하여 아래 각 목의 자료에 대한 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 사유없이 회원의 요구를 거절할 수 없습니다.
	               <ol>
	                <li>1) 본인에 대한 위치정보 수집, 이용, 제공사실 확인자료</li>
	                <li>2) 본인의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법률 규정에 의하여 제3자에게 제공된 이유 및 내용</li>
	               </ol>
	              </li>
	              <li>라. 회원은 위 가목 내지 다목의 권리행사를 고객센터(전화 02-3015-1100 또는 “웹사이트 &gt; 고객 서비스 &gt; 고객의 소리 &gt; 문의하기”)를 통해 회사에 요구할 수 있습니다.</li>
	             </ul>
	            </li>
	            <li>
	             <span id="quick_03_04">4. 제공하는 위치기반서비스의 내용</span>
	             <ul>
	              <li>회사가 제공하는 서비스는 아래와 같습니다</li>
	             </ul>
	             <ul>
	              <li>
	             <table class="vod_tb_ag mb20 mt10" summary="서비스 명칭 및 내용, 요금 테이블">
	              <caption class="hid">서비스 명칭 및 내용, 요금 테이블</caption>
	              <colgroup>
	               <col width="55%">
	               <col width="*">
	              </colgroup>
	              <thead>
	               <tr>
	                <th scope="col">서비스 명칭 및 내용</th>
	                <th class="brn" scope="col">요금</th>
	               </tr>
	              </thead>
	              <tbody>
	               <tr>
	                <td>
	                 * 주변 매장 찾기 <br>
	                 - 현재의 위치를 기반으로 하여 주변 매장의 위치 등의 정보를 제공하는 서비스
	                </td>
	                <td class="ltd brn" rowspan="2">
	                 - 서비스의 이용 : 무료<br>
	                 - 서비스의 이용을 위한 데이터 통신 비용 : 이동통신사 및 회원이 가입 요금제에 따름
	                </td>
	               </tr>
	               <tr>
	                <td class="ltd">
	                * 사이렌 오더<br>
	                - 매장의 위치를 인식하여, 인식 또는 지정된 매장으로 선결제된 구매 내역을 매장 정보와 함께 원격으로 전송하여 제공받는 서비스
	                </td>
	               </tr>
	              </tbody>
	             </table>
	           </li>
	           </ul>
	            </li>
	            <li>
	             <span id="quick_03_05">5. 정보보유 기간</span>
	             <ul>
	              <li>회사는 타사업자 또는 회원의 민원처리를 위해 위치정보 이용,제공사실 확인자료(위치정보를 제공받는 자, 취득경로, 이용, 제공일시 및 방법에 관한 자료)를 자동 기록,보존하며 해당 자료는 1년간 보관합니다.</li>
	             </ul>
	            </li>
	            <li>
	             <span id="quick_03_06">6. 정보의 제3자 제공</span>
	             <ul>
	              <li>가. 회사는 회원의 동의 없이 회원의 개인위치정보를 제3자에게 제공하지 아니하며, 제3자 제공 서비스를 제공하는 경우에는 제공 받는 자 및 제공목적을 사전에 회원에게 고지합니다.</li>
	              <li>나. 회사는 개인위치정보를 회원이 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신단말장치로 매회 회원에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다. 단, 아래 각 호의 1에 해당하는 경우에는 회원이 미리 특정하여 지정한 통신단말장치 또는 전자우편주소로 통보합니다.
	               <ol>
	                <li>1) 개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우</li>
	                <li>2) 회원이 개인위치정보를 수집한 당해 통신단말장치 외의 통신단말장치 또는 전자우편주소로 통보할 것을 미리 요청한 경우</li>
	               </ol>
	              </li>
	             </ul>
	            </li>
	            <li>
	             <span id="quick_03_07">7. 적용 제외</span>
	             <ul>
	              <li>14세 미만 자는 회원가입 대상이 아니므로, 회사는 회원 가입이 불가능한 14세 미만 자의 위치정보를 수집하지 않으며, 따라서 14세 미만의 이용자에 대해서는 위치기반서비스와 관련한 민원 발생 등에 대해서는 책임을 지지 않습니다.</li>
	             </ul>
	            </li>
	            <li>
	             <span id="quick_03_08">8. 개인위치정보 등의 이용제공의 제한</span>
	             <ul>
	              <li>회사는 회원의 동의가 있거나 아래 각 호의 1에 해당하는 경우를 제외하고는 개인위치정보 또는 위치정보 수집,이용, 제공사실 확인자료를 본 약관에 명시하거나 별도 고지한 범위를 넘어 이용하거나 제3자에게 제공하지 않습니다.</li>
	              <li>가. 위치기반서비스 제공에 따른 요금정산 위하여 위치정보 수집, 이용, 제공사실 확인자료가 필요한 경우</li>
	              <li>나. 통계작성, 학술연구 또는 시장조사를 위하여 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는 경우</li>
	             </ul>
	            </li>
	           </ol>
	           <p class="pri_tit" id="quick_04">제 4장 약관 및 손해배상</p>
	           <ol class="pri_con">
	            <li>
	             <span id="quick_04_01">1. 약관 외 준칙</span>
	             <ul>
	              <li>이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법 및 기타 관련법령의 규정에 의합니다.</li>
	              <li>1. 회사는 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따릅니다.</li>
	              <li>2. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래 소비자보호지침 및 관계법령 또는<br>전자상거래 상 관례에 따릅니다.</li>
	             </ul>
	            </li>
	            <li>
	             <span id="quick_04_02">2. 책임 제한 기타</span>
	             <ul>
	              <li>회사는 천재지변 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없거나 회사의 귀책사유가 없는 경우에는 책임을 지지 않습니다. 또한 회사는 서비스 이용과 관련하여 이용자의 고의 또는 과실로 인하여 발생한 손해에 관하여도 책임을 지지 않습니다. 만일 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 회사의 소재지를 관할하는 법원을 관할법원으로 합니다.</li>
	             </ul>
	            </li>
	            
	         
	            <li><span class="color_point">본 이용약관은 2015년 11월 19일부터 시행합니다.</span></li>
	      
	            
	           </ol>
	          </div>
			</div>
			
			
			<div class="agreeTi">개인정보 수집 및 이용동의 (필수)
			<span class="agree-check">
				<input type="checkbox" name="agree2" id="check2" class="agree check2"> 
				<label for="checkbox">동의</label>
			</span>
			</div>
			<div class="agreement">
				<ul class="pri_con mb40">
      <li>
       <span class="fontBold">1. 개인정보 항목·목적·보유기간</span>
       <table class="vod_tb_ag mb20 mt10">
         <caption class="hid">
           수집하는 개인정보에 대한 항목, 목적, 보유기간 안내 테이블
            </caption>
         <colgroup>
           <col width="">
           <col width="80%">
            </colgroup>
         <thead>
           <tr>
             <th scope="col">구분</th>
             <th scope="col">필수</th>
              </tr>
            </thead>
         <tbody>
           <tr>
             <th scope="row"><span class="fontBold">항목</span></th>
             <td class="taLeft">성명, 생년월일, 성별, 아이디,비밀번호, 휴대전화번호,E-Mail</td>
              </tr>
           <tr>
             <th scope="row"><span class="fontBold">목적</span></th>
             <td> - 회원가입(홈페이지. 마이 쿠키 리워드), 본인확인<br>
               - 서비스 제공<br>
               * 상품(제품), 서비스 결제, 환불, 배송 등<br>
               * 개인 맞춤형 서비스 제공<br>
               (마이 쿠키 리워드 별 적립 등)<br>
               - 회원관리(상담/문의, 민원처리 등), 부정이용 방지<br>
               - 서비스 관련 이벤트 및 행사정보 안내<br>
               (별도 마케팅정보 수신 동의 회원에 한함) </td>
              </tr>
           <tr>
             <th scope="row"><span class="fontBold">보유 및 <br>
               이용기간</span></th>
             <td class="pointFont"><span class="underLine">회원 탈퇴 후 30일간 보관</span> (반복 재가입 등의 방법을 이용한 서비스 부정이용 방지) <span class="underLine">또는 관계법령에 의한 별도 보존기간</span> (2. 관계법령에 의한 개인정보 보존기간참고)</td>
              </tr>
            </tbody>
        </table>
      </li>
      <li>
       <span class="fontBold">2. 관계법령에 의한 개인정보 보존기간</span>
       <ul>
        <li class="pointFont">- 서비스이용기록, 접속로그, 접속IP정보 (통신비밀보호법 : 3개월)</li>
        <li class="pointFont">- 표시/광고에 관한 기록 (전자상거래법 : 6개월)</li>
        <li class="pointFont">- 계약 또는 청약철회 등에 관한 기록 (전자상거래법 : 5년)</li>
        <li class="pointFont">- 대금결제 및 재화 등의 공급에 관한 기록 (전자상거래법 : 5년)</li>
        <li class="pointFont">- 소비자의 불만 또는 분쟁처리에 관한 기록 (전자상거래법 : 3년)</li>
       </ul>
      </li>
      
      <li class="mt20">
       <span class="fontBold">3. 서비스 이용과정 및 사업 처리과정에서 수집될 수 있는 개인정보의 범위 </span>
       <p class="pl20">서비스 이용기록, 접속 로그, 쿠키, 접속IP정보, 결제기록, 이용정지 기록, e-스티커 적립 기록, 통신사 멤버십 카드 번호, 단말기정보(OS종류, PUSH용 토큰, 디바이스 ID), DI</p>
       <p class="pl20">* 쿠키의 경우 구체적인 운영 내역과 설정 거부 방법 등은 본 홈페이지 이용약관 7조에 정하고 있습니다. </p>
      </li>
     </ul>
			</div>
				<div class="agreeTi">
				E-mail 및 SMS 광고성 정보 수신동의 (선택)
				<span class="agree-check">
				<input type="checkbox" name="agree3"  id="check3" class="agree check3"> 
				<label for="checkbox">동의</label>
				</span>
				</div>
				<div class="promotion">다양한 프로모션 소식 및 신규 매장 정보를 보내 드립니다.</div>
			
				<div class="test">
						<h5>회원가입 유의사항</h5>
						<ul>
							<li>반드시 회원님 명의로 된 휴대폰, 아이핀을 이용해주세요.</li>
							<li>
								타인의 개인정보를 도용하여 가입할 경우 향후 적발 시 서비스 이용제한 및 법적 제재를 받으실 수 있습니다.
							</li>
							<li>
								쿠키의 공식 홈페이지는 Internet Explorer 9.0 이상, Chrome, Firefox, Safari 브라우저에 최적화 되어있습니다.
							</li>
						</ul>
				</div>
				
		
			
	
	<button type="button" class="nextJoin">다음</button>
	</div>
	
	
	<script type="text/javascript">
	$('.nextJoin').click(function(){
		var count = 0;
		$("input:checkbox").each(function(){
			if($(this).prop('checked')){
				count= count+1;
			}
		});
			if(count == 3){
				location.href="./selectJoin";
			}else{
				alert("이용약관에 동의하셔야합니다.");
			}
		
	});
		


	</script>
	
</body>
</html>
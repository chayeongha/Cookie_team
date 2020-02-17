<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Review Write</title>
<c:import url="../template/boot.jsp" />
<link href="${pageContext.request.contextPath}/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/board/reviewWrite.css" rel="stylesheet">
</head>
<body>
<!-- 	<form name="frm" action="reviewWrite" method="post"> -->
		<div id="popWrap" style="width: 660px;">
			<div id="popHead">
				<div class="popHeadEnd">
					<h1>상품후기 작성</h1>
				</div>
			</div>
			<!-- 팝업내용 입력-->
			<div class="popBody_con">
				<div class="reviewWrap">
					<div class="write">
						<table summary="상품후기 작성">
							<caption>상품후기 작성</caption>
							<colgroup>
								<col style="width:120px;">
								<col style="width:480px;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">구매상품</th>
									<td>
										<div class="image">
											<img alt="${store.sName}" src="../upload/${store.storeFilesVO.fName}">
										</div>
										<div class="con_area">
											<c:forEach items="${order.cartVOs}" var="cart">
												<c:forEach items="${cart.menuVOs}" var="menu">
													<span id="prdName" class="tit">메뉴명 : ${menu.mmName}</span>
													<span id="prdName" class="tit">/ ${cart.mmCount}</span>
													<br>
													<c:forEach items="${menu.menuOptions}" var="opt" varStatus="a">
														<span class="option">옵션명 : ${opt.optName}</span>
															<c:forEach items="${menu.cartOptionVOs}" var="optc" varStatus="b">
																<c:if test="${opt.optNum eq optc.optNum}">
																	<span class="option">/ ${optc.optCount} &nbsp;&nbsp;</span>
																</c:if>
															</c:forEach>
													</c:forEach>
												</c:forEach>
												<p id="prdName" class="tit"></p>
												<p class="option"></p>
											</c:forEach>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">상품평가</th>
									<td>
										<div class="starWrap">
										<!-- 클릭했을 때 class에 good 추가 -->
											<button type="button" id="1" class="rev_star"><em>최악이에요</em></button>
											<button type="button" id="2" class="rev_star"><em>별로예요</em></button>
											<button type="button" id="3" class="rev_star"><em>보통이에요</em></button>
											<button type="button" id="4" class="rev_star"><em>좋아요</em></button>
											<button type="button" id="5" class="rev_star"><em>최고예요</em></button>
											<!-- 별 클릭했을 때 value 값 변경 -->
											<input type="hidden" name="star" id="star" value="0">
											<!-- 별 클릭했을 때 내용 변경 -->
											<!-- 최악이에요 별로예요 보통이에요 좋아요 최고예요 -->
											<em class="star_cont">별을 클릭하여 상품 만족도를 알려주세요.</em>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">상품후기</th>
									<td>
										<div class="form-group">
											<label for="contents"></label>
											<textarea name="contents" class="form-control" id="contents" rows="10" cols="80" placeholder="Enter Cotents"></textarea>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">첨부파일</th>
									<td>
										<input type="button" id="btn_add" class="btn_add" value="Add File">
										
										<div id="files">
											<div class="form-group tt">
												<label for="file"></label> <br>
												<div class="col-sm-11">
													<input type="file" class="form-control" id="file" name="files">
												</div>
												<div class="col-sm-1">
													<input type="button" class="del" value="X">
												</div>
<!-- 												<div class="imgs_wrap" style="width: 200px; margin-top: 50px;"></div> -->
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 작성시 주의사항 -->
					<div class="caution">
						<h2>작성시 주의사항</h2>
						<ul>
							<li><p style="color:#f43142; font-weight: bold;">Cookie Order 리뷰 작성 시 포인트 지급을 위해 고객님의 Cookie Order 닉네임을 활용합니다.</p></li>
							<li>등록된 내용은 이용후기에 자동으로 노출되며, Cookie Order 메인페이지, 검색페이지, 상품페이지, 메일 등에도 추가 노출될 수 있습니다.</li>
							<li>상대방에 대한 욕설, 비방, 명예훼손, 불성실한 내용, 반복문자, 특정 효능에 있어 오해의 소지가 있는 내용을 담고 있거나 저작권/초상권 등 타인의 권리를 침해하는 이미지 사용하면 삭제될 수 있습니다.<br>다만, 상품에 대한 불만, 판매자에게 불리한 내용이라는 이유만으로는 삭제하지 않습니다.</li>
							<li>게시글에 회원님의 이메일, 휴대폰 번호와 같은 개인 정보의 입력은 금지되어 있으며, 발생하는 모든 피해에 대해 Cookie Order는 책임지지 않습니다.</li>
							<li>게시글과 관련된 저작권 침해에 대한 책임은 본인에게 있습니다.</li>
							<li>해당 상품의 리뷰와 무관한 내용이나 동일 문자의 반복 등 부적합한 내용일 때는 통보 없이 삭제 및 지급된 포인트가 회수될 수 있습니다. 상품에 대해 느낀점을 작성해 주세요. (20자 이상 3,000자 미만)</li>
						</ul>
					</div>
					<!-- 버튼 -->
					<div class="btn_wrap">
						<input type="hidden" name="olNum" value="${order.olNum}">
						<input type="hidden" name="writer" value="${writer}">
						<button id="btnSave" class="popbtn popbtn1" title="확인"><span>확인</span></button>
						<button id="btnClose" class="popbtn popbtn2" title="닫기"><span>닫기</span></button>
					</div>
				</div>
			</div>
		</div>
<!-- 	</form> -->
	
<script type="text/javascript">
   var files = $('#files').html();
   //var files = ' <div class="form-group tt">     <label for="file"></label>      <br>       <div class="col-sm-11">          <input type="file" class="form-control" id="file" name="files">       </div>       <div class="col-sm-1">          <input type="button" class="del" value="X">       </div>     </div>';
   $('#files').empty(); //remove vs empty ; 나 포함 전체 지우기 vs 자식만 지우기
   var check = 0;
   var index = 0; //index 번호
   
   $('#files').on("click", ".del", function() {
      //event.preventDefault();
      //alert("del");
      //$("#files div:last").remove(); //선택된 게 지워지질 않아 ㅜㅠ
      //1. $(this).closest(".tt").remove(); //가장 가까운 거!!
      //2. $(this).parent().parent().remove();
      //3. $(this).parents(".form-group").remove();
      $(this).parentsUntil("#files").remove();
      check--;
   });   //add file은 버튼을 눌러야 추가되는데, 추가되기 전에 이벤트가 실행되므로 이벤트가 실행되지 않는다.
         
   $('#btn_add').click(function() {
      //alert(files);
      if(check<5){
         $('#files').append(files);
         check++;
      }else {
         alert("최대 5개까지 가능합니다.");
      }
   });

	//별점 주기
	$('.rev_star').click(function(){
		var lv = $(this).attr('id');
		$(this).parent().children('button').removeClass('good');
		$(this).addClass('good').prevAll('button').addClass('good');
		//별 클릭했을 때 value 값 변경
		$('#star').val(lv);
		//별 클릭했을 때 내용 변경
		$('.star_cont').text($(this).children().text());
	});
   
 	//등록 버튼
	$('#btnSave').click(function(){
	
		var writer = $('input[name="writer"]').val();
		var contents = $('#contents').val();
		var star = $('input[name="star"]').val();
		var olNum = $('input[name="olNum"]').val();

		
		if(writer == null || writer == ""){
			alert("로그인 후 이용하세요");
			self.close();
		}else {
			
			if(contents != ""){

				var formData = new FormData();
				formData.append("writer", writer);
				formData.append("contents", contents);
				formData.append("star", star);
				formData.append("olNum", olNum);

				if($('input[name="files"]').length > 0){
					var leg = $('input[name="files"]').length;
					for(var i=0;i<leg;i++){
						formData.append("files", $('input[name="files"]')[i].files[0]);
					}
				}
				
				$.ajax({
					type: "POST",
					url: "./reviewWrite",
					processData: false,
					contentType: false,
					data: formData,
					success: function(data){
						alert(data);
						if(data > 0){
							opener.location.reload();
							self.close();
						}else{
							alert("잠시 후에 다시 시도해주세요.");
						}
					},
					error: function(){
						alert("잠시 후에 다시 시도해주세요.");
					}
				});
			}else {
				alert("상품후기를 입력해주세요.");
			}
		}
	});
	
	//취소 버튼
	$('#btnClose').click(function(){
		window.close();
	});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
		<div class="faqMenu">
					<ul id="nav">
						<li><a href="./adminMemberList" class="active">전체회원</a></li>
						<li><a href="./adminMemberList?grade=1">개인회원</a></li>
						<li><a href="./adminMemberList?grade=8888">사업자회원</a></li>
					</ul>
					<!-- 찾기 -->
					<form id="frm" action="./adminMemberList">
		
					<div class="outsearch">
						<input type="hidden" value="1" id="curPage" name="curPage">
						
						<div class="form-group col-xs-2">
							<select name="kind" class="form-control searchop">
								<option id="ki" value="ki">아이디</option>
								<option id="kn" value="kn">닉네임</option>
							</select> 
							
							<span class="inputbox">
								<input type="text" class="form-control searchinp" placeholder="Search" name="search" value="${pager.search}">
								<input type="text" style="display: none;" name="grade" value="${pager.grade}">
								<button class="btn" type="submit">검색</button>
							</span>
						
						</div>
					
					</div>
			
			</form>
			
		</div>
		
		<div class="base_table typeList gBorder faqList">
				<table border="1" summary="">
					<!-- faq 게시판 -->
					<colgroup
						class="">
						<col style="width: 70px;" />
						<col style="width: 135px;" class="" />
						<col style="width: auto;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" class="" />
						<col style="width: 55px;" class="displaynone" />
						<col style="width: 80px;" class="displaynone" />
					</colgroup>
					<tbody class="center">
						<tr style="">
							<td colspan="5">
								<div class="subjectList">
									<ul class="navMenu2">
										<c:forEach items="${memberList}" var="member" varStatus="st">
											<li class="main ani3">
												<p class="grade">${member.grade}</p> <a>${member.memId}</a>
												<div class="subMenu" style="display: none;">
													<ul>
														<li>
															<div class="answerTxt">
																${member.nickname}
																</br>
																</br>
																</br>
																 <a href="./pmemberDelete?memNum=${member.memNum}">삭제</a>
																 
															</div>
														</li>
													</ul>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		<ul class="pagination paging">
			
				<li><span id="${pager.startNum-1}" style="cursor:pointer" class="list listimg">뒤로</span></li>
			<c:forEach begin="${pager.startNum}"  end="${pager.lastNum}" var="i">
				<li><span id="${i}" class="list listnum" style="cursor:pointer">${i}</span></li>
			</c:forEach>
			<c:if test="${pager.curBlock < pager.totalBlock}">
				<li><span id="${pager.lastNum+1}" style="cursor:pointer" class="list">다음</span></li>
			</c:if>
				<li><span id="${pager.lastNum}" style="cursor:pointer" class="list">다음</span></li>
		</ul>

	
	<script type="text/javascript">
		
	var kind ='${pager.kind}';
	
	//kind값이 아무것도 없을때 기본으로 ki
	if(kind==''){
		kind='ki';
		}
	
	$("#"+kind).prop("selected", true);

	//paging리스트
	$(".list").click(function(){

		$("#curPage").val($(this).attr("id"))
		$("#frm").submit();

	});	

	
	//체크했을때 모든것이 체크
	var check= false;
	$('#checkAll').click(function(){
		if(check==false){
			$('.bmemberCheck').prop("checked" ,"ture");
			check=true;		
		}else{
			$('.bmemberCheck').prop("checked" ,"");
			check=false;
		}
	});


	//하나라도 체크안되면 all체크에서 체크가해제됨.
 	$('.bmemberCheck').click(function() {
		var all=0;
		for(var m=0; m<${bmemberList.size()}; m++){
			if($('.bmember'+m).prop("checked")==true){
				all++;
			}
		}
		if(all==${bmemberList.size()}){
			$('#checkAll').prop("checked","true");
			check= true;
			
		}else{
			$('#checkAll').prop("checked","");
			check=false;
		}
	});

	//체크한것 삭제
	$('#memDel').click(function(){

		//ajax처리시 데이터를 배열로 넘겨줄때 설정하는것.
		jQuery.ajaxSettings.traditional = true;
		
		for(var m=0; m<${bmemberList.size()}; m++){

			 var num = new Array();
			 var index= 0;

			 for(var m=0; m<${bmemberList.size()}; m++){

					if($('.bmember'+m).prop("checked")==true){
						num[index] = $('.bmember'+m).val();
						index++;
					}
			 }
		}

		if(confirm("회원을 지우시겠습니까?")){
			$.ajax({
				type :"POST",
				url   : "pmemberDelete",
				data : {
						num : num
				},
				success : function(data){
							if(data ==1){
								location.reload();
							}else{
								alert("다시 시도하시오.")
							}
				}
			});
		}
	});

	$(".subjectList a").click(function(){
		$(".subMenu").slideUp();
        $(".subjectList .main").removeClass("activeA");
		if(!$(this).next().is(":visible"))
		{
			$(this).next().slideDown();
            $(this).parent().addClass("activeA");
		}
	})
	/* 마우스 오버  */
	$('.listnum').mouseenter(function() {
		$(this).addClass("mousehover")
	});
	/* 마우스 리브  */
	$('.listnum').mouseleave(function() {
		$(this).removeClass("mousehover")
	});


	
</script>



</body>
</html>
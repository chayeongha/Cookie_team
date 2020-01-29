<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp" />
</head>
<body>

<div id="listcontentWrap">

		<div id="listcontent">
		
				<div class="container title">
					<a href="${pageContext.request.contextPath}/member/memberIndex">멤버인덱스로..</a>
					<h1>${gname}회원관리</h1>
				</div>
				
				<div class="container MemberMenu">
					
					<!-- 회원별 선택  -->
					<ul id="nav">
						<li><a href="./adminMemberList?grade=1">개인회원</a></li>
						<li><a href="./adminMemberList?grade=8888">사업자회원</a></li>
					</ul>
					
					<!-- 검색 -->
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
				
				<!--리스트사이즈가 0일시 검색결과없음 -->
				<c:if test="${memberSize eq 0}"> 
					<div id="listcontent" class="container">
						<div class="titleArea">
							<h2>SEARCH</h2>
						</div>
						<div class="noData"> 
							<strong class="warning">검색결과가 없습니다.</strong>
							<strong>정확한 검색어 인지 확인하시고 다시 검색해 주세요.</strong>
							<ul>
								<li>검색어/ 제외검색어의 입력이 정확한지 확인해 보세요.</li>
								<li>두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</li>
							</ul>
						</div>
					</div>
				</c:if> 
				
				<!--리스트사이즈가 0이 아닐시 검색 -->
				<c:if test="${memberSize ne 0}"> 	
				
					<div class="container">
						<table border="2" style="width: 500px; height:200px;">
						
							<tbody class="center">
								<tr >
									<td colspan="5">
										<div class="subjectList">
											<ul class="navMenu2">
												<!--리스트불러오기  -->
												<c:forEach items="${memberList}" var="member" varStatus="st">
													<li class="mainMenu">
														아이디:<a>${member.memId}</a>
														<div class="subMenu" style="display: none;">
															<ul>
																<div class="info">
																	<p>이름: ${member.name }</p>
																	<p>닉네임: ${member.nickname}</p>
																	<p>연락처: ${member.phone }</p>
																	 <a class="btn btn-primary" href="./pmemberDelete?memNum=${member.memNum}">삭제</a>
																</div>
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
					
					<!--페이징처리 -->
					<div class="container">
						<ul class="pagination paging">	
								<li><span id="${pager.startNum-1}" style="cursor:pointer" class="list listimg">◁</span></li>
							<c:forEach begin="${pager.startNum}"  end="${pager.lastNum}" var="i">
								<li><span id="${i}" class="list listnum" style="cursor:pointer">${i}</span></li>
							</c:forEach>
							<c:if test="${pager.curBlock < pager.totalBlock}">
								<li><span id="${pager.lastNum+1}" style="cursor:pointer" class="list">▷</span></li>
							</c:if>
								<li><span id="${pager.lastNum}" style="cursor:pointer" class="list">▷</span></li>
						</ul>
			 		</div>
 			
 				</c:if>
		
		</div>
</div>
	
<script type="text/javascript">
	var kind = '${pager.kind}';

	//kind값이 아무것도 없을때 기본으로 ki
	if (kind == '') {
		kind = "kt";
	}
	
	$("#" + kind).prop("selected", true);

	//paging리스트
	$(".list").click(function() {
		$("#curPage").val($(this).attr("id"));
		$("#frm").submit();
	});

	//클릭시 슬라이드업 다운
	$(".subjectList a").click(function(){

		$(".subMenu").slideUp();
	       $(".subjectList .main").removeClass("activeA");

			if(!$(this).next().is(":visible")){
			$(this).next().slideDown();
	           $(this).parent().addClass("activeA");
			}
	

			
	});

</script>

</body>
</html>
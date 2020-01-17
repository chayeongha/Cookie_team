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
			
		<div class="list container">
		
			<h1>개인회원 리스트</h1>	
			<table class="table table-hover">
				<tr>
					<td> </td>
					<td>Num</td>
					<td>Id</td>
					<td>Profile</td>
					<td>Name</td>
					<td>Nickname</td>
					<td>Phone Number</td>
					<td>Grade</td>	
					<td>  </td>
				</tr>
				
				<c:forEach items="${list}" var="mem">
				<tr>
					<td></td>
					<td>${mem.memNum}</td>
					<td>${mem.memId}</td>
					<td>
					<img alt="이미지를 넣어주세요!" src="../upload/${mem.fname}" width="50px" height="50px">
					</td>
					<td>${mem.name}</td>
					<td>${mem.nickname}</td>
					<td>${mem.phone}</td>
					<td>${mem.grade}</td>
					<td></td>
				</tr>		
				</c:forEach>				
			
			</table>
		</div>
		
		<!--페이징 처리  -->
		<div class="container" style="margin: auto;">
			<ul class="pagination">
				<c:if test="${pager.curBlock gt 1}">
					<li><span class="list" id="${pager.startNum-1}">이전</span></li>
				</c:if>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li><span class="list" id="${i}">${i}</span></li>
				</c:forEach>
				<c:if test="${pager.curBlock ne pager.totalBlock}">
					<li><span class="list" id="${pager.lastNum+1}">다음</span></li>
				</c:if>
			</ul>
		</div>
	
		<div class="container">
		
		<!--검색창  -->
		<form action="memberList" id="frm">
			<input type="hidden" id="curPage" value="1" name="curPage" >
			
			<select name="kind">		
					<option id="ki" value="ki">폰</option>			
					<option id="kn" value="kn">닉네임</option>
			</select>
		
			<input type="text" name="search" value="${pager.search}">
			
			<button>검색</button>
		</form>
		
		</div>
		
		
<script type="text/javascript">
		
	var kind ='${pager.kind}';
	
	//kind값이 아무것도 없을때 기본으로 ki
	if(kind==''){
		kind='ki';
		}
	
	$("#"+kind).prop("selected", true);

	$(".list").click(function(){

		$("#curPage").val($(this).attr("id"))
		$("#frm").submit();

	});	

	
	
	

</script>
	
	
</body>
</html>
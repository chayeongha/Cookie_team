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
			
		<div class="container">
	
				<table class="table table-hover">
				
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll"></th>
							<th>Id</th>
							<th>Name</th>
							<th>Nickname</th>
							<th>Phone Number</th>
							<th>Grade</th>	
						</tr>
					</thead>	
						
					<tbody>
						<c:forEach items="${bmemberList}" var="bmember" varStatus="b">
						<tr>
							<td><input type="checkbox" class="bmemberCheck bmember${b.index }" value="${bmember.memNum}"></td>
							<td>${bmember.memId}</td>
							<td>${bmember.name}</td>
							<td>${bmember.nickname}</td>
							<td>${bmember.phone}</td>
							<td>${bmember.grade}</td>
						</tr>		
						</c:forEach>				
					</tbody>	
			</table>
		
		</div>
		
		<div class="container">
		<button class="btn btn-danger del" id="memDel">delete</button>
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
		<form action="bmemberList" id="frm">
			<input type="hidden" id="curPage" value="1" name="curPage" >
			
			<select name="kind">		
					<option id="ki" value="ki">아이디</option>			
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

</script>
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>



			
			
 <table class="listContainer">
    <thead>
      <tr style="color: black; font-family: CookieRun-Regular; ">
        <th>지점번호</th>
        <th>지점이름</th>
        <th>점장 아이디</th>
        <th>승인대기</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
			<c:forEach items="${list}" var="vo">
				<tr style="font-family: CookieRun-Regular;">
					<td>${vo.ssNum}</td>
					<td>${vo.sName}</td>
					<td>${vo.memId}</td>
					<td>${vo.cwait}</td>
					<c:if test="${vo.cwait eq 0}">
					<td><a href="./storeAdminUpdate?ssNum=${vo.ssNum}"><button class="btn_admmit">승인 허용</button></a></td>
					</c:if>
					<c:if test="${vo.cwait eq 1}">
					<td><button class="btn_admmit">폐점대기</button></td>
					</c:if>
					<c:if test="${vo.cwait eq 2}">
					<td><button class="btn_admmit">폐점</button></td>
					</c:if>
				
				</tr>
			</c:forEach>

		</tbody>
  </table>
  
 
 






</body>
</html>
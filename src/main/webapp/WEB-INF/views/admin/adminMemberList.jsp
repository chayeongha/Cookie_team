<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
   

				<!--리스트사이즈가 0이 아닐시 검색 -->
				<c:if test="${memberSize ne 0}"> 	
				
		
						<table border="2" class="memberListTable">
						
							<tbody class="center">
								
									
										<div class="subjectList">
											<ul class="navMenu2">
												<!--리스트불러오기  -->
												<c:forEach items="${memberList}" var="member" varStatus="st">
													<li class="mainMenu">
														아이디:<a>${member.memId}</a>
														<div class="subMenu" style="display: none;">
															<ul>
																<div class="info">
																	<p>회원번호: ${member.memNum}</p>
																	<p>이름: ${member.name}</p>
																	<p>닉네임: ${member.nickname}</p>
																	<p>연락처: ${member.phone}</p>
																	<p>이메일: ${member.email}</p>
																	<p>회원 등급: ${member.grade}</p>
																	 <a class="deleteBTN" href="./pmemberDelete?memNum=${member.memNum}">삭제</a>
																</div>
															</ul>
														</div>
													</li>
												</c:forEach>
											</ul>
										</div>
								
								
							</tbody>
						
						</table>
					<!--페이징처리 -->
					<div class="container">
						<ul class="pagination paging">	
								<li><span id="${pager.startNum-1}" style="cursor:pointer" class="list listimg">◁</span></li>
							<c:forEach begin="${pager.startNum}"  end="${pager.lastNum}" var="i">
								<li><span id="${i}" class="list listnum" style="cursor:pointer">${i}</span></li>
							</c:forEach>
							<li><span id="${pager.lastNum}" style="cursor:pointer" class="list listimg">▷</span></li>
							
						</ul>
			 		</div>

 				</c:if>
		

	



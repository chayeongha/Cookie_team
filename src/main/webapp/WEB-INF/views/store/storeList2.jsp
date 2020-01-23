<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="wrap">
		<div style="padding: 30px">
		<c:forEach items="${arr}" var= "i">
			<input type="button" value="${i}" class="bb">
		</c:forEach>
		</div>
		<input type="hidden" value="${v}" id="v">
	</div>
	
	
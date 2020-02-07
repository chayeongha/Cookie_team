<%@page import="com.cookie.basic.util.CaptCha"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	new CaptCha().getCaptCha(request, response);
%>
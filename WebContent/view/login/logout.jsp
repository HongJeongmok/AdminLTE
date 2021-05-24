<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="util.Cookies"%>

<%
	response.addCookie(Cookies.createCookie("AUTH", "", "/", 0));
	response.sendRedirect("login.jsp");
	session.invalidate();
%>


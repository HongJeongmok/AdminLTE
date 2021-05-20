<%@ page contentType="text/html; charset=utf-8" import="util.Cookies"%>

<%
	response.addCookie(Cookies.createCookie("AUTH", "", "/", 0));
	response.sendRedirect("login.jsp");
	session.invalidate();
%>


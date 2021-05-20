<%@ page contentType="text/html; charset=utf-8"  import="util.Cookies"%>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	if (email.equals("hanguk@naver.com") && password.equals("1234")) {
	response.addCookie(Cookies.createCookie("AUTH", email, "/", -1));
	session.setAttribute("email", email);
	request.getSession().setAttribute("email", email);
	response.sendRedirect("../main/index.jsp");
	} else {
%>
<script>
	alert("로그인에 실패 하였습니다.");
	history.back();
</script>
<%
	}
%>
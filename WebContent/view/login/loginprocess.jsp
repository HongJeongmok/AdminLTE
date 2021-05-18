<%@ page contentType="text/html; charset=utf-8"%>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	if (email.equals("hanguk@naver.com") && password.equals("1234")) {
	request.getSession().setAttribute("email", email);
	response.sendRedirect("../main/index.jsp?email="+email);
	} else {
%>
<script>
	alert("로그인에 실패 하였습니다.");
	history.back();
</script>
<%
	}
%>
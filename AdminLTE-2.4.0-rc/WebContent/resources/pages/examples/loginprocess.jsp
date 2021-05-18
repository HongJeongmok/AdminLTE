<%@ page contentType="text/html; charset=utf-8"%>
<%
	String userId = request.getParameter("email");
	String userPwd = request.getParameter("password");

	if (userId.equals("hanguk@naver.com") && userPwd.equals("1234")) {
	request.getSession().setAttribute("email", userId);
	response.sendRedirect("../../index.jsp");
	} else {
%>
<script>
	alert('로그인실패');
	history.back();
</script>
<%
	}
%>
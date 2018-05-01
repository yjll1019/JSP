<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인 인증 받은 회원들에게 제공되는 페이지</title>
</head>
<body>
<%
	if(session.getAttribute("loginUser")==null){
		response.sendRedirect("10_main.jsp");
	}
	else{
		
%>
	<%= session.getAttribute("loginUser") %> 님 안녕하세요! <br>
	<form method="post" action="10_logout.jsp">
		<input type="submit" value="로그아웃">
	</form>
<%
	}
%>

</body>
</html>
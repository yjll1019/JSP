<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>쿠키 삭제</title>
</head>
<body>
<%
	Cookie c = new Cookie("id", "");
	c.setMaxAge(0);
	response.addCookie(c);
%>
<h3>id 쿠키가 삭제되었습니다.</h3>
<a href="02_getCookies.jsp">
쿠키 삭제를 확인하려면 클릭하세요 .
</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>쿠키 생성</title>
</head>
<body>
<%
	Cookie c = new Cookie("id", "yejilee");
	c.setMaxAge(365*24*60*60);
	response.addCookie(c);
	response.addCookie(new Cookie("pwd","1234"));
	response.addCookie(new Cookie("age","23"));
%>
<h3>쿠키 설정</h3>
<%= c.getName() %>
</body>
</html>
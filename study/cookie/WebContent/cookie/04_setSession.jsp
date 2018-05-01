<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>세션에 값 설정하기</title>
</head>
<body>
<%
	session.setAttribute("id", "yejiLee");
	session.setAttribute("pwd", "1234");
	session.setAttribute("age", 23);
%>
<h3>세션 설정</h3>
</body>
</html>
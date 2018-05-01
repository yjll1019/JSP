<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>세션에 저장된 값 가져오기</title>
</head>
<body>
<%
	String id = (String) session.getAttribute("id");
	String pwd = (String) session.getAttribute("pwd");
	Integer age = (Integer) session.getAttribute("age");
%>
id : <%= id %><br>
pwd : <%= pwd %><br>
age : <%= age %>
</body>
</html>
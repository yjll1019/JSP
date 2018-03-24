<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>강의자료loop2,loop3</title>
</head>
<body>
<table border="1">
<tr>
	<% for(int i=1; i<=10; ++i){ %>
		<td>i</td>
	<%} %>
</tr>
<table border="1">
<tr>
	<% for(int i=1; i<=10; ++i){ %>
		<td><%= i %></td>
	<%} %>
</tr>
</table>
</body>
</html>
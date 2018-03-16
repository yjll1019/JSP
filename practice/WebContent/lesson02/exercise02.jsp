<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>연습문제 2</title>
</head>
<body>
<% int i = 4; %>
4*7 = <%= i * 7 %>
4*8 = <%= i * 8 %>
4*9 = <%= i * 9 %> <br>

<%
	for(i=1; i<=10; ++i){
		out.print("4 x"+ i);
		out.print("=");
		out.print(4 * i + " ");
	}
%> <br>

<table border = 1>
<tr>
<%
	for(i=1; i<=10; ++i){
		out.print("    ");
		out.print("<td>");
		out.print(i);
		out.print("</td>");
	}
%>
</tr>
</table>
<br>
<table border=1>
<tr>
<%
	for(i=1; i<=10; ++i){
		out.println("      <td>"+i+"</td>");
	}
%>
</tr>
</table>
</body>
</html>
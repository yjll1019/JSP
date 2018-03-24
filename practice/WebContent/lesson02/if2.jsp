<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<style>
    table { border-collapse: collapse; }
    td { padding: 5px; border: solid 1px gray; }
</style>

<body>
<table border="1">
<tr>
	<%

		for(int i=1; i<=10; ++i){
			if(i%2==0){
	%>
				<td style="background-color: #ffffcc"><%= i %></td>
	<%
			}
			else{
	%>
					<td style="background-color: #ccffcc"><%= i %></td>
	<%
			}
		}
	%>
</tr>
</table>
<br>
<table border="1">
<tr>
	<%

		for(int i=1; i<=10; ++i){
	%>
				<td style="background-color: <%=(i%2==0)? "#ffffcc" : "#ccffcc" %>"><%= i %></td>

	<%
			}
	%>
</tr>
</table>
<br>
<table border="1">
<tr>
	<%
 		String [] color = {"#ffffcc", "#ccffcc"};
		for(int i=1; i<=10; ++i){
	%>
				<td style="background-color: <%=(i%2==0)? color[0] : color[1] %>"><%= i %></td>

	<%
			}
	%>
</tr>
</table>
<br>
<table border="1">
<tr>
	<%

		for(int i=1; i<=10; ++i){
	%>
				<td style="background-color: <%=color[i%2] %>"><%= i %></td>

	<%
			}
	%>
</tr>
</table>
</body>
</html>
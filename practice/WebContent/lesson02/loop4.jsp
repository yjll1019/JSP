<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>
<table border="1">

	<% for(int i=0; i<=3; ++i){ %>
		<tr>
			<%for(int j=1; j<=4; ++j){ %>
				<td><%= i*4+j %>
			<%} %>
		</tr>
	<%} %>
</table>
<br>
<table border="1">
	<%
		for(int i=0; i<=3; ++i){
			out.println("<tr>");
			for(int j=1; j<=4; ++j){
				out.println("<td>");
				out.println(i*4+j);
				out.println("</td>");
			}
			out.println("</tr>");
		}
	%>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>
구현 1
<table border="1">
<tr>
<%
 	for(int i=1; i<=10; ++i){
 		out.println("  <td>"+i+"    </td>");
 	}
%>
</tr>
</table>
<br>
구현 2
<table border="1">
<tr>
<% for(int i=1; i<=10; ++i) {%>
<% out.println("   <td>"+i+"     </td>"); %>
<% } %>
</tr>
</table>
<br>
구현 3
<%
	for(int i=1; i<=10; ++i){
		out.println("i");
	}
%>
<br>
구현 4
<% for(int i=1; i<=10; ++i){%>
<% out.println("i"); %>
<% } %>
<br>
구현 5
<% for(int i=1; i<=10; ++i){ %>
<%= "i" %>
<% } %>
<br>
구현 6
<% for(int i=1; i<=10; ++i){ %>
 i
 <% } %>
 <br>
 구현 7 
 <% for(int i=1; i<=10; ++i){ %>
 <%= i %>
 <% } %>
 <br>
 구현 8
 <table border="1">
<tr>
	 <% for(int i=1; i<=10; ++i){ %>
	 	<td><%= i %></td>
 	 <%} %> 
</tr>
</table>
구현 9
 <table border="1">
<tr>
	 <% for(int i=1; i<=10; ++i){ %>
	 	<td>i</td>
 	 <%} %> 
</tr>
</table>
</body>
</html>
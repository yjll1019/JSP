<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>
<%
	Date now = new Date();
	Calendar calendar = GregorianCalendar.getInstance();
	calendar.setTime(now); 
	int second = calendar.get(Calendar.SECOND);
%>
	
	지금은 <%= second %>초 입니다.
	<br>
	<% if(second%2==0) return; %> <!-- second가 짝수이면 return하면서 아랫부분은 실행되지 않음! -->
	<%= second %>는 홀수 입니다. <!-- else 홀수일 때! -->
</body>
</html>
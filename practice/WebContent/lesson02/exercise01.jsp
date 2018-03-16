<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>연습문제 1</title>
</head>
<body>
<!-- 작성일자 : 2018년  3월 16일 -->
<%
	String s1 = "hello";
	String s2 = "world";
	
	out.println("스크립릿 코드"); //개행이 되지않음!
	out.println(s1);
	out.println(s2);
	out.println(s1 + s2);
	out.println("s1");
	out.println("s2");
	out.println("s1" + "s2");
	out.println("s1 + s2");
%>
                             
<%= s1 %>			<!-- 개행이 되지않음!-->
<%= s2 %>
<%= s1+s2 %>
<%= "s1" %>
<%= "s2" %>
<%= "s1"+"s2" %>
<%= "s1 + s2" %>
</body>
</html>
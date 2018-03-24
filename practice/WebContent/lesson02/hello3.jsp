<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<style>
    table { border-collapse: collapse; }
    td { padding: 5px; border: solid 1px gray; }
</style>
<body>
<!-- 스크립릿 태그와 표현식 태그를 이용해서 웹 페이지에 값 출력하기 >> 표현식 태그가 사용하기 간편하다! -->
<!--스크립릿 태그는 자바 코드를 이용하기 때문에 ; 필요  -->
<%
	String s1 = "hello world";
	String s2 = " JSP!!";
%>
<table>
	<tr>
		<td><% out.print(s1); %></td>
		<td><%= s1 %></td>
	</tr>
	<tr>
		<td><% out.print(s1.toUpperCase()); %></td>
		<td><%= s1.toUpperCase() %></td>
	</tr>
	<tr>
		<td><% out.print(Math.PI); %></td>
		<td><%= Math.PI %></td>
	</tr>
	<tr>
		<td><% out.print(s1 + s2); %></td>
		<td><%= s1+s2 %></td>
	</tr>
	
</table>
</body>
</html>
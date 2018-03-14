<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>날짜 출력하기</title>
</head>
<body>
<!-- jsp파일에서 java코드를 이용해서 날짜 출력하기 -->
<%
	Date today = new Date();

	SimpleDateFormat f1 = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
	String s1 = f1.format(today);
	System.out.println(s1);
	
	SimpleDateFormat f2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String s2 = f2.format(today);
	System.out.println(s2);
	
	SimpleDateFormat f3 = new SimpleDateFormat("yy-M-d H:m:s");
	String s3 = f3.format(today);
	System.out.println(s3); 
%>
<h1>날짜 출력</h1>
<div>
	<%= s1 %>
</div>
<div>
	<%= s2 %>
</div>
<div>
	<%= s3 %>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>��¥ ����ϱ�</title>
</head>
<body>
<!-- jsp���Ͽ��� java�ڵ带 �̿��ؼ� ��¥ ����ϱ� -->
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
<h1>��¥ ���</h1>
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
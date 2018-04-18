<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body bgcolor=pink>
<%
	String age = request.getParameter("age");
	String name = (String)request.getAttribute("name");
%>
forward 방식으로 이동된 페이지
나이 : <%=age %>
이름 : <%= name %>
</body>
</html>
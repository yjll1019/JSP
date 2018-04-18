<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.net.URLDecoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body bgcolor=pink>
<h3>사용자 로그인 성공</h3>
<%= URLDecoder.decode(request.getParameter("userName"),"utf-8")%>
(<%= request.getParameter("userID") %>)님 환영합니다.

</body>
</html>
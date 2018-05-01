<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>모든 쿠키 얻어오기</title>
</head>
<body>
<%
	Cookie[] c = request.getCookies();
	for(Cookie a : c){
		out.println(a.getName()+" : "+a.getValue()+"<br>");
	}
%>
</body>
</html>
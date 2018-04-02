<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>서블릿 테스트</title>
</head>
<body>
<form method="get" action="/practice/MethodServlet">
	<input type="submit" value="get 방식으로 호출하기!"> 
</form>
<form method="post" action="/practice/MethodServlet">
	<input type="submit" value="post 방식으로 호출하기!">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>EL과 JSTL</title>
</head>
<body>
\${5+2} : ${5+2} <br>
\${5/2} : ${5/2} <br>
\${5 div 2} : ${5 div 2} <br>
\${5 mod 2} : ${5 mod 2} <br>
\${5 > 2} : ${5 > 2} <br>
\${2 gt 10} : ${2 gt 10} <br><!-- gt : 초과 (>) -->
\${(5>2)?}5:2 : ${(5>2)?5:2} <br>
\${(5 > 2) || (2 < 10)} : ${(5 > 2) || (2 < 10)}<br>
<%
	String input = null;
%>
\${empty input } : ${empty input} <br>
</body>
</html>
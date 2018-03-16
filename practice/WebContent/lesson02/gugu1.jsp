<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>구현 실습 : 구구단 출력하기</title>
</head>
<body>
<table border="1">
<%
	for(int i=1; i<=9; ++i){
		out.println("          <tr>");
		for(int j=2; j<=9; ++j){
			out.println("<td>");
			out.println(j+" x "+i+" = "+ j*i);
			out.println("</td>");
		}	
		out.println("          </tr>");
	}

%>
</table>
<br>
<table border="1">
<%
	for(int i=2; i<=9; ++i){
		out.println("        <tr>");
		for(int j=1; j<=9; ++j){
			out.println("       <td>");
			out.println(i+" x "+j+" = "+i*j);
			out.println("       </td>");
		}
		out.println("        </tr>");
	}
%>
</table>
</body>
</html>
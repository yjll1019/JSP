<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<!-- ½ºÅ©¸³¸´ ÅÂ±× -->
<%
	for (int i=8; i <= 30; i+=2) {
	    out.println("<div style='font-size: " + i + "pt;'>");  
	    out.println("    ¾È³ç JSP! " + i + "pt");
	    out.println("</div>");
	}

%>
</body>
</html>
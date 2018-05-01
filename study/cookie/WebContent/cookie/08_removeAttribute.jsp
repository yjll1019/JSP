<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import ="java.util.Enumeration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>저장된 특정 객체 삭제하기</title>
</head>
<body>
<%
	session.setAttribute("sname1", "세션에 저장된 첫 번째 값.");
	session.setAttribute("sname2", "세션에 저장된 두 번째 값.");
	session.setAttribute("sname3", "세션에 저장된 세 번째 값.");
	
	out.print("<h3>세션 값 삭제 전</h3>");
	Enumeration names;
	names = session.getAttributeNames();
	while(names.hasMoreElements()){
		String name = names.nextElement().toString();
		String value = session.getAttribute(name).toString();
		out.println(name+" : "+value+"<br>");
	}
	
	session.removeAttribute("sname2");
	
	out.print("<h3>세션 값 삭제 후</h3>");
	names = session.getAttributeNames();
	while(names.hasMoreElements()){
		String name = names.nextElement().toString();
		String value = session.getAttribute(name).toString();
		out.println(name+" : "+value+"<br>");
	}
%>
</body>
</html>
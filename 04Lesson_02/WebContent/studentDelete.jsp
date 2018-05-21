<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, jdbc.*" %>
<%
	String s1 = request.getParameter("id");
	int id = Integer.parseInt(s1);
	
	String pg = request.getParameter("pg");
	String name = request.getParameter("name");
	if(name==null) name="";
	String nameEncoded = URLEncoder.encode(name,"utf-8");
	
	String od = request.getParameter("od");
	StudentDAO.delete(id);
	response.sendRedirect("studentList.jsp?pg="+pg+"&name="+nameEncoded+"&od="+od);
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
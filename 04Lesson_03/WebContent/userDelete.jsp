<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, jdbc.*, java.net.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	int pg = ParseUtils.parseInt(request.getParameter("pg"), 1);
	String ss = request.getParameter("ss");
	String st = request.getParameter("st");
	if(ss==null) ss="0";
	if(st==null) st="";
	String stEncoded = URLEncoder.encode(st, "utf-8");
	String od = request.getParameter("od");
	
	
	int id = Integer.parseInt(request.getParameter("id"));
	
	UserDAO.delete(id);
	
	response.sendRedirect("userList.jsp?pg="+pg+"&ss="+ss+"&st="+stEncoded+"&od="+od);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
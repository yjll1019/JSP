<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, jdbc.*, java.net.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	if(name==null) name="";
	String nameEncoded = URLEncoder.encode(name, "utf-8");
	
	int pg = ParseUtils.parseInt(request.getParameter("pg"), 1);
	
	int id = Integer.parseInt(request.getParameter("id"));
	
	UserDAO.delete(id);
	
	response.sendRedirect("userList.jsp?name="+nameEncoded+"&pg="+pg);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.net.URLEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userID = request.getParameter("userID");
	String userPwd = request.getParameter("userPwd");
	String loginCheck = request.getParameter("loginCheck");
	
	if(loginCheck.equals("user")){
%>
	<jsp:forward page="09_userMain.jsp">
	<jsp:param value='<%=URLEncoder.encode("전고객", "utf-8") %>' name="userName"/>
	</jsp:forward>
<% }else{ %>
	<jsp:forward page="09_ManagerMain.jsp">
	<jsp:param value='<%=URLEncoder.encode("성관리", "utf-8") %>' name="userName"/>
	</jsp:forward>
<%} %>	
</body>
</html>
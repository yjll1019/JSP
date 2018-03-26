<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
  input.form-control { width: 200px; }
  table.table { width: 500px; }
  thead tr { background-color: #eee; }  
</style>
</head>
<body>
<%
	String a=null;
	String b= null;
	if(request.getParameter("text1")!=null && request.getParameter("text2")!=null){
		a = request.getParameter("text1");
		b = request.getParameter("text2");
	}
	else{
		a = "hello";
		b = "world";
	}
%>
<% request.setCharacterEncoding("utf-8"); %>
<div class="container">
<form action="exam2.jsp">
<div class="form-group">
	<label>text1:</label>
	<input type="text" class="form-control" name="text1" value="<%= a%>">
</div>
<div class="form-group">
	<label>text2:</label>
	<input type="text" class="form-control" name="text2" value="<%= b%>">
</div>
<div class="form-group">
	<input type="submit" class="btn btn-primary" name="cmd" value="확인">
</div>
</form>
</div>
</body>
</html>
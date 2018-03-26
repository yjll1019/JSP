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
	int b = 0;
	if(request.getParameter("number1")!=null){
		String a = request.getParameter("number1");
		b =Integer.parseInt(a);
		b++;
	}

%>
<% request.setCharacterEncoding("utf-8"); %>
<div class="container">
<form action="exam4.jsp">
<div class="form-group">
	<label>number1:</label>
	<input type="number" class="form-control" name="number1" value="<%= b%>">
</div>
<div class="form-group">
	<input type="submit" class="btn btn-primary" name="cmd" value="확인">
</div>
</form>
</div>
</body>
</html>
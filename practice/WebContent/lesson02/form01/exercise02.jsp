<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  select.form-control { width: 70px; }
  table.table { width: 500px; }
  thead tr { background-color: #eee; }
</style>
</head>
<body>
<%
	String number = request.getParameter("number");
	int num = (number==null? 0 : Integer.parseInt(number));
	
	if("++".equals(request.getParameter("operator"))) num++;
	else if("--".equals(request.getParameter("operator"))) num--;
%>
<div class="container">
<form>
	<div class="form-group">
		<label>number:</label>
		<input type="text" class="form-control" name="number" value="<%= num%>">
	</div>
	
	<div class="form-group">
	<label>
		<input type="submit" class="form-control" name="operator" value="++">
		<input type="submit"  class="form-control" name="operator" value="--">
	</label>
	</div>
</form>
</div>
</body>
</html>
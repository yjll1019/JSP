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
<div class="container">
<form>
<div class="form-group">
<label>select1:</label>
<select name="number" class="form-control">
<option <%="one".equals(request.getParameter("number"))? "selected" : "" %>>one</option>
<option <%="two".equals(request.getParameter("number"))? "selected" : "" %>>two</option>
<option <%="three".equals(request.getParameter("number"))? "selected" : "" %>>three</option>
</select>
</div>
<br/>
	<div class="radio">
			<label><input type="radio" name="radio1" value="one"
				<%="one".equals(request.getParameter("number"))? "checked" : ""%> /> one</label>
		</div>
			<div class="radio">
			<label><input type="radio" name="radio1" value="two"
				<%="two".equals(request.getParameter("number"))? "checked" : ""%> /> two</label>
		</div>
			<div class="radio">
			<label><input type="radio" name="radio1" value="three"
				<%="three".equals(request.getParameter("number"))? "checked" : ""%> /> three</label>
		</div>
		
<div class="form-group">
<input type="text"  class="form-control" name="text" value="<%= (request.getParameter("number"))%>">
</div>

<div class="form-group">
<button type="submit" class="btn btn-primary" value="확인">확인</button>
</div>
</form>
</div>
</body>
</html>
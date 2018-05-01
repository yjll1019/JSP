<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="lecture1.*, java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> <style> 
 body { font-family: 굴림체; } thead th { background-color: #eee; } table.table { width: 700px; }
</style>
<%
	List<User> list = UserDAO.find();
%>
<body>
<div class="container">
	<table class="table table-bordered table-condensed">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>학과</th>
				<th>사용자유형</th>
		    </tr>		
		</thead>
		<tbody>
		<% for(User u : list){ %>
		<tr>
			<td><%= u.getUserId() %></td>
			<td><%= u.getName() %></td>
			<td><%= u.getEmail() %></td>
			<td><%= u.getDepartmentName() %></td>
			<td><%= u.getUserType() %></td>
		</tr>
		<% } %>
		</tbody>
	</table>
</div>
</body>
</html>
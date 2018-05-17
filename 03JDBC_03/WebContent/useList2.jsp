<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, jdbc.*" %> 
<%

	String department = request.getParameter("departmentId");
	int departmentId = (department==null)? 0 : Integer.parseInt(department);
	List<User> list = (departmentId==0)? UserDAO.findAll() : UserDAO.findByDepartmentId(departmentId);	
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
thead th {
	background-color: #eee;
}

table.table {
	width: 700px;
	margin-top: 10px;
}
</style>
<title>사용자 이름 조회</title>
</head>
<body>
<div class="container">
	<form class="form-inline">
	<div class="form-group">
	<h1>사용자 목록</h1>
		<label>학과</label>
		<select name="departmentId" class="form-control">
			<option value="0" <%=(departmentId==0)? "selected":"" %>>전체</option>
			<% for(Department d : DepartmentDAO.findAll()) {%>
			<option value="<%= d.getId() %>" <%= (departmentId==d.getId())? "selected":"" %>><%=d.getDepartmentName() %></option>
			<% } %>
		</select>
	<button type="submit" class="btn btn-primary">조회</button>
	</div>
	</form>
	
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
			<%for(User u : list){ %>
			<tr>
				<td><%= u.getUserid() %></td>
				<td><%= u.getName() %> </td>
				<td> <%=u.getEmail() %></td>
				<td><%= u.getDepartmentName() %></td>
				<td><%= u.getUserType() %></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</div>
</body>
</html>
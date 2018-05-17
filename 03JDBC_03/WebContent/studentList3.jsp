<!-- 학과로 조회 > Department DTO, DAO 추가  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, jdbc.*" %>
<%
	String select = request.getParameter("select");
	int departmentId = (select==null)? 0 : Integer.parseInt(select);
	
	List<Student> list = (departmentId==0)? StudentDAO2.findAll() : StudentDAO2.findByDepartmentId(departmentId);
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
<title>학과로 조회하기</title>
</head>
<body>
<div class="container">
<form class="form-inline">
	 <div class="form-group">
	<h1>학생목록</h1>
	<label>학과</label>
	 <select name="select" class="form-control">
			<option value="0" <%=(departmentId==0)? "selected" : "" %>>전체</option>
			<% for (Department d : DepartmentDAO.findAll()) {%>
			<option value="<%=d.getId()%>"
			<%=departmentId == d.getId() ? "selected" : ""%>><%=d.getDepartmentName()%></option>
			<% } %>
	</select>
			<button type="submit" class="btn btn-primary">조회</button>
	</div>
</form>
<table class="table table-bordered table-condensed">
	<thead>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>학년</th>
		</tr>
	</thead>
	<tbody>
		<% for(Student s : list){ %>
		<tr>
			<td><%= s.getStudentNumber() %></td>
			<td><%= s.getName() %></td>
			<td><%= s.getDepartmentName() %></td>
			<td><%= s.getYear() %></td>
		</tr>
		<% } %>
	</tbody>
</table>
</div>
</body>
</html>
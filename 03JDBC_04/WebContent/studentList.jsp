<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List, jdbc.*" %>
<%
	int currentPage = 1;	
	int pageSize = 15;
	List<Student> list = StudentDAO.findAll(currentPage, pageSize);
	int count = StudentDAO.count();
%>  
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	font-family: 굴림체;
}

thead th {
	background-color: #eee;
}

table.table {
	width: 700px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정해진 개수만큼 레코드 조회</title>
</head>
<body>
<div class="container">
<h1>학생목록</h1>
<table class="table table-bordered table-condensed">
	<thead>
		<tr>
			<th>id</th>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>학년</th>
		</tr>
	</thead>
	<tbody>
		<% for(Student s : list) {%>
		<tr>
			<td><%=s.getId() %></td>
			<td><%=s.getStudentNumber() %></td>
			<td><%= s.getName() %></td>
			<td><%= s.getDepartmentName() %></td>
			<td><%= s.getYear() %></td>
		</tr>
		<%} %>
	</tbody>
</table>
</div>
</body>
</html>
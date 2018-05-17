<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, jdbc.*"%>

<%
	String research = request.getParameter("name"); //null일 때 제거를 해줘야한다! >> 해주지않으면 이름이 null인 사람을 찾음.
	if (research == null)
		research = "";
	List<Student> list = StudentDAO.findByName(research);
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
<title>이름으로 학생목록 조회하기</title>
</head>


<body>
	<div class="container">
		<h1>학생 목록</h1>
		<form class="form-inline">
			<div class="form-group">
				<label>이름</label> <input type="text" class="form-control"
					name="name" value="<%=research%>" placeholder="검색조건" />
			</div>
			<button type="submit" class="btn btn-primary">조회</button>
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
				<%
					for (Student s : list) {
				%>
				<tr>
					<td><%=s.getStudentNumber()%></td>
					<td><%=s.getName()%></td>
					<td><%=s.getDepartmentName()%></td>
					<td><%=s.getYear()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List, jdbc.*" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%	
	int currentPage = 1;
	int pageSize = 10;
	
	String s = request.getParameter("pg");
	currentPage = (s==null)? 1 : Integer.parseInt(s);
	
	List<User> list = UserDAO.findAll(currentPage, pageSize);
	int recordCount = UserDAO.count();
	
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
body {
	font-family: 굴림체;
}

thead th {
	background-color: #eee;
}

table.table {
	width: 700px;
}
tr:hover td { background-color: #ffe; cursor: pointer; }
</style>
<title>사용자 목록 조회</title>
</head>
<body>
<div class="container">
	<h1>사용자 목록</h1>
	
	<table class="table table-bordered table-condensed">
		<thead>
			<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>학과</th>
			<th>사용자유형</th>
			<th>동의여부</th>
			</tr>
		</thead>
		<tbody>
			<% for(User u : list) {%>
					<tr data-url="userEdit.jsp?id=<%= u.getId() %>">
				<td><%= u.getUserid() %></td>
				<td><%=u.getName() %></td>
				<td><%= u.getEmail() %></td>
				<td><%= u.getDepartmentName() %></td>
				<td><%= u.getUserType() %></td>
				<td><%= u.isEnabled() %></td>
			</tr>
			<% } %>
		</tbody>
	</table>

<my:pagination pageSize="<%= pageSize %>" recordCount="<%= recordCount %>" queryStringName="pg" />
</div>
	<script>
		$("[data-url]").click(function() {
			var url = $(this).attr("data-url");
			location.href = url;
		})
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List, jdbc.*" %>
<%
	int currentPage = 1;	
	int pageSize = 10;
	
	String pg = request.getParameter("pg"); //페이지 번호를 넘겨준다.
	if(pg!=null) currentPage = Integer.parseInt(pg); //NULL이면 1페이지가 나오도록.
	
	List<Student> list = StudentDAO.findAll(currentPage, pageSize);
	int count = StudentDAO.count();
	int pageCount = (int)Math.ceil((double)count / pageSize); //89개면 9개의 페이지가 나와야하므로 내림으로 계산.
	//pageCount : 총 몇 페이지를 생성할 것인지.
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
</style><title>레코드 조회</title>
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

<% if(currentPage > 1){ %> <!-- 버튼 누르면 get방식으로 파라미터 넘기고 그에 해당하는 페이지 출력  --> 
	<a class="btn btn-default" href="studentList2.jsp?pg=<%= currentPage-1 %>"> &lt; </a>
<%} if(currentPage < pageCount){%>
	<a class="btn btn-default" href="studentList2.jsp?pg=<%= currentPage+1 %>"> &gt; </a>
<% } %><!-- 1이상이고 총 페이지 수보다 작을 때 버튼이 생성. -->
</div>
</body>
</html>
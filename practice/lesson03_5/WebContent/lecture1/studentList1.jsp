<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, lecture1.*" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%
	int currentPage = 1;
	int pageSize = 10;
	
	String pg = request.getParameter("pg");
	if(pg!=null) currentPage = Integer.parseInt(pg);
	
	List<Student> list = StudentDAO.findAll(currentPage, pageSize);
	int recordCount = StudentDAO.count();
%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
      body { font-family: 굴림체; }
      thead th { background-color: #eee; }
      table.table { width: 700px; }
      tr:hover td { background-color: #ffe; cursor: pointer; } //pointer 마우스 손가락 모양
  </style> 
</head> 
<body> 
<div class="container">
<h1>학생목록</h1>
<table class="table table-bordered table-condensed">
	<thead>
		<tr>
			<td>id</td>
			<td>학번</td>
			<td>이름</td>
			<td>학과</td>
			<td>학년</td>
		</tr>
	</thead>
	<tbody>
		<% for(Student s : list){ %>
		<tr data-url="studentEdit2.jsp?id=<%= s.getId()%>&pg=<%=(pg==null)? 1:pg %>">
		<td><%= s.getId() %></td>
		<td><%= s.getStudentNumber() %></td>
		<td><%= s.getName() %></td>
		<td><%= s.getDepartmentName() %></td>
		<td><%= s.getYear() %></td>
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

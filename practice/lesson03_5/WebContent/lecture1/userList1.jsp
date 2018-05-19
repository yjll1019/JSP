<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, lecture1.*" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%
	int currentPage = 1;
	int pageSize = 10;
	
	String pg = request.getParameter("pg");
	if(pg!=null) currentPage = Integer.parseInt(pg);
	
	String name = (request.getParameter("search")==null? "": request.getParameter("search"));
	
	List<User> list = UserDAO.findAllName(currentPage, pageSize, name);
	int recordCount = UserDAO.count();
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
      tr:hover td { background-color: #ffe; cursor: pointer; } 
  </style> 
</head> 
<body> 
<div class="container">
<h1>User 목록</h1>


<table class="table table-bordered table-condensed">
	<thead>
		<tr>
			<td>id</td>
			<td>아이디</td>
			<td>이름</td>
			<td>이메일</td>
			<td>학과</td>
			<td>사용자유형</td>
			<td>enabled</td>
		</tr>
	</thead>
	<tbody>
		<% for(User u : list){  %>
		<tr data-url="userEdit1.jsp?id=<%= u.getId()%>&pg=<%=(pg==null)? 1:pg %>&search=<%= name%>">
		<td><%= u.getId() %></td>
		<td><%= u.getUserId() %></td>
		<td><%= u.getName() %></td>
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

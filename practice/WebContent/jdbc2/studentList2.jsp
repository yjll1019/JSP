<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.util.List,  lecture1.jdbc2.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%	
	int pageSize = 10;
	int recordCount = StudentDAO.count(); 
	int count = (int)Math.ceil((double)recordCount / pageSize); 
	int currentPage = 1;
	
	if(request.getParameter("pg")==null){
		currentPage = 1;
	}
	else {
		currentPage = Integer.parseInt(request.getParameter("pg"));
	}

	List<Student> list = StudentDAO.findAll(currentPage, pageSize);
%>
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
  </style>
</head>
<body>
<div class="container">
<h1>학생목록</h1>
<form>
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
        <% for (Student student : list) { %>
            <tr>
                <td><%= student.getId() %></td>
                <td><%= student.getStudentNumber() %></td>
                <td><%= student.getName() %></td>
                <td><%= student.getDepartmentName() %></td>
                <td><%= student.getYear() %></td>
            </tr>
        <% } %>
    </tbody>
</table>
<%if(currentPage>1) {%>
<a class="btn btn-default" href="studentList2.jsp?pg=<%= currentPage-1 %>"> &lt; </a>
<%} if(currentPage<count){ %>
<a class="btn btn-default" href="studentList2.jsp?pg=<%= currentPage+1 %>"> &gt; </a>
<%} %>
</form>
</div>
</body>
</html>
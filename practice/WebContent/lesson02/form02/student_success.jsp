<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<%@ page import="form02.Student" %>
<%
	Student st = (Student)session.getAttribute("st");
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
      table.table { width: 400px; }
      td:nth-child(1) { background-color: #eee; width: 40%; }
  </style>
</head>
<body>

<div class="container">

<h1>회원가입 성공</h1>
<hr />
<form action="student_success.jsp" method="post">
<table class="table table-bordered">
  <tr>
    <td>ID</td>
    <td><%= st.getId() %></td>
  </tr>
  <tr>
    <td>학번</td>
    <td><%= st.getStudentNumber() %></td>
  </tr>
  <tr>
    <td>이름</td>
    <td><%= st.getName() %></td>
  </tr>
  <tr>
    <td>학과</td>
    <td><%= st.getDepartmentId() %></td>
  </tr>
  <tr>
    <td>학년</td>
    <td><%= st.getYear() %></td>
  </tr> 
</table>
  <button type="submit" class="btn btn-primary">
    <i class="glyphicon glyphicon-ok"></i> 저장
</form>
</div>
</body>
</html>

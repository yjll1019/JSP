<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jdbc.*, java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String 에러메시지 = null;
	String s1 = request.getParameter("id");
	int id = Integer.parseInt(s1);
	Student student = null;
	
	if(request.getMethod().equals("GET")){
		student = StudentDAO.findOne(id);
	}
	else{
		student = new Student();
		student.setId(id);
		student.setStudentNumber(request.getParameter("studentNumber"));
		student.setName(request.getParameter("studentName"));
		
		String s2 = request.getParameter("departmentId");
		if(s2!=null) student.setDepartmentId(Integer.parseInt(s2));
		String s3 = request.getParameter("year");
		if(s3!=null && s3.length()!=0) student.setYear(Integer.parseInt(s3));
		
		
		if(s1 == null || s1.length()==0){
			에러메시지 = "ID를 입력하세요.";
		}else if(student.getStudentNumber()==null||student.getStudentNumber().length()==0){
			에러메시지="학번을 입력하세요.";
		}else if(student.getName()==null|| student.getName().length()==0){
			에러메시지="이름을 입력하세요.";
		}else if(s2 == null || s2.length()==0){
			에러메시지="학과를 선택해주세요.";
		}else if(s3 == null || s3.length()==0 || Integer.parseInt(s3)==0){
			에러메시지="학년을 입력해주세요.";
		}else{
			student.setDepartmentId(Integer.parseInt(s2));
			student.setYear(Integer.parseInt(s3));
			StudentDAO.update(student);
			response.sendRedirect("studentList2.jsp");
			return;
		}
	}
%>
<!DOCTYPE html>
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

input.form-control, select.form-control {
	width: 200px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>학생등록</h1>
		<hr />

		<form method="post">
			<div class="form-group">
				<label>학번</label> <input type="text" class="form-control"
					name="studentNumber" value="<%=student.getStudentNumber() %>">
			</div>

			<div class="form-group">
				<label>이름</label> <input type="text" class="form-control"
					name="studentName" value="<%=student.getName() %>">
			</div>

			<div class="form-group">
				<label>학과</label> 
					<% for(Department d : DepartmentDAO.findAll()) {%>
					<% String checked = student.getDepartmentId()==d.getId()?"checked":"" ;%>
					<input type="radio" name="departmentId" value="<%=d.getId() %>" <%=checked %>><%= d.getDepartmentName() %>
					<%} %>
			</div>

			<div class="form-group">
				<label>학년</label> <input type="number" class="form-control"
					name="year" value="<%= student.getYear() %>">
			</div>

			<button type="submit" class="btn btn-primary">
				<i class="glyphicon glyphicon-ok"></i> 저장
			</button>
		</form>

		<hr />
		<% if (에러메시지 != null) { %>
		<div class="alert alert-danger">
			학생등록 실패:
			<%= 에러메시지 %>
		</div>
		<% } %>

	</div>
</body>
</html>

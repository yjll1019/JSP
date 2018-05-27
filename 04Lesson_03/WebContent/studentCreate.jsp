<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, jdbc.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String pg = request.getParameter("pg");
	String ss = request.getParameter("ss");
	String st = request.getParameter("st");
	if(ss==null) ss="0";
	if(st==null) st="";
	String stEncoded = URLEncoder.encode(st,"utf-8");
	
	String od = request.getParameter("od");
	String 에러메시지 = null;
	Student s = new Student();

	if(request.getMethod().equals("GET")){
		s.setStudentNumber("");
		s.setName("");
		s.setYear(1);
	}else{
		s = new Student();
		s.setStudentNumber(request.getParameter("studentNumber"));
		s.setName(request.getParameter("studentName"));
		
		String s1 = request.getParameter("departmentId");
		int departmentId = ParseUtils.parseInt(s1, 1);
		s.setDepartmentId(departmentId);
		
		String s2 = request.getParameter("year");
		int year = ParseUtils.parseInt(s2, 0);
		s.setYear(year);
		
		if(s.getStudentNumber()==null  || s.getStudentNumber().length()==0){
			에러메시지 = "학번을 입력해주세요.";
		}
		else if(s.getName()==null || s.getName().length()==0){
			에러메시지 = "이름을 입력해주세요.";
		}
		else if(s2==null||s.getYear()==0){
			에러메시지 = "학년을 입력해주세요.";
		}
		else{
			StudentDAO.insert(s);
			response.sendRedirect("studentList.jsp?pg=99999");
			//response.sendRedirect("studentList.jsp?pg="+pg+"&ss="+ss+"&st="+stEncoded+"&od="+od);
			return;
		}
	}
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
      input.form-control, select.form-control { width: 200px; }
  </style>
</head>
<body>

<div class="container">
	<h1>학생등록</h1>
	<hr/>
	
	<form method="post">
		<div class="form-group">
			<label>학번</label>
			<input type="text" class="form-control" name="studentNumber" value=<%= s.getStudentNumber() %>>
		</div>
		<div class="form-group">
			<label>이름</label>
			<input type="text" class="form-control" name="studentName" value=<%= s.getName() %>>
		</div>
		<div class="form-group">
			<label>학과</label>
			<select name="departmentId" class="form-control">
			<% for(Department d : DepartmentDAO.findAll()){ %>
			<% String selected = (s.getDepartmentId()==d.getId())?"selected":""; %>
			<option value="<%=d.getId()%>" <%=selected %>><%= d.getDepartmentName() %></option>
			<% } %>
			</select>
		</div>
		<div class="form-group">
			<label>학년</label>
			<input type="text" class="form-control" name="year" value=<%= s.getYear() %>>
		</div>
  <button type="submit" class="btn btn-primary">
    <i class="glyphicon glyphicon-ok"></i> 저장
  </button>
  <a href="studentList.jsp?pg=<%=pg%>&ss=<%=ss%>&st=<%=stEncoded%>&od=<%=od%>" class="btn btn-default">
    <i class="glyphicon glyphicon-list"></i> 목록으로
  </a>  


<hr />
<% if (에러메시지 != null) { %>
  <div class="alert alert-danger">
    학생등록 실패: <%= 에러메시지 %>
  </div>
<% } %>
		
	</form>
</div>

</body>
</html>
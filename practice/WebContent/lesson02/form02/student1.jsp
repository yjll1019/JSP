<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 문제점 : 학번이나 이름을 입력하는 칸에 string을 입력하면 바로 에러페이지가 난다.  -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<%@ page import="form02.Student" %>
<%
	int id=-1;
	String studentNumber="";
	String name="";
	int departmentId=-1;
	int year=-1;
	String 에러메시지 = null;

	request.setCharacterEncoding("UTF-8");

if (request.getMethod().equals("POST")) {
    String idd = request.getParameter("id");

	studentNumber = request.getParameter("studentNumber");
	
	name = request.getParameter("name");
	
	String departmentIdd = request.getParameter("departmentId");

	String yearr = request.getParameter("year");
	
	
	
    if (idd == null || idd.length() == 0) 
        에러메시지 = "사용자 아이디를 입력하세요";
    else if (studentNumber == null || studentNumber.length() == 0) 
        에러메시지 = "학번을 입력하세요";
    else if (name == null || name.length() == 0) 
        에러메시지 = "이름을 입력하세요";
    else if (departmentIdd == null || departmentIdd.length() == 0) 
        에러메시지 = "학과id를 입력하세요";
    else if (yearr==null || yearr.length()==0)
        에러메시지 = "학년을 입력해주세요.";
    else {
    	id = Integer.parseInt(idd);
    	departmentId = Integer.parseInt(departmentIdd);
    	year = Integer.parseInt(yearr);
    	Student st = new Student(id, studentNumber, name, departmentId, year);
        session.setAttribute("st", st);
        response.sendRedirect("student_success.jsp");
        return;
    }
}
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
      input.form-control, select.form-control { width: 200px; }
  </style>
</head>
<body>

<div class="container">

<h1>회원가입</h1>
<hr />

<form method="post">
  <div class="form-group">
    <label>사용자 아이디</label>
    <input type="text" class="form-control" name="id" value="<%= request.getParameter("id")==null?"":request.getParameter("id") %>" />
  </div>
  <div class="form-group">
    <label>학번</label>
    <input type="text" class="form-control" name="studentNumber" value="<%= studentNumber %>" />
  </div>
  <div class="form-group">
    <label>이름</label>
    <input type="text" class="form-control" name="name" value="<%=name %>"  />
  <!-- value에 name==null? "":name  이렇게 해버리면 아무것도 입력을 하지 않아도 넘어간다.--> 
  </div>
  <div class="form-group">
    <label>학과ID</label>
       <select class="form-control" name="departmentId">
         <option value="1" <%= departmentId == 1 ? "selected" : "" %>selected>소프트웨어공학과</option>
         <option value="2" <%=  departmentId == 2 ? "selected" : "" %>>컴퓨터공학과</option>
      <option value="3" <%=  departmentId == 3 ? "selected" : "" %>>정보통신공학과</option>
      <option value="4" <%=  departmentId == 4 ? "selected" : "" %>>글로컬IT공학과</option>
  </select>
  </div>
  <div class="form-group">
    <label>학년</label>
    <input type="text" class="form-control" name="year" value="<%=request.getParameter("year")==null?"":request.getParameter("year")%>" />
  </div>
  <button type="submit" class="btn btn-primary">
    <i class="glyphicon glyphicon-ok"></i> 회원가입
  </button>
</form>

<hr />

<% if (에러메시지 != null) { %>
  <div class="alert alert-danger">
    로그인 실패: <%= 에러메시지 %>
  </div>
<% } %>
</div>

</body>
</html>

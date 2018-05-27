<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="jdbc.*, java.net.*, java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String 에러메시지 = null;
	String s1 = request.getParameter("id");
	int id = ParseUtils.parseInt(s1, 0);
	
	String pg = request.getParameter("pg"); //저장 & 목록 & 삭제 버튼 눌렀을 때 검색 조건이 풀리지 않기 위해서 pg, ss, st, od 값 받음 
	String ss = request.getParameter("ss");
	String st = request.getParameter("st");
	if(ss == null) ss="0";
	if(st == null) st="";
	String stEncoded = URLEncoder.encode(st,"utf-8");
	
	String od = request.getParameter("od");
	
	Student s = null;
	
	if(request.getMethod().equals("GET")){
		s = StudentDAO.findOne(id);
	}else{//수정 버튼 눌렀을 때 
		s = new Student();
		s.setId(id);
		s.setStudentNumber(request.getParameter("studentNumber"));
		s.setName(request.getParameter("studentName"));
		String s2 = request.getParameter("departmentId");
		int departmentId = ParseUtils.parseInt(s2, 1);
		s.setDepartmentId(departmentId);
		String s3 = request.getParameter("year");
		int year = ParseUtils.parseInt(s3, 0);
		s.setYear(year);
		
		if(s1==null || s1.length()==0){
			에러메시지 ="아이디를 입력하세요.";
		}
		else if(s.getStudentNumber()==null||s.getStudentNumber().length()==0){
			에러메시지 = "학번을 입력해주세요.";
		}
		else if(s.getName()==null || s.getName().length()==0){
			에러메시지 = "이름을 입력해주세요.";
		}
		else if(s3==null || s3.length()==0){
			에러메시지="학년을 입력해주세요.";
		}
		else{
			StudentDAO.update(s);
			response.sendRedirect("studentList.jsp?pg="+pg+"&ss="+ss+"&st="+stEncoded+"&od="+od);
			return;
		}
	}
%>
<html>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
      body { font-family: 굴림체; }
      input.form-control, select.form-control { width: 200px; }
  </style>
<body>
	<div class="container">
		<h1>학생등록</h1>
		<hr/>
		<form method="post">
		<div class="form-group">
		<label>학번</label>
		<input type="text" class="form-control" name="studentNumber" value="<%=s.getStudentNumber() %>">
		</div>
		<div class="form-group">
		<label>이름</label>
		<input type="text" class="form-control" name="studentName" value="<%=s.getName() %>">
		</div>
		<div class="form-group">
		<label>학과</label>
		<select class="form-control" name="departmentId">
			<% for(Department d : DepartmentDAO.findAll()){ %>
			<% String selected = (s.getDepartmentId()==d.getId())? "selected":""; %>
				<option value=<%=d.getId()%> <%=selected %>><%= d.getDepartmentName()%></option>
			<%} %>
		</select>
		</div>
		<div class="form-group">
		<label>학년</label>
		<input type="text" class="form-control" name="year" value="<%=s.getYear() %>">
		</div>
		<button type="submit" class="btn btn-primary">
		<i class="glyphicon glyphicon-ok"></i> 저장
		</button>
			<a
				href="studentDelete.jsp?id=<%=id%>&pg=<%=pg%>&ss=<%=ss%>&st=<%=stEncoded%>&od=<%=od%>"
				class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?')"> <i
				class="glyphicon glyphicon-trash"></i> 삭제
			</a> <a
				href="studentList.jsp?pg=<%=pg%>&ss=<%=ss%>&st=<%=stEncoded%>&od=<%=od%>"
				class="btn btn-default"> <i class="glyphicon glyphicon-list"></i>
				목록으로
			</a>
		</form>
		
		<hr/>
		<% if(에러메시지!=null) {%>
		  <div class="alert alert-danger">
    	학생등록 실패: <%= 에러메시지 %>
  </div>
<% } %>
		
	</div>
</body>
</html>
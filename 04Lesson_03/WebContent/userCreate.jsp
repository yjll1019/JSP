<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jdbc.*, java.util.*, java.net.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String 에러메시지=null;
	
	String pg = request.getParameter("pg");
	String ss = request.getParameter("ss");
	String st = request.getParameter("st");
	if(ss==null) ss="0";
	if(st==null) st="";
	String stEncoded = URLEncoder.encode(st, "utf-8");
	
	String od = request.getParameter("od");
	User u = new User();
	
	if(request.getMethod().equals("GET")){
		u.setUserid("");
		u.setPassword("");
		u.setName("");
		u.setEmail("");
		u.setEnabled(true);
		u.setUserType("관리자");
	}else{
		u = new User();

		u.setUserid(request.getParameter("userid"));
		u.setPassword(request.getParameter("password"));
		u.setName(request.getParameter("insertname"));
		u.setEmail(request.getParameter("email"));
		
		String s2 = request.getParameter("departmentId");
		u.setDepartmentId(ParseUtils.parseInt(s2, 1));
		
		String s3 = request.getParameter("enabled");
		u.setEnabled((s3==null)? false:true);
		
		u.setUserType(request.getParameter("userType"));
		
		if(u.getUserid()==null||u.getUserid().length()==0){
			에러메시지="아이디를 입력하세요.";
		}else if(u.getEmail()==null||u.getEmail().length()==0){
			에러메시지="이메일을 입력하세요.";
		}else if(u.getUserType()==null || u.getUserType().length()==0){
			에러메시지="사용자 유형을 입력해주세요.";
		}else{
			UserDAO.insert(u);
			response.sendRedirect("userList.jsp?pg=99999");
			return ;
		}
		
	}
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

input.form-control, select.form-control {
	width: 200px;
}
</style>
</head>
<body>
<div class="container">
<h1>사용자 등록</h1>
<hr/>

<form method="post">
<div class="form-group">
	<label>사용자 아이디</label>
	<input type="text" name="userid" value="<%= u.getUserid() %>">
</div>
<div class="form-group">
	<label>비밀번호</label>
	<input type="text" name="password" value="<%= u.getPassword() %>">
</div>
<div class="form-group">
	<label>이름</label>
	<input type="text" name="insertname" value="<%= u.getName() %>">
</div>
<div class="form-group">
	<label>이메일</label>
	<input type="text" name="email" value="<%= u.getEmail() %>">
</div>
<div class="form-group">
	<label>학과</label>
	<select name="departmentId">
	<% for(Department d : DepartmentDAO.findAll()) {%>
	<% String selected = (u.getDepartmentId()==d.getId())? "selected":""; %>	
	<option  value="<%=d.getId() %>" <%= selected %>><%=d.getDepartmentName() %></option>
	<%} %>
	</select>
</div>
<div class="form-group">
	<label>enabled</label>
	<input type="checkbox" name="enabled" value="true" <%=(u.isEnabled()==true)?"checked":"" %>>동의?
</div>
<div class="form-group">
	<label>사용자 유형</label>
	<% String userType = u.getUserType(); %>
	<input type="radio" name="userType" value="관리자" <%= (userType.equals("관리자"))?"checked":"" %>>관리자
	<input type="radio" name="userType" value="교수"  <%= (userType.equals("교수"))?"checked":"" %>>교수
	<input type="radio" name="userType" value="학생"  <%= (userType.equals("학생"))?"checked":"" %>>학생
</div>


	<button type="submit" class="btn btn-primary">
		<i class="glyphicon glyphicon-ok"></i> 등록
	</button>

  
 <a href="userList.jsp?pg=<%= pg %>&ss=<%=ss %>&st=<%=stEncoded %>&od=<%=od%>" 
     class="btn btn-default">
    <i class="glyphicon glyphicon-list"></i> 목록으로
  </a>  
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
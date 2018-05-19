<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jdbc.*, java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String s = request.getParameter("id");
	String 에러메시지=null;
	
	int id = Integer.parseInt(s);
	User u = null;
	
	if(request.getMethod().equals("GET")){
		u = UserDAO.findOne(id);
	}else{
		u = new User();
		u.setId(id);
		u.setUserid(request.getParameter("userid"));
		u.setName(request.getParameter("name"));
		u.setEmail(request.getParameter("email"));
	
		String s2 = request.getParameter("departmentId");
		if(s2!=null && s2.length()!=0) u.setDepartmentId(Integer.parseInt(s2));
		String s3 = request.getParameter("enabled");
		u.setEnabled((s3.equals("true"))? true: false);
		
		u.setUserType(request.getParameter("userType"));
		
		if(s==null || s.length()==0){
			에러메시지="id를 입력하세요.";
		}else if(u.getUserid()==null||u.getUserid().length()==0){
			에러메시지="아이디를 입력하세요.";
		}else if(u.getEmail()==null||u.getEmail().length()==0){
			에러메시지="이메일을 입력하세요.";
		}else if(s2==null || s2.length()==0){
			에러메시지="학과를 선택해주세요.";
		}else if(u.getUserType()==null || u.getUserType().length()==0){
			에러메시지="사용자 유형을 입력해주세요.";
		}else{
			UserDAO.update(u);
			response.sendRedirect("userList.jsp");
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
	<label>이름</label>
	<input type="text" name="name" value="<%= u.getName() %>">
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
	<%String enabled=(u.isEnabled()==true)? "true":"false";%>
	<input type="radio" name="enabled" value="true" <%=(enabled.equals("true")?"checked":"") %>>동의
	<input type="radio" name="enabled" value="false" <%=(enabled.equals("false")?"checked":"") %>>비동의
	
</div>
<div class="form-group">
	<label>사용자 유형</label>
	<% String userType = u.getUserType(); %>
	<input type="radio" name="userType" value="관리자" <%= (userType.equals("관리자"))?"checked":"" %>>관리자
	<input type="radio" name="userType" value="교수"  <%= (userType.equals("교수"))?"checked":"" %>>교수
	<input type="radio" name="userType" value="학생"  <%= (userType.equals("학생"))?"checked":"" %>>학생
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, lecture1.jdbc1.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>학생 목록</title> 
</head>
<body>
<%	
	ArrayList<User> list;
	String s = request.getParameter("departmentId");
	int departmentId = s==null? 0 : Integer.parseInt(s);
	if(s==null){
		list = UserDAO.findAll();
	}
	else{
		list = UserDAO.findByDeptId(departmentId);
	}
%>
<form class="form-inline">
	<div class="form-group">
	<label>학과</label>
	<select name="departmentId" class="form-control">
	<option value=0 <%= departmentId==0? "selected":""%>>전체</option>
	<%for(Department d:DepartmentDAO.findAll()){ %>
	<option value=<%= d.getId()%> <%= departmentId==d.getId()? "selected": ""%> ><%= d.getDepartmentName() %></option>
	<%} %>
	</select>
	</div>
	<button type="submit" class="btn btn-primary">조회</button>
</form>
<div class = "container">
<h1>학생 목록</h1>
<table class="table table-bordered table-condensed">
    <thead>
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>이메일</th>
            <th>학과</th>
            <th>사용자유형</th>
        </tr>
    </thead>

<tbody>
	<% for(User u : list) { %>
		<tr>
			<td><%= u.getId() %></td>
			<td><%= u.getName() %></td>
			<td><%= u.getEmail() %></td>
			<td><%= u.getDepartmentName()%></td>
			<td><%= u.getUserType() %></td>
		</tr>
	<% } %>
    </tbody>
</table>
</div>


</body>
</html>
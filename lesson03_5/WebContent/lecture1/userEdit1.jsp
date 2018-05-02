<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="lecture1.*, java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");

String 에러메시지 = null;
String s1 = request.getParameter("id");
int id = Integer.parseInt(s1);
User user = null;

if (request.getMethod().equals("GET")) {
	user = UserDAO.findOne(id);
}
else {//userId name email department userType
	user = new User();
	user.setId(id);
	user.setUserId(request.getParameter("userId"));
	user.setName(request.getParameter("userName"));
    String s2 = request.getParameter("departmentId");
    user.setDepartmentId(Integer.parseInt(s2));
    user.setEmail(request.getParameter("email"));
    user.setUserType(request.getParameter("userType"));
    
    if (s1 == null || s1.length() == 0)  //아이디 검사 
        에러메시지 = "ID를 입력하세요";
    else if (user.getUserId() == null || user.getUserId().length() == 0) 
        에러메시지 = "아이디를 입력하세요";
    else if (user.getName() == null || user.getName().length() == 0) //이름 검사 
        에러메시지 = "이름을 입력하세요";
    else if (user.getEmail() == null || user.getEmail().length()== 0) //이메일
        에러메시지 = "이메일을 입력하세요";
    else if(user.getUserType() == null || user.getUserType().length()==0)
    	에러메시지  = "사용자유형을 입력해주세요";
    else {
    	UserDAO.update(user);
        response.sendRedirect("userList1.jsp?pg="+request.getParameter("pg"));
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

<h1>학생 등록</h1>
<hr />

<form method="post">
  <div class="form-group">
    <label>학번</label>
    <input type="text" class="form-control" name="userId" 
           value="<%= user.getUserId() %>" />
  </div>
  <div class="form-group">
    <label>이름</label>
    <input type="text" class="form-control" name="userName" value="<%= user.getName() %>" />
  </div>
  <div class="form-group">
    <label>학과</label>
    <select class="form-control" name="departmentId">
      <% for (Department d : DepartmentDAO.findAll()) { %>
          <% String selected = user.getDepartmentId()==d.getId() ? "selected" : ""; %>
          <option value="<%= d.getId() %>" <%= selected %>>
            <%= d.getDepartmentName() %>
          </option>
      <% } %>
    </select>
  </div>
  <div class="form-group">
    <label>이메일</label>
    <input type="text" class="form-control" name="email" value="<%= user.getEmail() %>" />
  </div>
    <div class="form-group">
    <label>사용자유형</label>
    <input type="text" class="form-control" name="userType" value="<%= user.getUserType() %>" />
  </div>
  <button type="submit" class="btn btn-primary">
    <i class="glyphicon glyphicon-ok"></i> 저장
  </button>
</form>

<hr />
<% if (에러메시지 != null) { %>
  <div class="alert alert-danger">
    학생등록 실패: <%= 에러메시지 %>
  </div>
<% } %>
</div>
</body>
</html>

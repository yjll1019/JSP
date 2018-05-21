<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List, jdbc.*, java.net.*" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%	

int currentPage = 1;
int pageSize = 10;

request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
if(name==null) name="";
String nameEncoded = URLEncoder.encode(name, "utf-8");

String pg = request.getParameter("pg");
if(pg!=null) currentPage = ParseUtils.parseInt(pg, 1);

 int recordCount = UserDAO.count(name);

 int lastPage = (recordCount+pageSize-1)/pageSize;

 if(currentPage>lastPage) currentPage = lastPage;
 
 String od = request.getParameter("od");
 if(od==null) od="0";
List<User> list = UserDAO.findByName(name, currentPage, pageSize, od);


	
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

thead th {
	background-color: #eee;
}

table.table {
	width: 700px;
}
tr:hover td { background-color: #ffe; cursor: pointer; }
</style>
<title>사용자 목록 조회</title>
</head>
<body>
<div class="container">
	<h1>사용자 목록</h1>
<a id="createButton" class="btn btn-primary pull-right" href="userCreate.jsp?pg=<%= currentPage %>&name=<%=nameEncoded%>&od=<%=od%>">
  <i class="glyphicon glyphicon-plus"></i> 학생 등록 
</a>	
	
<form class="form-inline">
	<div class="form-group">
		<label>정렬</label>
		<select name="od" class="form-control">
			<option value="0" <%= ("0".equals(od))? "selected":"" %>>등록순서</option>
			<option value="1" <%= ("1".equals(od))? "selected":"" %>>학과</option>
			<option value="2" <%= ("2".equals(od))? "selected":"" %>>이름</option>
		</select>
	</div>
	<div class="form-group">
	<label>이름</label>	
	<input type="text" class="form-control" name="name" value="<%=name %>"  placeholder="검색조건" />
	</div>
	  <button type="submit" class="btn btn-primary">조회</button>
</form>
	
	<table class="table table-bordered table-condensed">
		<thead>
			<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>학과</th>
			<th>사용자유형</th>
			<th>동의여부</th>
			</tr>
		</thead>
		<tbody>
			<% for(User u : list) {%>
					<tr data-url="userEdit.jsp?id=<%= u.getId() %>&pg=<%=currentPage%>&name=<%= nameEncoded%>&od=<%=od%>">
				<td><%= u.getUserid() %></td>
				<td><%=u.getName() %></td>
				<td><%= u.getEmail() %></td>
				<td><%= u.getDepartmentName() %></td>
				<td><%= u.getUserType() %></td>
				<td><%= u.isEnabled() %></td>
			</tr>
			<% } %>
		</tbody>
	</table>

<my:pagination pageSize="<%= pageSize %>" recordCount="<%= recordCount %>" queryStringName="pg" />
</div>
	<script>
		$("[data-url]").click(function() {
			var url = $(this).attr("data-url");
			location.href = url;
		})
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, java.net.*,  jdbc.*" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%
	int currentPage = 1;	
	int pageSize = 10;
	
	request.setCharacterEncoding("UTF-8");
	
	String pg = request.getParameter("pg"); //페이지 번호를 넘겨준다.
	if(pg!=null) currentPage = ParseUtils.parseInt(pg, 1); //바꿀 수 없는 값이면(null) 1(디폴트값)로 바꿔주는

	String name = request.getParameter("name");
	if(name==null) name="";
	String nameEncoded = URLEncoder.encode(name, "utf-8"); //직접 url을 작성하기위해서 수동 인코딩
	
	int recordCount = StudentDAO.count(name); //이름으로 조회한 결과의 총 레코드 수 
	
	int lastPage = (recordCount+pageSize-1)/pageSize;
	if (currentPage > lastPage) currentPage = lastPage;
	
	List<Student> list = StudentDAO.findByName(name,currentPage, pageSize); //이름으로 조회한 결과 리스트만 가져옴
	

%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
<title>레코드 조회</title>
</head>
<body>

<div class="container">
<h1>학생목록</h1>
        <!--  학생 등록 후 목록 페이지로 나올 때를 위해서 url에 정보 붙여줌.-->
<a id="createButton" class="btn btn-primary pull-right" href="studentCreate.jsp?pg=<%= currentPage %>&name=<%=nameEncoded%>">
  <i class="glyphicon glyphicon-plus"></i> 학생 등록 
</a>

<form class="form-inline">
	<div class="form-group">
	<label>이름</label>	
	<input type="text" class="form-control" name="name" value="<%=name %>"  placeholder="검색조건" />
	</div>
	  <button type="submit" class="btn btn-primary">조회</button>
</form>

<table class="table table-bordered table-condensed">
	<thead>
		<tr>
			<th>id</th>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>학년</th>
		</tr>
	</thead>
	<tbody> <!-- 검색한 이름, 현재 페이지 수가 학생 수정 후 목록으로 나올 때 처음으로 돌아가 있으면 안되기 때문에 url로 정보 전달. -->
		<% for(Student s : list) {%>
		<tr data-url="studentEdit.jsp?id=<%= s.getId() %>&pg=<%=currentPage%>&name=<%=nameEncoded%>">
			<td><%=s.getId() %></td>
			<td><%=s.getStudentNumber() %></td>
			<td><%= s.getName() %></td>
			<td><%= s.getDepartmentName() %></td>
			<td><%= s.getYear() %></td>
		</tr>
		<%} %>
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
	<!-- data-url태그를 클릭했을 때 data-url의 속성값을 변수 url에 저장한 후 url로 이동한다. -->
		</body>
		</html>
	
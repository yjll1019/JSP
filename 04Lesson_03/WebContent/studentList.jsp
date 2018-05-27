<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, jdbc.*" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%
	int currentPage = 1;
	int pageSize = 10;
	
	request.setCharacterEncoding("utf-8");
	String pg = request.getParameter("pg");
	if(pg!=null) currentPage = ParseUtils.parseInt(pg, 1);
	//pg가 null이면 currentPage=1, pg값을 전달받아서 currentPage값 바꾸기
			
	String ss = request.getParameter("ss"); //조회 조건(where ss)
	String st = request.getParameter("st");//검색 조건(name like st)
	if(ss==null) ss="0"; //모든 조회
	if(st==null) st=""; //모든 조회
	String stEncoded = URLEncoder.encode(st,"utf-8");
	
	int recordCount = StudentDAO.count(ss,st);
	//조건에 맞는 레코드가 몇개인지
	
	int lastPage = Math.max(1, (recordCount+pageSize-1)/pageSize);
	//레코드 수가 10개 미만이면 마지막 페이지는 1
	if(currentPage > lastPage) currentPage = lastPage;
	//jsp에서 주소 9999일 때 마지막 페이지 보여주기 위한.
	
	String od = request.getParameter("od"); //정렬 조건 
	if(od==null) od="0";//id조회
	List<Student> list = StudentDAO.findAll(currentPage, pageSize, ss, st, od);
	
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
      thead th { background-color: #eee; }
      tr:hover td { background-color: #ffe; cursor: pointer; }
      table.table { margin-top: 5px; }
      select[name=od] { margin-right: 20px; }
  </style>
</head>
<body>

	<div class="container">
		<h1>학생목록</h1>
		<a id="createButton" class="btn btn-primary pull-right"
		 href="studentCreate.jsp?pg=<%=currentPage%>&ss=<%=ss%>&&st=<%=stEncoded%>&od=<%=od%>">
		 <i class="glyphicon glyphicon-plus"></i> 학생 등록
		</a>
		
		
		<form class="form-inline">
			<div class="form-group">
				<label>정렬</label>
				<select name="od" class="form-control">
					<option value="0" <%="0".equals(od)?"selected":"" %>>등록순서</option>
					<option value="1" <%="1".equals(od)?"selected":"" %>>학과</option>
					<option value="2" <%="2".equals(od)?"selected":"" %>>학년</option>
				</select>
				<select name="ss" class="form-control">
					<option value="0" <%="0".equals(ss)?"selected":"" %>>전체</option>
					<option value="1" <%="1".equals(ss)?"selected":"" %>>이름</option>
					<option value="2" <%="2".equals(ss)?"selected":"" %>>학과명</option>
				</select>
				<input type="text" class="form-control" name="st" value="<%= st %>"/>
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
			<tbody>
				<% for(Student s : list){ %>
				<tr data-url="studentEdit.jsp?id=<%=s.getId()%>&pg=<%=currentPage%>&ss=<%=ss%>&st=<%=stEncoded%>&od=<%=od%>">
				<td><%= s.getId() %></td>
				<td><%= s.getStudentNumber() %></td>
				<td><%= s.getName() %></td>
				<td><%= s.getDepartmentName() %></td>
				<td><%= s.getYear() %></td>
				<% } %>
			</tbody>
		</table>
	<!-- pg : 현재 url 에 pg값이 추가만 되는 것  -->
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
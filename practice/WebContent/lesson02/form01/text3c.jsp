<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
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
input.form-control {
	width: 200px;
}

table.table {
	width: 500px;
}

thead tr {
	background-color: #eee;
}
</style>
</head>
<body>
<%
//text3b.jsp와 차이점 : 1. null값일 때 브라우저에 null을 출력하지 않고 빈 문자열을 출력한다.
//					2. 출력할 값들을 미리 Java 지역 변수에 저장한다. (text3b.jsp에서는 파라미터로 받은 출력 할 값들을 바로 value에 써줬음.) 
	request.setCharacterEncoding("utf-8");
	String text1 = request.getParameter("text1");
	String text2 = request.getParameter("text2");
	String time = request.getParameter("time");
	
	if(text1==null) text1="";
	if(text2==null) text2="";
	if(time==null) time="";
	String currentTime = new SimpleDateFormat("HH:mm:ss").format(new Date());
	//Date객체를 원하는 날짜로 출력하기 위해서 SimpleDateFormat 객체를 사용
	//SimpleDateFormat s = new SimpleDateFormat("HH:mm:ss");
	//String ss = s.format(new Date()); 줄인것 !	
%>
	<div class="container">
		<form>
			<h3>텍스트 입력폼 03</h3>
			<div class="form-group">
				<label>text1:</label> <input type="text" class="form-control"
					name="text1" value="<%=text1%>">
			</div>
			<div class="form-group">
				<label>text1:</label> <input type="text" class="form-control"
					name="text2" value="<%=text2%>">
			</div>
			<div class="form-group">
				<label>time</label> <input type="text" class="form-control"
					name="time" value="<%=currentTime%>">
			</div>
			<div class="form=group">
				<input type="submit" class="btn btn-primary" name="cmd" value="확인">
			</div>
		</form>
	</div>
	<br>
	<table class="table table-bordered">
		<thead>
		<tr>
			<th>Parameter Name</th>
			<th>Parameter Value</th>
		</tr>
		</thead>
		<tbody>
			<tr>
				<td>text1</td>
				<td><%=text1%></td>
			</tr>
			<tr>
				<td>text2</td>
				<td><%=text2%></td>
			</tr>
			<tr>
				<td>time</td>
				<td><%=time%></td>
			</tr>
		</tbody>
	</table>
</body>
</html>
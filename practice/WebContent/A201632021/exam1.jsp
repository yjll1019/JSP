<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<style>
    table { border-collapse: collapse; }
    td { padding: 5px; border: solid 1px gray; }
</style>

<body>
<table border="1">

	<%
		for(int i=2; i<=5; ++i){
	%>
	
	<td style="background-color: <%=(i%2==1)? "#ffffcc" : "#ccffcc" %>">
	
	<%
			for(int j=1; j<=9; ++j){
				out.println(i+"x"+j+"="+i*j+"<br>"); 
			}
	%>
	
	</td>
	
	<%
		}
	%>
</tr>

<tr>
		<%
		for(int i=6; i<=9; ++i){
		%>
		
		<td style="background-color: <%=(i%2==0)? "#ffffcc" : "#ccffcc" %>">
		
		<%
		
			for(int j=1; j<=9; ++j){
				out.println(i+"x"+j+"="+i*j+"<br>"); 
			}
		%>
		
		<%
		}
	%>
</tr>
</table>


</body>
</html>
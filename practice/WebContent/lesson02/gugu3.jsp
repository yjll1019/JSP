<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<%

	for(int i=0; i<2; i++){		
	out.print("         <tr>");	
			for(int j=1; j<5; ++j){
				out.print("         <td>");
				for(int z=1; z<10; ++z){
					out.print((4*i+j+1)+" x "+z+" = "+((4*i+j+1)*z));
					out.print("<br>");
				}
				out.print("         </td>");
			}
	out.print("         </tr>");
			
	}
%>
</table>
<br><br>


<table border="1">
<tr>
	<%
		for(int i=2; i<=5; ++i){
		out.println("          <td>");
			for(int j=1; j<=9; ++j){
				out.println(i+"x"+j+"="+i*j+"<br>"); 
			}
		out.println("          </td>");
		}
	%>
</tr>
<tr>
	<%
		for(int i=6; i<=9; ++i){
		out.println("          <td>");
			for(int j=1; j<=9; ++j){
				out.println(i+"x"+j+"="+i*j+"<br>"); 
			}
		out.println("          </td>");
		}
	%>
</tr>
</table>


<br><br>
<table border="1">
<tr>
	<%
		out.println("          <tr>");
		for(int i=2; i<=9; ++i){
			if(i==6) {
				out.println("          </tr>");
				out.println("          <tr>");
			}
		out.println("          <td>");
			for(int j=1; j<=9; ++j){
				out.println(i+"x"+j+"="+i*j+"<br>");
			}
		out.println("          </td>");
			if(i==9) out.println("          </tr>");
		}
	%>
</tr>
</table>
</body>
</html>
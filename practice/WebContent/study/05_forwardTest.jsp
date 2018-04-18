<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	int age = Integer.parseInt(request.getParameter("age"));
	if(age <= 19){
%>
 	<script type="text/javascript">
 		alert("19세 미만이므로 입장 불가능");
 		history.go(-1);
 	</script>
<%
}else{
	request.setAttribute("name","이예지");
	RequestDispatcher dispatcher = request.getRequestDispatcher("05_forwardResult.jsp");
	dispatcher.forward(request, response);
}
%>
</body>
</html>
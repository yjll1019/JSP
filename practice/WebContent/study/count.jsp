<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%! int global_cnt = 0; %> <%--선언부에 선언한 변수이기 때문에 새로고침 시 이미 생성된 변수가 증가! --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int local_cnt = 0; //스크립릿 태그에 선언된 변수이기 때문에 새로고침을 할 때 마다 
	//서블릿 클래스의 jspService()메소드 내에서 매번 선언&초기화 된 후 1증가한다.

	out.print("<br> local_cnt : ");
	out.print(++local_cnt);
	
	out.print("<br> global_cnt : ");
	out.print(++global_cnt);
%>
</body>
</html>
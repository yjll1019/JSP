<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
request객체가 내장 객체이기 때문에 객체 생성없이 객체의 메소드 사용이 가능하다. <br>
컨텍스트 패스 : <%= request.getContextPath() %> <br>
요청 방식 : <%=request.getMethod() %><br>
요청한 URL : <%= request.getRequestURL() %> <br>
요청한 URI : <%= request.getRequestURI() %> <br>
서버의 이름 : <%= request.getServerName() %> <br>
프로토콜 : <%= request.getProtocol() %> 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
하나의 페이지 속성 : <%= pageContext.getAttribute("name")%> <br>
하나의 요청 속성 : <%= request.getAttribute("name")%><br>
하나의 세션 속성 : <%= session.getAttribute("name")%><br>
하나의 애플리케이션 속성 : <%= application.getAttribute("name")%><br>
</body>
</html>
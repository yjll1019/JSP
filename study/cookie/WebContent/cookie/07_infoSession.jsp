<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import ="java.util.Enumeration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>세션 객체의 메소드 사용하기</title>
</head>
<body>
<h3>세션 정보를 얻어오는 메소드 사용하기</h3>
<%
	String id_str = session.getId();
	long lastTime = session.getLastAccessedTime();
	long createdTime = session.getCreationTime();
	long time_used = (lastTime-createdTime) / 60000;
	int inactive = session.getMaxInactiveInterval()/60;
	boolean b_new = session.isNew();
%>
1] 세션 ID는 <%= id_str %> 입니다. <br><hr>
2] 당신이 웹 사이트에 머문 시간은 <%= time_used %> 입니다. <br><hr>
3] 세션의 유효 시간은 <%= inactive %> 입니다. <br><hr>
4] 세션이 새로 만들어졌나요? <br>
<%
	if(b_new){
		out.println("예");
	}
	else{
		out.println("아니오.");
	}
%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import ="java.util.Enumeration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>설정된 모든 세션 제거하기</title>
</head>
<body>
<%	
	session.setAttribute("sname1", "세션에 저장된 첫 번째 값.");
	session.setAttribute("sname2", "세션에 저장된 두 번째 값.");
	session.setAttribute("sname3", "세션에 저장된 세 번째 값.");
	
	out.print("<h3>세션 값 삭제 전</h3>");
	Enumeration names;
	names = session.getAttributeNames();
	
	while(names.hasMoreElements()){
		String name = names.nextElement().toString();
		String value = session.getAttribute(name).toString();
		out.println(name+" : "+value+"<br>");
	}
	
	session.invalidate();
	
	out.print("<h3>세션 값 삭제 후</h3><br>");
	out.print("세션의 값이 유효할까요<br> ");
	if(request.isRequestedSessionIdValid()==true){
		out.print("유효합니다.<hr>");
	}
	else{
		out.print("유효하지않습니다.<hr>");
	}
%>
</body>
</html>
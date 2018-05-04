<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>EL과 JSTL</title>
</head>
<body>
<c:set var="msg" value="Hello"></c:set>
\${msg} = ${msg} <br>
<c:set var="age">
30
</c:set>
\${age }=${age }<hr>

<c:set var="member" value="<%= new com.yeji.javabeans.MemberBeans() %>"></c:set>
<c:set target="${member}" property="name" value="이예지"></c:set>
<c:set target="${member}" property="userid" >
yejilee
</c:set>
\${member} = ${member }<hr>

<c:set var="add" value="${10+5 }"></c:set>
\${add } = ${add } <br>
<c:set var="flag" value="${10 >5 }"></c:set>
\${flag } = ${flag }<br>
</body>
</html>
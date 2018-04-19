<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="lecture1.jdbc1.*, java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String button = request.getParameter("button");
	String ch = request.getParameter("check");
	String radio="";
	String check="";
	ArrayList<User> list=new ArrayList<User>();

	if(button!=null){
	if(button.equals("r")){
		radio = request.getParameter("radio");	
		list = UserDAO.findEnabled(radio);
	}
	else if(button.equals("c")){
		 check = request.getParameter("check");
		 list = UserDAO.findUserType(check);
	}
	}
	if(button==null){
%>
<form>
<label>enabled</label>
<br>
<input type="radio" name=radio value="1">동의
<input type="radio" name=radio value="0">비동의
<br>
<button type="submit" name=button value="r">radio진행</button>
</form>
<form>
<label>userType</label>
<br>
<input type="checkbox" name=check value="관리자">관리자
<input type="checkbox" name=check value="교수">교수
<input type="checkbox" name=check value="학생">학생
<br>
<button type="submit" name=button value="c">check진행</button>
</form>
<%} else{
%>
<table>
    <thead>
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>이메일</th>
            <th>학과</th>
            <th>사용자유형</th>
        </tr>
    </thead>
    <tbody>
   <% for(User user:list){ %>
    	<tr>
    		<td><%=user.getUserid() %></td>
    		<td><%=user.getName() %></td>
    		<td><%=user.getEmail() %></td>
    		<td><%=user.getDepartmentName() %></td>
		<td><%=user.isEnabled()==true? "1" :"0" %></td>
    	</tr>
   <%} }%>
    </tbody>
</table>
</body>
</html>
<!-- 버튼을 클릭해서 넘기면 0을 하면 enabled가 0인거 다 출력  
	관리자를 선택하면 checkbox가 관리자인거 다 출력-->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%! int global_cnt = 0; %> <%--����ο� ������ �����̱� ������ ���ΰ�ħ �� �̹� ������ ������ ����! --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int local_cnt = 0; //��ũ���� �±׿� ����� �����̱� ������ ���ΰ�ħ�� �� �� ���� 
	//���� Ŭ������ jspService()�޼ҵ� ������ �Ź� ����&�ʱ�ȭ �� �� 1�����Ѵ�.

	out.print("<br> local_cnt : ");
	out.print(++local_cnt);
	
	out.print("<br> global_cnt : ");
	out.print(++global_cnt);
%>
</body>
</html>
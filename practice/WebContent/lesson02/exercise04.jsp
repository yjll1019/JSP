<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>
1.
<%  for (int i=1; i <= 10; ++i) { %>
     4 * i = 4 * i
<%  } %>
<br>
2.
<%  for (int i=1; i <= 10; ++i) { %>
     <%= 4 * i %> = <%= 4 * i %>
<%  } %>
<br>
3.
<%  for (int i=1; i <= 10; ++i) { %>
     <%= 4 %> * <%= i %> = <%= 4 * i %>
<%  } %>
<br>
4.
<%  for (int i=1; i <= 10; ++i) { %>
     4 * <%= i %> = <%= 4 * i %>
<%  } %>
<br>
5.
<tr>
<%  for (int i=1; i <= 10; ++i) { %>
     <td>4 * <%= i %> = <%= 4 * i %></td>
<%  } %>
</tr>
<br>
6.
<td>
<%  for (int i=1; i <= 10; ++i) { %>
     4 * <%= i %> = <%= 4 * i %><br />
<%  } %>
</td>

</body>
</html>
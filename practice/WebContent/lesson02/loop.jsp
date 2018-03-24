<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>반복문 사용</title>
</head>
<style>
	table{border-collapse : collaplse; }
	td{padding : 5px; border: solid 1px gray; }
</style>
<body>
<table>
	<tr>
	<%
		for(int i=1; i<=10; ++i){
			out.print("<td>"+i+"</td>");
		}
	%>
	</tr>
</table>
<table> <!-- 위의 코드와 실행 결과가 같다! -->
  <tr> 
    <td>1</td>
    <td>2</td>
    <td>3</td>
    <td>4</td>
    <td>5</td>
    <td>6</td>
    <td>7</td>
    <td>8</td>
    <td>9</td>
    <td>10</td>
  </tr>
</table>

</body>
</html>
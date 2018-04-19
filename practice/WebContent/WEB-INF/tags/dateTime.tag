<%@ tag description="pagination" pageEncoding="UTF-8"%>
<%@ tag import="java.text.SimpleDateFormat, java.util.Date" %>
<%@ attribute name="format" type="java.lang.String" required="true" %>
<%@ attribute name="date" type="java.util.Date" required="false" %>
<%
String format = (String)jspContext.getAttribute("format");//주어진 값들 꺼내서 그에 맞는 출력하도록 
Date date = (Date)jspContext.getAttribute("date");

if (date == null) date = new Date();
SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
%>
<span>
  <%= simpleDateFormat.format(date) %>
</span>

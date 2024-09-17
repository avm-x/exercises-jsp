<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex10</title>
</head>
<body>
	<h1>Exercise 10: Write a program to display a digital clock using JSP.</h1>	
	<%@ page import = "java.time.LocalTime" %>
	
	<% 
		LocalTime currTime = LocalTime.now();
		String timeStr = currTime.getHour() + ":" + currTime.getMinute() + ":" + currTime.getSecond();
	%>
	
	<p style="font-size:30px"><span id="hh"><%=currTime.getHour()%></span>:<span id="mm"><%=currTime.getMinute()%></span>:<span id="ss"><%= currTime.getSecond() %></span></p>
	
	<% 
		out.println("<script> var initialTimeStr = '" + timeStr + "'</script>");
		out.println("<script src='./js/clockScript.js'></script>");
	%>
</body>
</html>
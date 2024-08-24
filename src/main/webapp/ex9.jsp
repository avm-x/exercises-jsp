<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex9</title>
</head>
<body>
<%@ page import = "java.util.Enumeration" %>
	<h1>Exercise 9: Create an application to display HTTP header information using JSP, and display session information.</h1>
	<h2>Header table: Request headers</h2>
	<table>
	<tr>
		<th>Parameter</th>
		<th>Value</th>
	</tr>
		<%
			Enumeration reqHeaders = request.getHeaderNames();
			if(reqHeaders.hasMoreElements()){
				while(reqHeaders.hasMoreElements()){
					out.println("<tr>");
					out.println("<td>" + String.valueOf(reqHeaders.nextElement()) + "</td>");
					out.println("<td>" + request.getParameter( String.valueOf(reqHeaders.nextElement()) ) + "</td>");
					out.println("</tr>");
				}
			} else {
				out.println("<td>Sorry bro, no request parameters availables</td>");
			}
		%>
		
	</table>
	<br>
	<h2>Session table</h2>
	<table>
	<tr>
		<th>Parameter</th>
		<th>Value</th>
	</tr>
			<%
			Enumeration ssAttrs = session.getAttributeNames();
			out.println("<tr>");
			out.println("<td>" + "ID" + "</td>");
			out.println("<td>" + session.getId() + "</td>");
			out.println("<tr>");
			if(ssAttrs.hasMoreElements()){
				while(ssAttrs.hasMoreElements()){
					out.println("<tr>");
					out.println("<td>" + String.valueOf(ssAttrs.nextElement()) + "</td>");
					out.println("<td>" + request.getAttribute( String.valueOf(ssAttrs.nextElement()) ) + "</td>");
					out.println("</tr>");
				}
			} else {
				out.println("<td>Sorry bro, no session attributes availables</td>");
			}
		%>
	</table>
</body>
</html>
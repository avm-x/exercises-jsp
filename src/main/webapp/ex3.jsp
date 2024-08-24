<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ex3</title>
</head>
<body>
    <h1>Exercise 3</h1>
    <p>Write a JSP program to demonstrate the setAttribute and getAttribute method.</p>
    <span>Setting Attribute</span>
    <%
        request.setAttribute("music", "corridos");
    %>
    <br>
    <span>Retrieving Attribute</span>
    <br>
    <%
        String attName = "music";
        String attValue = String.valueOf(request.getAttribute("music"));
    %>
    <br>
    <span>attribute name: <b>  <%= attName%> </b> attValue: <b><%= attValue%></b></span>


</body>
</html>

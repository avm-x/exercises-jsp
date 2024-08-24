<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ex2</title>
</head>
<body>
    <h1>Exercise 2</h1>
    <p>Write a JSP program to demonstrate the declaration, scriplets and expressions.</p>

    <!-- Scriptlets -->
    <!-- Declaration -->
    <%!
        int n = 0;

        int increment(int toBeIncrement, int incrementBy){
            return toBeIncrement + incrementBy;
        };
    %>
    <!-- Expresions -->
    <%
        n = increment(n, 5);
    %>

    <span><b>n</b> counter: <%= n%></span>
</body>
</html>

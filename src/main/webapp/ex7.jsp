<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ex7</title>
</head>
<body>
    <h1>Exercise 7</h1>
    <p>Write a program in JSP to display the properties of an object using the useBean directive.</p>

    <jsp:useBean id="obj" class="beans.BeanEx7"/>
    <%= obj.getMusic()%>
</body>
</html>

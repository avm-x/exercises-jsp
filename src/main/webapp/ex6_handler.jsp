<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ex6_handler</title>
</head>
<body>
<%@page import="java.util.Enumeration"%>
    <h1>Exercise 6: Receiving parameter</h1>

    <%
    Enumeration parameters = request.getParameterNames();
    while(parameters != null && parameters.hasMoreElements()){
        String param = String.valueOf(parameters.nextElement());
        out.println("<span><b>name:</b> " + param + "</span>");
        out.println("<span><b>value:</b> " + request.getParameter(param) + "</span><br>");

    }
    %>
</body>
</html>
